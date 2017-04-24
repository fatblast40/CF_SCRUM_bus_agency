// Bus diagram

function createSeatRow(targetDOM, columnCount, rowNum, vertical) {
    var columnWidth = Math.floor(12 / columnCount);
    for (var seatNum = 1 ; seatNum <= columnCount; seatNum++) {
        var seatDOM = $('<div class="diagram-seat">').addClass('col-xs-'+columnWidth);
        if (vertical) {
            seatDOM.attr('id', 'seat-'+rowNum+'-'+seatNum);
        } else {
            seatDOM.attr('id', 'seat-'+seatNum+'-'+rowNum);
        }
        targetDOM.append(seatDOM);
    }
}

function createSeatGrid(targetDOM, rowCount, columnCount, vertical) {
    for (var rowNum = 1; rowNum <= rowCount; rowNum++) {
        var rowDOM = $('<div class="row diagram-row">');
        createSeatRow(rowDOM, columnCount, rowNum, vertical);
        targetDOM.append(rowDOM);
    }
}

function createBookingButton(row, column, booked) {
    var targetDOM = $('#seat-'+row+'-'+column);
    targetDOM.empty();
    var buttonDOM = $('<button class="btn">');
    if (booked) {
        buttonDOM.attr('disabled', true);
    } else {
        buttonDOM.click(function () {
            bookSeat(row, column);
        });
    }
    buttonDOM.text('sad');
    targetDOM.append(
        buttonDOM
    );
}
function bookSeat(row, column) {
    console.log('booking seat row: '+row+', column: '+column);
}

function updateSeats() {
    $.getJSON('get_seats.php', function (seats) {
        seats.forEach(function (seat) {
            createBookingButton(seat.col, seat.row, seat.booked);
        })
    })
}

$(document).ready(function () {
        createSeatGrid($('.seat-diagram'), 2, 3, false);
        updateSeats();
    }
);


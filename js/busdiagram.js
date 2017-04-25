// Bus diagram

function createSeatRow(targetDOM, startCol, endCol, rowNum, vertical) {

    for (var seatNum = startCol ; seatNum <= endCol; seatNum++) {
        var seatDOM = $('<div class="diagram-col">');
        if (vertical) {
            seatDOM.attr('id', 'seat-'+rowNum+'-'+seatNum);
        } else {
            seatDOM.attr('id', 'seat-'+seatNum+'-'+rowNum);
        }
        targetDOM.append(seatDOM);
    }
}

function createSeatGrid(targetDOM, rowCount, columnCount, vertical) {
    if (vertical) {
        rowCount = [columnCount, columnCount = rowCount][0];
    }
    for (var rowNum = 1; rowNum <= rowCount; rowNum++) {
        var rowDOM = $('<div class="diagram-row">');
        createSeatRow(rowDOM, 1, columnCount, rowNum, vertical);
        targetDOM.append(rowDOM);
    }
}

function createBookingButton(row, column, booked) {
    var targetDOM = $('#seat-'+row+'-'+column);
    targetDOM.empty();
    var buttonDOM = $('<img class="seat-image rotateimg90 " src="../pictures/seat.svg">');
    if (booked) {
        buttonDOM.attr('disabled', true);
        buttonDOM.attr('src', "../pictures/seat_company_purple.svg");

    } else {
        buttonDOM.addClass('clickable-image');
        buttonDOM.attr('src', "../pictures/seat_green.svg");
        buttonDOM.click(function () {
            bookSeat(row, column);
            buttonDOM.attr('src', "../pictures/seat_blue.svg");

        });
    }
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
        createSeatGrid($('.seats-diagram'), 2, 14, false);
        updateSeats();
    }
);


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

function createBookingButton(row, column) {
    var targetDOM = $('#seat-'+row+'-'+column);
    var buttonDOM = $('<button class="btn">');
    buttonDOM.textContent = ' ';
    targetDOM.append(
        buttonDOM
    );
}

$(document).ready(function () {
        createSeatGrid($('.seat-diagram'), 14, 4, false);
    }
);


<?php
require_once 'dbconnect.php';
require 'includes/bus_layout_data.php';

$getModelQuery = $con->prepare(<<<'SQL'
SELECT id FROM model WHERE seats = ?;
SQL
);

$truncateModelsQuery = $con->prepare(<<<'SQL'
TRUNCATE TABLE model;
SQL
);

$createModelQuery = $con->prepare(<<<'SQL'
INSERT INTO model (seats, rows, columns) VALUES (?, ?, ?);
SQL
);

$getDiscountQuery = $con->prepare(<<<'SQL'
SELECT id FROM discount WHERE rate = ?;
SQL
);

$truncateSeatsQuery = $con->prepare(<<<'SQL'
TRUNCATE TABLE seat;
SQL
);

$createSeatQuery = $con->prepare(<<<'SQL'
INSERT INTO seat (model_id, num, row, col, discount_id) 
VALUES (?, ?, ?, ?, ?);
SQL
);

$createBusQuery = $con->prepare(<<<'SQL'
INSERT INTO bus (model_id) 
VALUES (?);
SQL
);

function checkAndPrintSQLError($successMessage) {
    global $con;
    $error = $con->error;
    if ($error) {
        echo "<p>MySQL error:: $error</p>";
    } else {
        echo $successMessage;
    }
}

function addBusModel($seatCount, $seatRows, $seatColumns) {
    global $createModelQuery;
    global $con;
    $createModelQuery->bind_param('iii', $seatCount, $seatRows, $seatColumns);
    $createModelQuery->execute();
    $id = $con->insert_id;
    checkAndPrintSQLError("<p>added new bus model id: $id, seats: $seatCount, seat rows: $seatRows, columns: $seatColumns</p>");
    return $id;
}

function getModelId($seatCount) {
    global $getModelQuery;
    $getModelQuery->bind_param('i', $seatCount);
    $getModelQuery->execute();
    $modelResult = $getModelQuery->get_result();
    checkAndPrintSQLError('<p>get Bus Model</p>');
    $data = $modelResult->fetch_assoc();
    if (isset($data['id'])) {
        return $data['id'];
    }
    return null;
}



function addSeat($modelId, $seatNum, $row, $col, $discountId) {
    global $createSeatQuery;
    global $con;
    $createSeatQuery->bind_param('iiiii', $modelId, $seatNum, $row, $col, $discountId);
    $createSeatQuery->execute();
    $id = $con->insert_id;
    checkAndPrintSQLError("<p>added seat id: $id, number: $seatNum in row $row, col $col, discountID: $discountId</p>");
    return $id;
}

function addBus($modelId) {
    global $createSeatQuery;
    global $con;
    $createSeatQuery->bind_param('i', $modelId);
    $createSeatQuery->execute();
    $id = $con->insert_id;
    checkAndPrintSQLError("<p>added bus id: $id, model $modelId</p>");
    return $id;
}

function addBusLayout($modelId, $seatData)
{
    $seatNum = 1;
    foreach ($seatData as $rowNum => $seatRow) {
        foreach ($seatRow as $colNum => $seatDiscountId) {
            if ($seatDiscountId >= 1) {
                addSeat($modelId, $seatNum, $rowNum, $colNum, $seatDiscountId);
                echo "";
                $seatNum++;
            }
        }
    }
}


//$truncateModelsQuery->execute();
//$truncateSeatsQuery->execute();
global $codeBusLayout12;
global $codeBusLayout42;
global $codeBusLayout56;





$codeBus56 = addBusModel(56, 15, 6);
addBusLayout($codeBusLayout56, $codeBusLayout56);
addBus($codeBus56);
addBus($codeBus56);
addBus($codeBus56);

$codeBus42 = addBusModel(42, 11, 6);
addBusLayout($codeBusLayout42, $codeBusLayout42);
addBus($codeBus42);

$codeBus12 = addBusModel(12, 6, 3);
addBusLayout($codeBusLayout12, $codeBusLayout12);
addBus($codeBus12);

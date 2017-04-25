<?php
require_once '../dbconnect.php';

header('Content-type: application/json');


$destination = 'Salzburg';
$busQuery = $con->prepare(<<<'SQL'
SELECT rows, columns FROM route
INNER JOIN bus ON route.bus_id = bus.id
INNER JOIN model ON bus.model_id = model.id
WHERE destination = ?;
SQL
);

$busQuery->bind_param('s', $destination);
$busQuery->execute();
$busData = $busQuery->get_result()->fetch_assoc();

$seatDataQuery = $con->prepare(<<<'SQL'
SELECT * FROM route
INNER JOIN bus ON route.bus_id = bus.id
INNER JOIN model ON bus.model_id = model.id
INNER JOIN seat ON model.id = seat.model_id
WHERE destination = ?;
SQL
);



$seatDataQuery->bind_param('s', $destination);
$seatDataQuery->execute();
$seatDataResult = $seatDataQuery->get_result();
$seatData = [];
while ($seat = $seatDataResult->fetch_assoc()) {
    $seatData[] = $seat;
}
$busData['seats'] = $seatData;
echo json_encode($busData);
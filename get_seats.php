<?php
require_once 'dbconnect.php';

header('Content-type: application/json');


$destination = 'Salzburg';
$scheduleID = 1;
/*
$availabilityQuery = $con->prepare(<<<'SQL'
SELECT * FROM schedule 
INNER JOIN booking ON schedule.id = booking.schedule_id
INNER JOIN reservation ON booking.id = reservation.booking_id
WHERE schedule.id = ?
SQL
);


$availabilityQuery->bind_param('i', $scheduleID);
$availabilityQuery->execute();
$availabilityData = $availabilityQuery->get_result()->fetch_assoc();
*/


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
SELECT sea.id, sea.num as number, row, col, res.id IS NOT NULL AS booked FROM seat AS sea
LEFT JOIN reservation AS res ON sea.id = res.seat_id
LEFT JOIN discount AS dis ON sea.discount_id = dis.id
INNER JOIN model AS mo ON sea.model_id = mo.id
INNER JOIN bus AS bu ON mo.id = bu.model_id
INNER JOIN route AS rou ON bu.id = rou.bus_id
INNER JOIN schedule AS sch ON rou.id = sch.route_id
WHERE rou.destination = ? AND sch.id = ?
SQL
);



$seatDataQuery->bind_param('si', $destination, $scheduleID);
$seatDataQuery->execute();
$seatDataResult = $seatDataQuery->get_result();
$seatData = [];
while ($seat = $seatDataResult->fetch_assoc()) {
    $seat['booked'] = (bool)$seat['booked'];
    $seatData[] = $seat;
}
$busData['seats'] = $seatData;
echo json_encode($busData);
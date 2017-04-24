<?php
header('Content-type: application/json');

$busData = [
    [
        'row' => 1,
        'col' => 1,
        'booked' => false
    ],
    [
        'row' => 1,
        'col' => 2,
        'booked' => true
    ],
    [
        'row' => 1,
        'col' => 3,
        'booked' => false
    ],
    [
        'row' => 2,
        'col' => 1,
        'booked' => true
    ],
    [
        'row' => 2,
        'col' => 2,
        'booked' => false
    ],
    [
        'row' => 2,
        'col' => 3,
        'booked' => false
    ],
];


echo json_encode($busData);
<?php
// Report:  List all scheduled departures
$query_current_scheduled_depurtures = 
    "
        SELECT 
            schedule.departure AS Departure Date,
            schedule.departure AS Departure Time,    
            route.destination AS Destination,
        FROM `schedule`
            INNER JOIN `payment` on user.id = payment.user_id
            INNER JOIN `booking` on payment.id = booking.payment_id
            INNER JOIN `reservation` on booking.id = reservation.booking_id
            INNER JOIN `seat` on reservation.seat_id = seat.id
            INNER JOIN `schedule` on booking.schedule_id = schedule.id
            INNER JOIN `route` on schedule.route_id = route.id
        WHERE 
            user.id =" . $_SESSION['user'] . "
            AND date(schedule.departure) < date_format(date(now()),'%y-%m-%d');
    ";

// Report:  Number of availble seats
SELECT 
    count(seat.num)
FROM `seat`
    INNER JOIN `reservation` on seat.id = reservation.seat_id
WHERE 
    user.id =" . $_SESSION['user'] . "
    AND date(schedule.departure) < date_format(date(now()),'%y-%m-%d');


    INNER JOIN `payment` on user.id = payment.user_id
    INNER JOIN `booking` on payment.id = booking.payment_id
    
    INNER JOIN `seat` on reservation.seat_id = seat.id
    INNER JOIN `schedule` on booking.schedule_id = schedule.id
    INNER JOIN `route` on schedule.route_id = route.id

$res_historic_user_reservations = mysqli_query($con, $query_historic_user_reservations);
$row_historic_user_reservations = mysqli_fetch_array($res_historic_user_reservations);
$count_historic_user_reservations = mysqli_num_rows($row_historic_user_reservations);
?>
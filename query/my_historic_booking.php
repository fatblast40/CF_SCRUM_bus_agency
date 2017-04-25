<?php
// Report:  List all bookings and seats
$query_historic_user_reservations = "

SELECT 
    user.first_name,  
    user.last_name,
    booking.id,
    date_format(date(booking.stamp),'%d-%M %Y'),
    route.destination,
    seat.num
FROM `user`
    INNER JOIN `payment` on user.id = payment.user_id
    INNER JOIN `booking` on payment.id = booking.payment_id
    INNER JOIN `reservation` on booking.id = reservation.booking_id
    INNER JOIN `seat` on reservation.seat_id = seat.id
    INNER JOIN `schedule` on booking.schedule_id = schedule.id
    INNER JOIN `route` on schedule.route_id = route.id
WHERE 
    user.id =" . $_SESSION['user'] . "
    AND date(schedule.departure) < date_format(date(now()),'%y-%m-%d');
"

$res_historic_user_reservations = mysqli_query($con, $query_historic_user_reservations);
$row_historic_user_reservations = mysqli_fetch_array($res_historic_user_reservations);
$count_historic_user_reservations = mysqli_num_rows($row_historic_user_reservations);
?>
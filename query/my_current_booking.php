<?php
// Report:  List all bookings and seats
$query_current_user_reservations = 
    "
        SELECT 
            user.first_name AS first_name,  
            user.last_name AS last_name,
            booking.id AS booking_id,
            date_format(date(booking.stamp),'%d %M %Y') AS booking_day,
            date_format(date(schedule.departure),'%d %M %Y') AS departure_day,
            date_format(date(schedule.departure),'%H:%i') AS departure_time,
            route.destination AS destination,
            reservation.id AS reservation_id,
            seat.num AS seat_number
        FROM `user`
            INNER JOIN `payment` on user.id = payment.user_id
            INNER JOIN `booking` on payment.id = booking.payment_id
            INNER JOIN `reservation` on booking.id = reservation.booking_id
            INNER JOIN `seat` on reservation.seat_id = seat.id
            INNER JOIN `schedule` on booking.schedule_id = schedule.id
            INNER JOIN `route` on schedule.route_id = route.id
        WHERE 
            user.id =".$_SESSION['user']." 
            AND date(schedule.departure) >= date_format(date(now()),'%y-%m-%d')
    ";

$res_current_user_reservations = mysqli_query($con, $query_current_user_reservations);
// $row_current_user_reservations = mysqli_fetch_array($res_current_user_reservations);
// $count_current_user_reservations = mysqli_num_rows($res_current_user_reservations);
?>
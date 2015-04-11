<?php

    $connection = mysqli_connect([REDACTED] , [REDACTED] , [REDACTED] , [REDACTED]);
    $username = mysqli_real_escape_string($connection , $_POST["username"]);
    $password = mysqli_real_escape_string($connection , $_POST["password"]);

    $query = "SELECT * FROM users where username='$username' AND password='$password'";

    $result = mysqli_query($connection , $query);

    echo "<h1> stuyCTF Login Status: </h1>";
    if (mysqli_num_rows($result) === 1) {
        echo "<p> Logged in! </p>";
    } else {
        echo "<p> Login failed... </p>";
    }
?>

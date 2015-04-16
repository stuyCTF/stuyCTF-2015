<?php
    $connection = mysqli_connect("localhost" , "web-data" , "nginx" , "stuyctf");
    $username = $_POST["username"];
    $password = $_POST["password"];

    $query = "SELECT * FROM users where username='$username' AND password='$password'";

    $result = mysqli_query($connection , $query);

    echo "<h1> stuyCTF Login Status: </h1>";
    if (mysqli_num_rows($result) === 1) {
        echo "<p> Logged in! </p>";
    } else {
        echo "<p> Login failed... </p>";
    }
?>

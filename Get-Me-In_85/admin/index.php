<html>
<body>

<?php
$flag = "stuyctf{cOOkies_and_hAshing_go_well_together}";
$secret = "B9S0D2F3";

$username = $_POST["username"]; 
$password = $_POST["password"];

if (!empty($_COOKIE["getmein"])) {
    if ($COOKIE["getmein"] == md5($secret . urldecode($usernamme . $password))) {
        echo "Congratulations! You are a registered user.\n";
        die ("The flag is ". $flag);
    }
    else {
        die ("Your cookies don't match up! STOP HACKING THIS SITE.");
    }
}
else {
    echo "Your credentials don't seem correct...";
}

if (empty($_COOKIE["source"])) {
    setcookie("source", 0, time() + (60 * 60 * 24 * 7));
}
else {
    if ($_COOKIE["source"] != 0) {
        echo '
$flag = "XXXXXXXXXXXXXXXXXXXXXXX";
$secret = "XXXXXXXX"; // This secret is 8 characters long for security!

$username = $_POST["username"];
$password = $_POST["password"];

if (!empty($_COOKIE["getmein"])) {
    if ($COOKIE["getmein"] == md5($usernamme . $password . $secret)) {
        echo "Congratulations! You are a registered user.\n";
        die ("The flag is ". $flag);
    }
    else {
        die ("Your cookies don\'t match up! STOP HACKING THIS SITE.");
    }
}
else {
    echo "Your credentials don\'t seem correct...";
}

if (empty!($_COOKIE["source"])) {
    setcookie("source", 0, time() + (60 * 60 * 24 * 7));
}   
else {
    if ($_COOKIE["source"] != 0) {
        echo PAGE_SOURCE;
    }
}
    ';
    }
}
?>

<h1>Admins Only!</h1>
<p>If you have the correct credentials, log in below. If not, please LEAVE.</p>
<form method="POST">
    <input type="text" name="username">
    <input type="password" name="password">
    <button type="submit">
</form>

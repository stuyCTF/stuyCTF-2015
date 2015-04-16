<html>
<body>

<?php
$flag = "stuyctf{cOOkies_and_hAshing_go_well_together}";
$secret = "B9S0D2F3";

$username = (empty($_POST["username"])) ? "admin" : $_POST["username"];
$password = (empty($_POST["password"])) ? "admin" : $_POST["password"];

if (!empty($_COOKIE["getmein"])) {
    if ($username === "admin" && $password !== "admin") {
        if ($COOKIE["getmein"] === md5($secret . urldecode($username . $password))) {
            echo "Congratulations! You are a registered user.\n";
            die ("The flag is ". $flag);
        }
        else {
            die ("Your cookies don't match up! STOP HACKING THIS SITE.");
        }
    }
    else {
        die ("You are not an admin! LEAVE.");
    }
}

if (empty($_COOKIE["sample-hash"])) {
    setcookie("sample-hash", md5($secret . urlencode($username . $password)), time() + (60 * 60 * 24 * 7));
}

if (empty($_COOKIE["source"])) {
    setcookie("source", 0, time() + (60 * 60 * 24 * 7));
}
else {
    if ($_COOKIE["source"] != 0) {
        echo '<pre>
$flag = "XXXXXXXXXXXXXXXXXXXXXXX";
$secret = "XXXXXXXX"; // This secret is 8 characters long for security!

$username = (empty($_POST["username"])) ? "admin" : $_POST["username"];
$password = (empty($_POST["password"])) ? "admin" : $_POST["password"];

if (!empty($_COOKIE["getmein"])) {
    if ($username === "admin" && $password !== "admin") {
        if ($COOKIE["getmein"] === md5($secret . urldecode($username . $password))) {
            echo "Congratulations! You are a registered user.\n";
            die ("The flag is ". $flag);
        }
        else {
            die ("Your cookies don\'t match up! STOP HACKING THIS SITE.");
        }
    }
    else {
        die ("You are not an admin! LEAVE.");
    }
}

if (empty($_COOKIE{"sample-hash"])) {
    setcookie("sample-hash", md5($secret . urlencode($username . $password)), time() + (60 * 60 * 24 * 7));
}

if (empty($_COOKIE["source"])) {
    setcookie("source", 0, time() + (60 * 60 * 24 * 7));
}
else {
    if ($_COOKIE["source"] != 0) {
        echo ""; // This source code is outputted here
    }
}
    </pre>';
    }
}
?>

<h1>Admins Only!</h1>
<p>If you have the correct credentials, log in below. If not, please LEAVE.</p>
<form method="POST">
    Username: <input type="text" name="username"> <br>
    Password: <input type="password" name="password"> <br>
    <button type="submit">Submit</button>
</form>

<html>
<head>
<title> SIMPLE SQL INJECTION </title>
</head>

<body>
    <h1 style="padding-bottom: 60px;"> Login: </h1>

    <form action="login.php" method="post">
        <fieldset>
            <label for="username"> Username: </label>
            <input type="text" id="username" name="username">
            <label for="password"> Password: </label>
            <input type="password" id="password" name="password">
            <input type="submit" value="Log in...">
        </fieldset>
    </form>

</body>

</html>

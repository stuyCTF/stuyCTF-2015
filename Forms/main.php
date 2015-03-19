<html>

<head>
<title>PHP 1</title>
</head>

<body>

<?php

flag = "stuyctf{forms_2_easy}"

a = $_POST["PIN"];

show = $_POST["showsource"];

if(isset($show)) {
    echo "
        if($a === -19827747736161128312837161661727773716166727272616149001823847) {
            echo $flag;
        } else {
            echo 'User with provided PIN not found.'; 
        }
    "
}

if(isset($a)) {
    if($a === -19827747736161128312837161661727773716166727272616149001823847) {
        echo $flag;
    } else {
        echo "User with provided PIN not found.";
    }
}

?>

</body>
</html>

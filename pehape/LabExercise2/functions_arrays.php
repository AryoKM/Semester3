<?php
include 'variables.php';

$students = [$name, "Feixiao", "Topaz", "Aventurine", "Robin"];

echo $name . "<br>";
echo $age . "<br>";
echo $sex . "<br>";
echo $gpa . "<br>";
echo $isStudent ? "yes<br>" : "no<br>"; // pake ternary untuk ubah output dri boolean jdi string

include "control_flow.php";

function greet($name) {return "Hello " . $name;}

foreach ($students as $student) {echo greet($student) . "<br>";}

?>
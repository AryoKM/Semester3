<?php
include 'variables.php';

$students = [$student->name, "Feixiao", "Topaz", "Aventurine", "Robin"];

echo $student->name . "<br>";
echo $student->age . "<br>";
echo $student->sex . "<br>";
echo $student->gpa . "<br>";
echo $student->isStudent ? "yes<br>" : "no<br>"; // pake ternary untuk ubah output dri boolean jdi string

include "control_flow.php";

function greet($name) {return "Hello " . $name;}

foreach ($students as $student) {echo greet($student) . "<br>";}

?>
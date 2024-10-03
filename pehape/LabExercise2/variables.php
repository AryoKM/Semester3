<?php
class Student {
    public $name;
    public $age;
    public $sex;
    public $gpa;
    public $isStudent;

    public function __construct() {
        $this->name = "Aryo K.M";
        $this->age = date_diff(date_create("04-01-2004"), date_create(date("d-m-Y")))->y;
        $this->sex = "Male";
        $this->gpa = "3.87";
        $this->isStudent = true;
    }
}

$student = new Student();

?>
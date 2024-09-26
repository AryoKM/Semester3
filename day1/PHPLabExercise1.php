<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Pehape</title>
<link href='https://fonts.googleapis.com/css?family=Open Sans' rel='stylesheet'>
<style>
body {font-family: 'Open Sans';font-size: 22px; background-color: white;}
hr {border: 2px solid; border-radius: 2px;}
h4 {text-align: center;}
main {margin-left: 20%; margin-right: 20%; margin-top: 10%; margin-bottom: 10%; background-color: #bababa; padding: 20px; border-radius: 10px;}
.titel {color: white;}
.tombol {background-color: blue; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer;}
</style>

</head>

<body>
<main>
    
<!-- latihan -->
<h2 class="titel">Latihan</h2>

<?php
echo '<h4>Hello, World!</h4>';

$greeting = '<h4>halo dunia</h4>';
echo $greeting;

echo '<h4>tanggal hari ini:  ' . date('l, d-m-Y') . '</h4>';

echo '<h4>tanggal besok: ' . date('l, d-m-Y', strtotime('+1 day')) . '</h4>';
echo '<h4>tanggal lusa: ' . date('l, d-m-Y', strtotime('+172,800 second')) . '</h4>'; //kocak

$name = 'Aduh';
$name .= ' Alim';
echo $name;
?>

<hr>

<!-- tugas -->
<h2 class="titel">Number 1</h2>

 <?php
$max = 10; $min = 1;
if (isset($_POST['totalAngka'])) {$angka = $_POST['totalAngka']; $angka = max($min, min($max, $angka)); //perolsa apakah data  totalAngka ada di dalam permintaan POST lalu nilainya di ambil
}

function palindrome($wes)
{
    $result = "";
    for ($k = 1; $k <= $wes; $k++) { // susun format
        $palindrome = str_repeat("1", $k);
        $result .= '<p style="text-align: center; margin: auto;">' . $palindrome . ' x ' . $palindrome . ' = '; //ruas kiri palindrome di kali
        $result .= $palindrome * $palindrome; $result .= "</p>"; //ruas kanan palindrome hasil perkalian 
    }
    return $result;
}
?>

<form action="" method="post">
    
<label for="satu">masukkan perkalian palindrome: </label><input type="number" name="totalAngka" id="satu" placeholder="(max 10)"' : ''; ?>

<?php
if (isset($angka)) {echo palindrome($angka);}
?>

<h2 class="titel">Number 2</h2>

<?php
$max = 10; $min = 1; $erg = "/^\[(([0-9])([\,][0-9]){0,}){1,}\]$/";
$isError = true;
$execute = false;

if(isset($_POST['submit'])){ //cek submit di kirim lewat POST
    $array1 = $_POST['array1'] ?? '';//jika kosong diberi nilai default kosong
    $array2 = $_POST['array2'] ?? '';
    $m = $_POST['m'] ?? '';//ambil nilai m & n dari POST
    $n = $_POST['n'] ?? '';

    if (preg_match($erg, $array1) && preg_match($erg, $array2)) {
        $isError = false;
        $array1 = explode(",", substr($array1, 1, -1));
        $array2 = explode(",", substr($array2, 1, -1));
        $n = max($min, min($max, $n));
        $m = max($min, min($max, $m));

        if (!empty($array1) && !empty($array2) && !empty($m) && !empty($n)) {
            $execute = true;
        }
    }
}
?>

<div>
    <form action="" method="post">
        <table>
            <tr>
                <td><label for="array1">Array 1:</label></td>
                <td><input type="text" id="array1" value="<?= (isset($array1)) ? '[' . implode(",", $array1) . ']' : ''; ?>" pattern="<?= substr($erg, 1, strlen($erg) - 2); ?>" placeholder="Format: [0,1,2,..]" name="array1"></td>
            </tr>
            <tr>
                <td><label for="array2">Array 2:</label></td> <!-- input array1 & array2, pakai regex untuk validasi -->
                <td><input type="text" id="array2" value="<?= (isset($array2)) ? '[' . implode(",", $array2) . ']' : ''; ?>" pattern="<?= substr($erg, 1, strlen($erg) - 2); ?>" placeholder="Format: [0,1,2,..]" name="array2"></td>
            </tr>
            <tr>
                <td><label for="m">Value m:</label></td>
                <td><input type="number" id="m" name="m" value="<?= (isset($m)) ? $m : ''; ?>" placeholder="masukkan nilai m" min="<?= $min; ?>" <?= ($max > 0) ? 'max="' . $max . '"' : ''; ?>></td>
            </tr>
            <tr>
                <td><label for="n">Value n:</label></td> <!-- input m & n dengan nilai min dan max berdasarkan variabel -->
                <td><input type="number" id="n" name="n" value="<?= (isset($n)) ? $n : ''; ?>" placeholder="masukkan nilai n" min="<?= $min; ?>" <?= ($max > 0) ? 'max="' . $max . '"' : ''; ?>></td>
            </tr>
            <tr>    
                <td><button type="submit" name="submit" class="tombol">Submit</button></td>
            </tr>
        </table>
    </form>
</div>

<?php
function execute($array1, $array2, $m, $n)
{
    if ($m > count($array1)) {
        $m = count($array1); //jika array1 & array2 besar, maka set $m & $n menjadi panjang array1
    }
    if ($n > count($array2)) {
        $n = count($array2);
    }
    
    $resultArray = array_merge(array_slice($array1, 0, $m), array_slice($array2, 0, $n));
    sort($resultArray); //hasil array di sort
    
    echo 'Hasil: ' . implode(', ', $resultArray); //hasil sort di jadikan string
}

if ($execute) { // jika flag $execute bernilai true maka execute
    execute($array1, $array2, $m, $n);
}
?>

</main>
</body>
</html>
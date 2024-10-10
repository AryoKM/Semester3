<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Pehape</title>

    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>

    <style>
    * {font-family: 'Poppins';font-size: 22px;}
    .title {color: #e81e61;}
    .author {color: #5295f2;}
    .year {color: #4cb054;}
    </style>

</head>

<body>
    <h2>Enter Book Details</h2>
    <form action="" method="GET" id="book-form">
        <label for="type">Book Type:</label>
        <select name="type" id="type">
            <option value="book">Select Book Type</option>
            <option value="ebook">E-Book</option>
            <option value="printedBook">Printed Book</option>
        </select>
        <br><br>

        <label for="title" class="title">Title:</label>
        <input type="text" id="title" name="title" required maxlength="100"><br><br>

        <label for="author" class="author">Author:</label>
        <input type="text" id="author" name="author" required maxlength="100"><br><br>

        <label for="year" class="year">Year:</label>
        <input type="number" id="year" name="year" required min="1500" max="2024"><br><br>

        <div id="ebook-options" style="display:none;">
            <label for="fileSize">File Size:</label>
            <input type="number" id="fileSize" name="fileSize" min="1" max="100"><br><br>
        </div>

        <div id="printedBook-options" style="display:none;">
            <label for="pages">Number of Pages:</label>
            <input type="number" id="pages" name="pages" min="1"><br><br>
        </div>

        <button type="submit" id="submit-btn" disabled>Submit</button>
    </form>

    <script>
        const bookTypeSelect = document.getElementById('type');
        const submitBtn = document.getElementById('submit-btn');
        const form = document.getElementById('book-form');

        bookTypeSelect.addEventListener('change', function() {
            const type = this.value;

            document.getElementById('ebook-options').style.display = (type === 'ebook') ? 'block' : 'none';
            document.getElementById('printedBook-options').style.display = (type === 'printedBook') ? 'block' : 'none';

            if (type === 'book') {
                submitBtn.disabled = true;
            } else {
                submitBtn.disabled = false;
            }
        });

        form.addEventListener('submit', function(event) {
            const title = document.getElementById('title').value;
            const author = document.getElementById('author').value;
            const year = parseInt(document.getElementById('year').value);
            const fileSize = document.getElementById('fileSize').value;

            if (year < 1500 || year > 2024) {
                alert('Publication year must be between 1500 and 2024.');
                event.preventDefault();  // form tidak tersubmit kalau validasi tidak uh.. valid
                return;
            }

            if (bookTypeSelect.value === 'ebook' && (fileSize < 1 || fileSize > 100)) {
                alert('File size for an ebook must be between 1 and 100 MB.');
                event.preventDefault();
                return;
            }
        });
    </script>

    <h2>Output:</h2>

    <?php

session_start(); //bikin sesi spy bisa tersimpan 🗿

if (!isset($_SESSION['books'])) {
    $_SESSION['books'] = array();
}

class Book {
    protected $title;
    protected $author;
    protected $year;

    public function __construct($title, $author, $year) {
        $this->title = $title;
        $this->author = $author;
        $this->year = $year;
    }

    public function getTitle() {
        return $this->title;
    }

    public function getAuthor() {
        return $this->author;
    }

    public function getYear() {
        return $this->year;
    }

    public function display() {
        echo "<p><span style='color: #e81e61;'>Title:</span> {$this->getTitle()}</p>";
        echo "<p><span style='color: #5295f2;'>Author:</span> {$this->getAuthor()}</p>";
        echo "<p><span style='color: #4cb054;'>Year:</span> {$this->getYear()}</p>";
    }
}

class EBook extends Book {
    private $fileSize;

    public function __construct($title, $author, $year, $fileSize) {
        parent::__construct($title, $author, $year);
        $this->fileSize = $fileSize;
    }

    public function display() {
        parent::display();
        echo "<p>File Size: {$this->fileSize} MB</p>";
    }
}

class printedBook extends Book {
    private $pages;

    public function __construct($title, $author, $year, $pages) {
        parent::__construct($title, $author, $year);
        $this->pages = $pages;
    }

    public function display() {
        parent::display();
        echo "<p>Number of Pages: {$this->pages}</p>";
    }
}

if ($_GET) {
    $type = $_GET['type'];
    $title = $_GET['title'];
    $author = $_GET['author'];
    $year = $_GET['year'];

    if ($type === 'ebook') {
        $fileSize = $_GET['fileSize'];
        $ebook = new EBook($title, $author, $year, $fileSize);
        $_SESSION['books'][] = $ebook;
    } elseif ($type === 'printedBook') {
        $pages = $_GET['pages'];
        $printedBook = new printedBook($title, $author, $year, $pages);
        $_SESSION['books'][] = $printedBook;
    } else {
        $book = new Book($title, $author, $year);
        $_SESSION['books'][] = $book;
    }
}

if (!empty($_SESSION['books'])) {
    foreach ($_SESSION['books'] as $book) {
        $book->display();
        echo "<hr>";
    }
}
?>


</body>
</html>

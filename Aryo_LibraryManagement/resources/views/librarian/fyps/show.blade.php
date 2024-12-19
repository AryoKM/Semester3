<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Show CD</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background: lightgray">

    <div class="container mt-5">
        <h3>{{ $cd->title }}</h3>
        <p><strong>Artist:</strong> {{ $cd->artist }}</p>
        <p><strong>Genre:</strong> {{ $cd->genre }}</p>
        <p><strong>Stock:</strong> {{ $cd->stock }}</p>
        <a href="{{ route('cds.index') }}" class="btn btn-primary mt-3">Back to CDs List</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

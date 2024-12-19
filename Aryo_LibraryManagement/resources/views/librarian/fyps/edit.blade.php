<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit FYP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background: lightgray">

    <div class="container mt-5">
        <form action="{{ route('fyps.update', $fyp->id) }}" method="POST" class="p-4 bg-white shadow-sm rounded">
            @csrf
            @method('PUT')

            <!-- Title -->
            <div class="mb-3">
                <label class="form-label">Title</label>
                <input type="text" class="form-control @error('title') is-invalid @enderror" name="title" value="{{ old('title', $fyp->title) }}" placeholder="Enter FYP Title">
                @error('title')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>

            <!-- Author -->
            <div class="mb-3">
                <label class="form-label">Author</label>
                <input type="text" class="form-control @error('author') is-invalid @enderror" name="author" value="{{ old('author', $fyp->author) }}" placeholder="Enter Author Name">
                @error('author')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>

            <!-- Supervisor -->
            <div class="mb-3">
                <label class="form-label">Supervisor</label>
                <input type="text" class="form-control @error('supervisor') is-invalid @enderror" name="supervisor" value="{{ old('supervisor', $fyp->supervisor) }}" placeholder="Enter Supervisor Name">
                @error('supervisor')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>

            <!-- Year -->
            <div class="mb-3">
                <label class="form-label">Year</label>
                <input type="number" class="form-control @error('year') is-invalid @enderror" name="year" value="{{ old('year', $fyp->year) }}" placeholder="Enter Year">
                @error('year')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>

            <!-- Buttons -->
            <button type="submit" class="btn btn-primary">Update</button>
            <a href="{{ route('fyps.index') }}" class="btn btn-secondary">Cancel</a>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

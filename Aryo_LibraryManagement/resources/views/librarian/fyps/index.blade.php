<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FYPs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background: #f8f9fa">

    <div class="container mt-4">
        <h3 class="text-center mb-3">Library Management System - FYPs</h3>
        <nav class="nav justify-content-center mb-3">
            <a href="{{ route('books.index') }}" class="nav-link">Books</a>
            <a href="{{ route('cds.index') }}" class="nav-link">CDs</a>
            <a href="{{ route('journals.index') }}" class="nav-link">Journals</a>
            <a href="{{ route('newspapers.index') }}" class="nav-link">Newspapers</a>
            <a href="{{ route('fyps.index') }}" class="nav-link active">FYPs</a>
            <form method="POST" action="{{ route('logout') }}" class="d-inline">
                @csrf
                <button type="submit" class="btn btn-link nav-link text-danger">Log Out</button>
            </form>
        </nav>
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <a href="{{ route('fyps.create') }}" class="btn btn-success mb-3">Add FYP</a>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Author</th>
                            <th>Supervisor</th>
                            <th>Year</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($fyps as $fyp)
                            <tr>
                                <td>{{ $fyp->title }}</td>
                                <td>{{ $fyp->author }}</td>
                                <td>{{ $fyp->supervisor }}</td>
                                <td>{{ $fyp->year }}</td>
                                <td>{{ $fyp->is_approved ? 'Approved' : 'Pending' }}</td>
                                <td>
                                    <a href="{{ route('fyps.show', $fyp->id) }}" class="btn btn-dark btn-sm">Show</a>
                                    <a href="{{ route('fyps.edit', $fyp->id) }}" class="btn btn-primary btn-sm">Edit</a>
                                    <form onsubmit="return confirm('Are you sure?');" action="{{ route('fyps.destroy', $fyp->id) }}" method="POST" class="d-inline">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                    </form>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="6" class="text-center text-danger">No FYPs available.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
                {{ $fyps->links() }}
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
        @if(session('success'))
            Swal.fire({
                icon: "success",
                title: "Success",
                text: "{{ session('success') }}",
                timer: 2000,
                showConfirmButton: false
            });
        @elseif(session('error'))
            Swal.fire({
                icon: "error",
                title: "Failed",
                text: "{{ session('error') }}",
                timer: 2000,
                showConfirmButton: false
            });
        @endif
    </script>

</body>
</html>

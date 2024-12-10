<?php

namespace App\Http\Controllers;

use App\Models\Cd;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;

class CdController extends Controller
{
    /**
     * Display a listing of the CDs.
     *
     * @return View
     */
    public function index(): View
    {
        $cds = Cd::latest()->paginate(10);

        return view('cds.index', compact('cds'));
    }

    /**
     * Show the form for creating a new CD.
     *
     * @return View
     */
    public function create(): View
    {
        return view('cds.create');
    }

    /**
     * Store a newly created CD in storage.
     *
     * @param Request $request
     * @return RedirectResponse
     */
    public function store(Request $request): RedirectResponse
    {
        $validatedData = $request->validate([
            'title' => 'required|string|max:255',
            'author' => 'required|string|max:255',
            'category' => 'required|string|max:255',
            'publication_date' => 'required|date',
            'description' => 'required|string',
            'is_accessible' => 'required|in:requested,granted,denied',
        ]);

        Cd::create($validatedData);

        return redirect()->route('cds.index')->with(['success' => 'CD Successfully Created!']);
    }

    /**
     * Show the form for editing the specified CD.
     *
     * @param string $id
     * @return View
     */
    public function edit(string $id): View
    {
        $cd = Cd::findOrFail($id);

        return view('cds.edit', compact('cd'));
    }

    /**
     * Update the specified CD in storage.
     *
     * @param Request $request
     * @param string $id
     * @return RedirectResponse
     */
    public function update(Request $request, string $id): RedirectResponse
    {
        $validatedData = $request->validate([
            'title' => 'required|string|max:255',
            'author' => 'required|string|max:255',
            'category' => 'required|string|max:255',
            'publication_date' => 'required|date',
            'description' => 'required|string',
            'is_accessible' => 'required|in:requested,granted,denied',
        ]);

        $cd = Cd::findOrFail($id);
        $cd->update($validatedData);

        return redirect()->route('cds.index')->with(['success' => 'CD Successfully Updated!']);
    }

    /**
     * Remove the specified CD from storage.
     *
     * @param string $id
     * @return RedirectResponse
     */
    public function destroy(string $id): RedirectResponse
    {
        $cd = Cd::findOrFail($id);
        $cd->delete();

        return redirect()->route('cds.index')->with(['success' => 'CD Successfully Deleted!']);
    }
}

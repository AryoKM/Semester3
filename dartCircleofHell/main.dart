class Vertex {
  int id;
  bool visited = false;
  Vertex(this.id);
}

class Graph {
  List<Vertex> vertices;
  List<List<int>> adjacencyMatrix;

  Graph(this.vertices, this.adjacencyMatrix);

  // cari titik terdekat yang belum dikunjungi dari indeks saat ini yang diberikan
  int findNearestUnvisitedVertex(int currentIndex) {
    int nearestIndex = -1;
    int minValue = double.maxFinite.toInt();

    for (int i = 0; i < adjacencyMatrix[currentIndex].length; i++) {
      if (!vertices[i].visited &&
          adjacencyMatrix[currentIndex][i] < minValue &&
          adjacencyMatrix[currentIndex][i] != 0) {
        minValue = adjacencyMatrix[currentIndex][i];
        nearestIndex = i;
      }
    }

    return nearestIndex;
  }

  // melakukan algoritma sesuai flowchart
  traverse() {
    for (int i = 0; i < vertices.length; i++) {
      if (vertices[i].visited) continue;

      int currentIndex = i;
      while (!vertices[currentIndex].visited) {
        vertices[currentIndex].visited = true;
        int nearestIndex = findNearestUnvisitedVertex(currentIndex);

        if (nearestIndex != -1) {
          print('Connecting vertex ${vertices[currentIndex].id} to vertex ${vertices[nearestIndex].id}');
          currentIndex = nearestIndex;
        } else {
          break;
        }
      }
    }
  }
}

main() {
  // contoh graph dengan 5 vertices
  var vertices = List.generate(5, (index) => Vertex(index));
  
  // matriks ketetanggaan mewakili koneksi grafik dan bobot (0 menunjukkan tidak ada koneksi)
  var adjacencyMatrix = [
    [0, 2, 0, 6, 0],
    [2, 0, 3, 8, 5],
    [0, 3, 0, 0, 7],
    [6, 8, 0, 0, 9],
    [0, 5, 7, 9, 0]
  ];

  var graph = Graph(vertices, adjacencyMatrix);
  graph.traverse();
}

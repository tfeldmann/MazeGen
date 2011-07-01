/*
    Maze
    ©2011, Thomas Feldmann
*/
 
class Maze
{  
  // Properties
  // ----------
  ArrayList cells;
  int[][] grid;
  
  int N = unbinary("00000001");
  int O = unbinary("00000010");
  int S = unbinary("00000100");
  int W = unbinary("00001000");
 
  
  // Constructor and maze generation
  // -------------------------------
  Maze(int cols, int rows)
  {
    cells = new ArrayList();
    grid  = new int[rows][cols];
    
    // starting point
    cells.add(new MazeCell(0, 0));
    
    // growing tree algorithm
    while (cells.size() > 0)
    {
      // backtrack to newest cell
      int index = cells.size() - 1;
      MazeCell cell = (MazeCell) cells.get(index);
      int x = cell.x;
      int y = cell.y;
      
      // select a neighbour
      int nx = x + (-1 + int(random(2)) * 2);
      int ny = y + (-1 + int(random(2)) * 2);
      
      if (nx >= 0 && ny >= 0 && nx < cols && ny < rows && grid[ny][nx] == 0)
      {
        // TODO: Continue working on the algorithm here,
        // it doesn't work.
/*      
        grid[y][x] |= dir;
        grid[ny][nx] |= OPPOSITE[dir]
        cells.add(new MazeCell(nx, ny));
        index = -1;
        break;
*/
      }
      
      index = 0; // Remoxe after uncommenting the above
      if (index != -1)
      { 
        cells.remove(index);
      }
    }
  }
  
  
  // Drawing Method
  // --------------
  void draw(int cellSize)
  {
    ellipse(100, 100, cellSize, cellSize);
  }
}

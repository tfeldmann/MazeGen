/*
    Maze
    ©2011, Thomas Feldmann
 */

class Maze
{  
  // Properties
  // ----------
  int rows, cols;
  int[][] grid;
  
  int dir[] = {
    unbinary("0001"), // North
    unbinary("0010"), // East
    unbinary("0100"), // South
    unbinary("1000")  // West
  };
    
  int opposite[] = {
    unbinary("0100"), // South
    unbinary("1000"), // West
    unbinary("0001"), // North
    unbinary("0010")  // East
  };

  int dx[] = {0, 1,  0, -1};
  int dy[] = {1, 0, -1,  0};


  // Constructor and maze generation
  // -------------------------------
  Maze(int cols, int rows)
  {
    // variables
    // ---------
    this.rows = rows;
    this.cols = cols;

    ArrayList cells = new ArrayList();
    grid = new int[cols][rows];

    
    // Define 0|0 as starting point
    // ----------------------------
    cells.add(new MazeCell(0, 0));


    // start growing tree algorithm
    // ----------------------------
    while (cells.size() > 0)
    {      
      
      // backtrack to newest cell
      // ------------------------
      int index = cells.size() - 1;
      MazeCell cell = (MazeCell) cells.get(index);
      int x = cell.x;
      int y = cell.y;


      // shuffle possible directions
      // ---------------------------
      Integer[] directions = new Integer[4];
      for (int i = 0; i < directions.length; i++)
      {
        directions[i] = new Integer(i);
      }
      java.util.Collections.shuffle(java.util.Arrays.asList(directions));
      
      
      // try visiting neighbour cells
      // ----------------------------
      for (int i = 0; i < directions.length; i++)
      {
        int selDir = int(directions[i]);
        int nx = x + dx[selDir];
        int ny = y + dy[selDir];
        
        
        // if new cell is unvisited carve passage
        // --------------------------------------
        if (nx >= 0 && ny >= 0 && nx < cols && ny < rows && grid[nx][ny] == 0)
        {
           grid[x][y]   |= dir[selDir];
           grid[nx][ny] |= opposite[selDir];
           cells.add(new MazeCell(nx, ny));
           index = -1;
           break;
        }
      }
      
      // dead end: remove cell from list
      // -------------------------------
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
    
    // draw line when no passage is carved
    // -----------------------------------
    for (int y = 0; y < rows; y++)
    {
      for (int x = 0; x < cols; x++)
      {
        // north
        if ((grid[x][y] & dir[0]) == 0)
          line(x * cellSize, (y+1) * cellSize,
               (x+1) * cellSize, (y+1) * cellSize);
          
        // east
        if ((grid[x][y] & dir[1]) == 0)
          line((x+1) * cellSize, y * cellSize,
               (x+1) * cellSize, (y+1) * cellSize);
        
        // south
        if ((grid[x][y] & dir[2]) == 0)
          line(x * cellSize, y * cellSize,
               (x+1) * cellSize, y * cellSize);
          
        // west
        if ((grid[x][y] & dir[3]) == 0)
          line(x * cellSize, y * cellSize,
               x * cellSize, (y+1) * cellSize);
      }
    }
    
  }
  
}


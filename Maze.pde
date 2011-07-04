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

  int dx[] = {0, 1, 0, -1};
  int dy[] = {1, 0, -1, 0};


  // Constructor and maze generation
  // -------------------------------
  Maze(int cols, int rows)
  {
    // variables
    // ---------
    this.rows = rows;
    this.cols = cols;

    ArrayList cells = new ArrayList();
    grid  = new int[cols][rows];

    
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

      // select a neighbour
      int nDir = 4;
      Integer[] possibleDirections = new Integer[nDir];
      for (int i = 0; i < possibleDirections.length; i++)
      {
        possibleDirections[i] = new Integer(i);
      }
      java.util.Collections.shuffle(java.util.Arrays.asList(possibleDirections));
      
      for (int i = 0; i < possibleDirections.length; i++)
      {
        int directionIndex = int(possibleDirections[i]);
        int nx = x + dx[directionIndex];
        int ny = y + dy[directionIndex];
        
      
        if (nx >= 0 && ny >= 0 && nx < cols && ny < rows && grid[nx][ny] == 0)
        {
           grid[x][y]   |= dir[directionIndex];
           grid[nx][ny] |= opposite[directionIndex];
           cells.add(new MazeCell(nx, ny));
           index = -1;
           break;
        }
      }
      
      // remove cell from list if there are no
      // unused neighbour cells
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
    for (int y = 0; y < rows; y++)
    {
      for (int x = 0; x < cols; x++)
      {
        stroke(0,0,0);
          line(x * cellSize, y * cellSize, (x+1) * cellSize, y * cellSize);
          line((x+1) * cellSize, y * cellSize, (x+1) * cellSize, (y+1) * cellSize);
          line(x * cellSize, (y+1) * cellSize, (x+1) * cellSize, (y+1) * cellSize);
          line(x * cellSize, y * cellSize, x * cellSize, (y+1) * cellSize);
          
        stroke(255, 255, 255);
        if ((grid[x][y] & dir[0]) > 0)
          line(x * cellSize, y * cellSize, (x+1) * cellSize, y * cellSize);
        if ((grid[x][y] & dir[1]) > 0)
          line((x+1) * cellSize, y * cellSize, (x+1) * cellSize, (y+1) * cellSize);
        if ((grid[x][y] & dir[2]) > 0)
          line(x * cellSize, (y+1) * cellSize, (x+1) * cellSize, (y+1) * cellSize);
        if ((grid[x][y] & dir[3]) > 0)
          line(x * cellSize, y * cellSize, x * cellSize, (y+1) * cellSize);
      }
    }
  }
}


/*
    Maze
    ©2011, Thomas Feldmann
*/
 
class Maze
{  
  // Properties
  // ----------
  ArrayList cells;

  
  // Constructor and maze generation
  // -------------------------------
  Maze(int cols, int rows)
  {
    cells = new ArrayList();
    
    for (int r = 0; r < rows; r++)
    {
      for (int c = 0; c < cols; c++)
      {
        cells.add(new MazeCell(r, c));
      }
    }
  }
  
  
  // Drawing Method
  // --------------
  void draw(int cellSize)
  {
    for (int i = 0; i < cells.size(); i++)
    {
      MazeCell cell = (MazeCell) cells.get(i);
      cell.draw(cellSize);
    }
  }
}

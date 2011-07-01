/*
    Maze
    ©2011, Thomas Feldmann
*/
 
class Maze
{  
  // Properties
  // ----------
  
  int[][] grid;
  
  int N = unbinary("00000001");
  int O = unbinary("00000010");
  int S = unbinary("00000100");
  int W = unbinary("00001000");
 
  
  // Constructor and maze generation
  // -------------------------------
  Maze(int cols, int rows)
  {
    grid = new int[rows][cols];
  }
  
  
  // Drawing Method
  // --------------
  void draw(int cellSize)
  {

  }
}

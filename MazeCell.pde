/*
    Cell
    ©2011, Thomas Feldmann
*/

class MazeCell
{
  int x, y;
  
  MazeCell(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  void draw(int cellSize)
  {
    ellipse(x * cellSize, y * cellSize, cellSize, cellSize);
  }
}

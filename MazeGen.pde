/*
    Labyrinth Generator
    ©2011, Thomas Feldmann
*/

// Settings
// --------
int ROWS      = 20;
int COLS      = 20;
int CELL_SIZE = 15;


Maze maze;

void setup()
{
  size(COLS * CELL_SIZE + 1, ROWS * CELL_SIZE + 1);
  background(255, 255, 255);
  smooth();
  
  noLoop();
  
  maze = new Maze(COLS, ROWS);
}

void draw()
{
  maze.draw(CELL_SIZE);
}

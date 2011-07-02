/*
    Labyrinth Generator
    ©2011, Thomas Feldmann
*/

// Settings
// --------
int ROWS      = 5;
int COLS      = 5;
int CELL_SIZE = 15;
Maze maze;

void setup()
{
  size(COLS * CELL_SIZE, ROWS * CELL_SIZE);
  smooth();
  noLoop();
  
  maze = new Maze(COLS, ROWS);
}

void draw()
{
  maze.draw(CELL_SIZE);
}

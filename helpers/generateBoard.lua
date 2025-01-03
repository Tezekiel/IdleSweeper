function generateBoard(rows, columns, mineCount)
  local board = {}

  -- initialize board as all non-mines
  for i = 1, rows do
    board[i] = {}
    for j = 1, columns do
      board[i][j] = Field(i, j)
    end
  end

  -- directions to check for mines
  local directions = {
    { 0, -1 },
    { 0, 1 },
    { -1, 0 },
    { 1, 0 },
    { -1, -1 },
    { 1, 1 },
    { -1, 1 },
    { 1, -1 }
  }

  -- place mines
  for i = 1, mineCount do
    repeat -- repeat until we find a non-mine field
      row = love.math.random(1, rows)
      column = love.math.random(1, columns)
    until not board[row][column].isMine

    board[row][column]:convertToMine()

    for _, dir in ipairs(directions) do
      local adjRow = row + dir[1]
      local adjColumn = column + dir[2]
      if adjRow >= 1 and adjRow <= rows and adjColumn >= 1 and adjColumn <= columns then
        if not board[adjRow][adjColumn].isMine then
          board[adjRow][adjColumn].adjacentMines = board[adjRow][adjColumn].adjacentMines + 1
        end
      end
    end
  end

  return board
end
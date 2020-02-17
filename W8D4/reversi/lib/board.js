let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  // let result = []; 
  let result = [];
  for(let i = 0; i < 8; i++) {
    result[i] = new Array(8);
  };
  
  result[4][4] = new Piece("white");
  result[3][3] = new Piece("white");
  result[3][4] = new Piece("black");
  result[4][3] = new Piece("black");
  return result
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  let x = pos[0]
  let y = pos[1];
  if (!this.isValidPos(pos)){
    throw new Error('Not valid pos!');
  }
  else {
    return (this.grid[x][y]);

  }
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return (this.validMoves(color).length != 0)
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if (this.isOccupied(pos)) {
    return this.getPiece(pos).color === color;
  }
  else {
    return false; 
  }
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return this.getPiece(pos) != undefined 
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  // let test = new Board;
  // debugger
  // if (this === test) {

  //   return false
  // }
  // else {
  // debugger
    return (!this.hasMove("black") && !this.hasMove("white"))
  // }
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let x = pos[0];
  let y = pos[1];
  return ((x >= 0 &&  x <= 7) && (y >= 0 && y <= 7));

};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip) {
  // debugger
  if (!board.isValidPos(pos)){
    // if (piecesToFlip === []) {
    //   return null;
    // } 
    // else 
    //   return piecesToFlip;
    return null
  }
  else if (!board.isOccupied(pos)){
    return null;
  }
  // else if (piecesToFlip === []){
  //   return null;
  // }
  else if (board.isMine(pos,color)){
    if (piecesToFlip.length === 0) {
      return null
    } 
    else {
      return piecesToFlip;
    }
  }
  else {
    piecesToFlip.push(pos)
    let new_position = [];
    new_position[0] = pos[0] + dir[0] ; 
    new_position[1] = pos[1] + dir[1] ; 
    return _positionsToFlip(board, new_position, color, dir, piecesToFlip)
  }
}

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  let piece = this.getPiece(pos); 
  if (this.validMove(pos, color)) {
    // debugger 
    this.grid[pos[0]][pos[1]] = new Piece(color) ;
    Board.DIRS.forEach(dir => {
      let new_position = [];
      new_position[0] = pos[0] + dir[0];
      new_position[1] = pos[1] + dir[1];
      let pieces_to_flip = _positionsToFlip(this, new_position, color, dir, []);
      if (pieces_to_flip != null) {
        pieces_to_flip.forEach( piece_pos => {
           this.getPiece(piece_pos).flip()
         })
      }
    })
    // debugger
  }
  else {
    throw new Error("Invalid Move")
  }
};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  for(let i = 0; i < this.grid.length; i++){
    let line = this.grid[i]; 
    let result = []; 
    for(let j = 0; j < 8; j++){
      if (line[j] != undefined ) {
        result.push(line[j].toString())
      }
      else {
        result.push("_")
      }
    }
    console.log(result.join(" "));
  }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (!this.isValidPos(pos)) {
    return false;
  };
  if (!this.isOccupied(pos)) {
    let valid = false ;
    Board.DIRS.forEach(dir => {
      let new_position = [];
      new_position[0] = pos[0] + dir[0];
      new_position[1] = pos[1] + dir[1]; 
      if (_positionsToFlip(this, new_position, color, dir, []) != null) {
        // debugger
        valid = true 
      }
    })
    return valid
  }
  else 
    return false ;
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let moves = [] ;
  for(let i = 0; i < this.grid.length ; i++) {
    for(let j = 0; j < this.grid.length; j++) {
      if (this.validMove([i,j], color)) {
        // debugger
        moves.push([i,j]);
      }
    }
  }
  // debugger
  return moves
};

module.exports = Board;

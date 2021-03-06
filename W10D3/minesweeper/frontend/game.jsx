import React from 'react'
import * as Minesweeper from '../minesweeper'
import Board from './board'

export default class Game extends React.Component{
    constructor(){
        super();
        this.state = {board: new Minesweeper.Board(7, 6)};
        this.updateGame = this.updateGame.bind(this)
    }

    updateGame(){

    }

    render(){
        return(
            <div className="game">
                <Board 
                board={this.state.board} 
                updateGame={this.updateGame} />
              
            </div>
        )
    }
}

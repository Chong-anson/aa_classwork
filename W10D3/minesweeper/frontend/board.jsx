import React from 'react'
import Tile from './tile'

export default class Board extends React.Component {
    constructor(props) {
        super(props)

    }

    render() {
        const board = this.props.board.grid.map((row, i) => {
            const newRow = row.map((el, j) => {
                return (<Tile el={el} updateGame={this.props.updateGame} key={[i,j]}/>)
            })
            return <div className="row" key={i}> {newRow} </div>
        })

        return (
            <div className="board">
                {board}
            </div> 
        )
    }
}


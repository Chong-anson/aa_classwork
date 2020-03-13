import React from 'react'

export default class Tile extends React.Component {
    constructor(props) {
        super(props);
        const {bombed, flagged, explored} = this.props.el;
        this.state = {bombed, flagged, explored}
        this.handleClick = this.handleClick.bind(this)
    }

    handleClick(){
        
    }

    render() {
        const bombCount = this.props.el.adjacentBombCount();
        let test = this.state.explored && bombCount >= 1? bombCount : '';
        let tileName = 'tile';
        // console.log(this.props.el)
        if(this.state.bombed && this.state.explored) {
            test = '☢';
            tileName += " bombed"
        } else if(this.state.flagged) {
            test = '⚑';
            tileName += " flagged";
        } else if(this.state.explored){
            tileName += " explored";
        }else{
            tileName += " unexplored"
        }

        return (
            <div 
                className={tileName} 
                key={this.props.key} 
                onClick={this.handleClick}
            >
            {test}
            </div>
        )
    }
}


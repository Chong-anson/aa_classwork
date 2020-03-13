import React from 'react';

class Clock extends React.Component {

    constructor() {
        super()
        const temp = new Date();
        this.state = {time: temp};
    }

    tick(){
        const temp = new Date();
        this.setState({time: temp});
    }

    componentDidMount(){
       this.timer = setInterval(this.tick.bind(this), 1000)
    }

    componentWillUnmount(){
        clearInterval(this.timer);
    }
    render() {
        const hh = this.state.time.getHours();
        const mm = this.state.time.getMinutes();
        const ss = this.state.time.getSeconds();

        return(
            <h1>{ `${hh}:${mm}:${ss}` }</h1>
        )
    } 
}

export default Clock;
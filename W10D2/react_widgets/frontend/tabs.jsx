import React from 'react' 
import Headers from './headers'

class Tabs extends React.Component{
    constructor(props){
        super(props);
        this.state = {selectedPane: 0};
        this.setPane = this.setPane.bind(this);
    }

    setPane(idx){
        this.setState({selectedPane: idx});
    }

    render(){
        const pane = this.props.tabs[this.state.selectedPane];

        return(
            <ul>
                <h1>Tabs</h1>
                <Headers 
                selectedPane = {this.state.selectedPane}
                chosenTab = {this.setPane}
                tabs = {this.props.tabs}
                ></Headers>

                <div>
                    <article>{pane.content}</article>
                </div>
            </ul>
        )
    }
}

export default Tabs;
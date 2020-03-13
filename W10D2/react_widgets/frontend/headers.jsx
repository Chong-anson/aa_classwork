import React from "react"

export default class Headers extends React.Component{
    render(){
    const titles = this.props.tabs.map((tab,idx)=>{
        const selected_idx = this.props.selectedPane;
        const klass = idx === selected_idx ? "active" : " ";
        
        return(
            <li 
            className={klass} 
            key={idx}
            onClick={()=>{this.props.chosenTab(idx)}}
            >{tab.title}</li>
        )
    });
    
    return(
        <div>{titles}</div>
    )

    }
};


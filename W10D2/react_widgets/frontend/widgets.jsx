import React from 'react';
import ReactDOM from 'react-dom';

import Clock from './clock'
import Tabs from './tabs'

const panes=[
    {title: "one", content: "first page"},
    {title: "two", content: "second page"}
]

function Root(){
    return (
        <div>
            <Clock />
            <Tabs tabs={panes} />
        </div>
    )
}

document.addEventListener("DOMContentLoaded", ()=>{
    const root = document.getElementById("main")
    ReactDOM.render(<Root />, root)
})
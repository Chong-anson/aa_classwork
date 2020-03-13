import React from 'react'
import ReactDOM from 'react-dom'
import Game from './frontend/game'

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    ReactDOM.render(<Game />, root);
    
}) 

const MovingObject = require("./moving_object.js")
const Asteroid = require("./asteroid.js")
const Game = require("./game.js")
const GameView = require("./game_view")

window.MovingObject = MovingObject;
window.Asteroid = Asteroid
window.Game = Game
window.GameView = GameView

document.addEventListener("DOMContentLoaded", function(){
  
  const canvas = document.getElementById("game-canvas")
  canvas.width = 900;
  canvas.height = 500; 
  const ctx = canvas.getContext('2d');
  window.ctx = ctx;
  // const mo = new MovingObject({
  //     pos: [30, 30],
  //     vel: [10, 10],
  //     radius: 10,
  //     color: "#00FF00"
  // });
  // const mo2 = new MovingObject({
  //     pos: [50, 30],
  //     vel: [10, 10],
  //     radius: 10,
  //     color: "#00FF00"
  // });
  
  const game_view = new GameView(ctx);
  game_view.start(); 


})


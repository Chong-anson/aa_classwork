const MovingObject = require("./moving_object")
const Util = require("./util")

const CONSTANTS ={
  RADIUS: 5,
  COLOR: "green"
}

function Ship(options){
  options.radius = CONSTANTS.RADIUS
  options.color = CONSTANTS.COLOR
  options.vel = [0,0]; 
  MovingObject.call(this, options)
}

Util.inherits(Ship, MovingObject)

Ship.prototype.relocate = function(){
  this.pos = this.game.randomPosition()
}
module.exports = Ship
const MovingObject = require("./moving_object");
const Ship = require("./ship")
const Util = require("./util");
const CONSTANTS = {
  COLOR: "red",
  RADIUS: 5
};

function Asteroid(options){
  options.color = CONSTANTS.COLOR;
  options.radius = CONSTANTS.RADIUS;
  options.vel = Util.randomVec(5);
  MovingObject.call(this, options)
}

Util.inherits(Asteroid, MovingObject);

Asteroid.prototype.collideWith = function(otherObject){
  if (otherObject instanceof Ship){
    otherObject.relocate(); 
    otherObject.vel = [0,0];
  }
  else{
    this.game.remove(otherObject)
    this.game.remove(this)
  }

  
}

module.exports = Asteroid
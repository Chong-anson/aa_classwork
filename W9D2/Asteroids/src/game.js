const Asteroid = require("./asteroid.js")
const Ship = require("./ship")

const CONSTANTS = {
  DIM_X: 500,
  DIM_Y: 500, 
  NUM_ASTEROIDS: 5
}
function Game() {
  this.asteroids = this.addAsteroids();
  this.ship = new Ship({ pos: this.randomPosition(), game: this });
  this.allObjects();
}

Game.prototype.addAsteroids = function(){
  const asteroids = [];
  for(let i =0; i < CONSTANTS.NUM_ASTEROIDS; i++) {
    let obj = new Asteroid({pos:this.randomPosition(), game: this});
    asteroids.push(obj);
  }
  return asteroids;
}

Game.prototype.addShips = function(){
  let ship = new Ship({pos: this.randomPosition(), game:this })
  return [ship];
}

Game.prototype.randomPosition = function(){
  const x = getRandomInt(0, CONSTANTS.DIM_X);
  const y = getRandomInt(0, CONSTANTS.DIM_Y);
  return [x, y];
}

function getRandomInt(min, max) {
  min = Math.ceil(min);   
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min)) + min;
}

Game.prototype.draw = function(ctx){
  ctx.clearRect(0,0,CONSTANTS.DIM_X + 10, CONSTANTS.DIM_Y);
  ctx.fillStyle = "black";
  ctx.fillRect(0,0,CONSTANTS.DIM_X,CONSTANTS.DIM_Y);
  this.allObjects()
  // debugger
  this.objects.forEach(function(object) {
    // ctx.fillStyle = object.color;
    // debugger
    object.draw(ctx);
  })
}

Game.prototype.moveObjects = function(ctx){
  // const allObjects = this.allObjects()

  this.objects.forEach(function (object) {
    object.move(ctx);
  })
}

Game.prototype.wrap = function(pos){
  if (pos[0]   > CONSTANTS.DIM_X){
    pos[0] -= CONSTANTS.DIM_X;
  }
  if (pos[1]  > CONSTANTS.DIM_Y) {
    pos[1] -= CONSTANTS.DIM_Y;
  }
  if (pos[0] < 0){
    pos[0] += CONSTANTS.DIM_X ;
  }
  if (pos[1] < 0){
    pos[1] += CONSTANTS.DIM_Y;
  }
  return (pos)
}

Game.prototype.checkCollisions = function(){
  for(let i = 0; i < this.asteroids.length; i++ ){
    for (let j = i+1; j < this.asteroids.length; j++) {
      if (this.asteroids[i].isCollidedWith(this.asteroids[j]) && i !== j) {
        // alert("COLLISION");
        console.log(this.asteroids)
        let collision = this.asteroids[i].collideWith(this.asteroids[j]);
        if (collision) return 
      } 
    }
  }
}

Game.prototype.step = function(ctx){
  this.moveObjects(ctx);
  this.checkCollisions();
}

Game.prototype.remove = function(asteroid){
  this.asteroids =  this.asteroids.filter(function(ele) {
    return ele != asteroid;})
}

Game.prototype.allObjects = function(){
  let new_array = [];
  this.objects = this.asteroids.concat(this.ship)
}

module.exports = Game;

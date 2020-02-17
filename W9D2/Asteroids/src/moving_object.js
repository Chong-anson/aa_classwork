function MovingObject(hash) {
    this.pos = hash.pos; 
    this.vel = hash.vel;
    this.radius = hash.radius;
    this.color = hash.color;
    this.game = hash.game
}

MovingObject.prototype.draw = function(ctx) {
  ctx.beginPath();
  ctx.strokeStyle = this.color;
  ctx.lineWidth = 10;
  ctx.arc(this.pos[0], this.pos[1], this.radius,0,2*Math.PI);
  ctx.stroke();
 
} 

MovingObject.prototype.move = function(){
  // const result = []; 
  // result.push(this.pos[0] + this.vel[0])
  // result.push(this.pos[1] + this.vel[1])
  // return result
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
  this.pos = this.game.wrap(this.pos); 
  
}

MovingObject.prototype.isCollidedWith = function(otherObject){
  let sum = this.radius + otherObject.radius;
  let x_dist = this.pos[0] - otherObject.pos[0]
  let y_dist = this.pos[1] - otherObject.pos[1]
  
  
  return ( Math.abs(x_dist) < sum && Math.abs(y_dist) < sum ) 
}

MovingObject.prototype.collideWith = function(otherObject){
  // this.game.remove(otherObject);
  // this.game.remove(this);
}

module.exports = MovingObject; 
const CONSTANTS = {
  GRAVITY: 0.8,
  FLAP_SPEED: -8,
  TERMINAL_VEL: 12,
  BIRD_WIDTH: 40,
  BIRD_HEIGHT: 30
};

export default class Bird {
  constructor(dimensions){
    this.dimensions = dimensions;
    this.velocity = 0;
    this.position = {vertical: (Math.floor(this.dimensions.height/2)), //space
  horizontal: (Math.floor(this.dimensions.width/3))}
  }

  drawBird(ctx){
     ctx.fillStyle = "yellow";
     ctx.fillRect(this.position.horizontal, this.position.vertical, CONSTANTS.BIRD_WIDTH, CONSTANTS.BIRD_HEIGHT);
  }
  animate(ctx){
    this.move()
    this.drawBird(ctx)
  }
  move(){
    this.position.vertical += this.velocity 
    // this.velocity += this.y;
    this.velocity += CONSTANTS.GRAVITY;

    if (this.velocity >= CONSTANTS.TERMINAL_VEL){
      this.velocity = CONSTANTS.TERMINAL_VEL;
    }
  }

  flap(){
    this.velocity = CONSTANTS.FLAP_SPEED; 
  }

}
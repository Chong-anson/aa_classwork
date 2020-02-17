import Level from './level'; 
import Bird from './bird';



export default class FlappyBird {
  constructor(canvas){
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
    this.restart();

  }
  
  animate(){
    // this.ctx.fillStyle = "red";
    // this.ctx.fillRect(100, 100, 400, 300);
    this.level.drawBackground(this.ctx);
    this.bird.animate(this.ctx);

    if (this.running){
      requestAnimationFrame(this.animate.bind(this));
    }
  }

  restart(){
    this.running = false;
    this.level = new Level(this.dimensions); 
    this.bird = new Bird(this.dimensions)
    this.animate();
  }
  play(){
    this.running = true;
    this.animate();
  }
  click(){
    if (!this.running) 
    {
      this.play();
    }
    this.bird.flap(); 
  }
}
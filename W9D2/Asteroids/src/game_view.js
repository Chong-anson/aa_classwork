const Game  = require("./game.js")

function GameView(ctx) {
  this.ctx = ctx;
  this.game = new Game();
  this.drawing_view = this.game.draw(ctx);
}

GameView.prototype.start = function(){
  window.setInterval(()=>{
    // this.game.moveObjects.call(this.game, this.ctx);
    // console.log("n")
    this.game.step.call(this.game, this.ctx)
    this.game.draw.call(this.game, this.ctx)
  }, 20);
}


module.exports = GameView;
Function.prototype.inherits = function(superClass){
  function Surrogate(){}
  Surrogate.prototype = superClass.prototype
  this.prototype = new Surrogate() 
  this.prototype.constructor = this
}

function MovingObject (speed) { 
  this.speed = speed ;
}

MovingObject.prototype.move = function () { 
  console.log("I'm moving and I'm an object")
}



function Ship () {}
Ship.inherits(MovingObject);

Ship.prototype.say = function (){
  console.log("I'm a ship.")
}
function Asteroid () {}
Asteroid.inherits(MovingObject);

Asteroid.prototype.move = function() {
  console.log("I'm a asteroid.");
};

let apple = new MovingObject(20);
let banana = new Ship();
let orange = new Asteroid();
banana.say();
console.log(Asteroid.__proto__ instanceof MovingObject);
// apple.say();

// orange.say();

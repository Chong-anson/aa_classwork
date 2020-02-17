/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Ship = __webpack_require__(/*! ./ship */ \"./src/ship.js\")\nconst Util = __webpack_require__(/*! ./util */ \"./src/util.js\");\nconst CONSTANTS = {\n  COLOR: \"red\",\n  RADIUS: 5\n};\n\nfunction Asteroid(options){\n  options.color = CONSTANTS.COLOR;\n  options.radius = CONSTANTS.RADIUS;\n  options.vel = Util.randomVec(5);\n  MovingObject.call(this, options)\n}\n\nUtil.inherits(Asteroid, MovingObject);\n\nAsteroid.prototype.collideWith = function(otherObject){\n  if (otherObject instanceof Ship){\n    otherObject.relocate(); \n    otherObject.vel = [0,0];\n  }\n  else{\n    this.game.remove(otherObject)\n    this.game.remove(this)\n  }\n\n  \n}\n\nmodule.exports = Asteroid\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\")\nconst Ship = __webpack_require__(/*! ./ship */ \"./src/ship.js\")\n\nconst CONSTANTS = {\n  DIM_X: 500,\n  DIM_Y: 500, \n  NUM_ASTEROIDS: 5\n}\nfunction Game() {\n  this.asteroids = this.addAsteroids();\n  this.ship = new Ship({ pos: this.randomPosition(), game: this });\n  this.allObjects();\n}\n\nGame.prototype.addAsteroids = function(){\n  const asteroids = [];\n  for(let i =0; i < CONSTANTS.NUM_ASTEROIDS; i++) {\n    let obj = new Asteroid({pos:this.randomPosition(), game: this});\n    asteroids.push(obj);\n  }\n  return asteroids;\n}\n\nGame.prototype.addShips = function(){\n  let ship = new Ship({pos: this.randomPosition(), game:this })\n  return [ship];\n}\n\nGame.prototype.randomPosition = function(){\n  const x = getRandomInt(0, CONSTANTS.DIM_X);\n  const y = getRandomInt(0, CONSTANTS.DIM_Y);\n  return [x, y];\n}\n\nfunction getRandomInt(min, max) {\n  min = Math.ceil(min);   \n  max = Math.floor(max);\n  return Math.floor(Math.random() * (max - min)) + min;\n}\n\nGame.prototype.draw = function(ctx){\n  ctx.clearRect(0,0,CONSTANTS.DIM_X + 10, CONSTANTS.DIM_Y);\n  ctx.fillStyle = \"black\";\n  ctx.fillRect(0,0,CONSTANTS.DIM_X,CONSTANTS.DIM_Y);\n  this.allObjects()\n  // debugger\n  this.objects.forEach(function(object) {\n    // ctx.fillStyle = object.color;\n    // debugger\n    object.draw(ctx);\n  })\n}\n\nGame.prototype.moveObjects = function(ctx){\n  // const allObjects = this.allObjects()\n\n  this.objects.forEach(function (object) {\n    object.move(ctx);\n  })\n}\n\nGame.prototype.wrap = function(pos){\n  if (pos[0]   > CONSTANTS.DIM_X){\n    pos[0] -= CONSTANTS.DIM_X;\n  }\n  if (pos[1]  > CONSTANTS.DIM_Y) {\n    pos[1] -= CONSTANTS.DIM_Y;\n  }\n  if (pos[0] < 0){\n    pos[0] += CONSTANTS.DIM_X ;\n  }\n  if (pos[1] < 0){\n    pos[1] += CONSTANTS.DIM_Y;\n  }\n  return (pos)\n}\n\nGame.prototype.checkCollisions = function(){\n  for(let i = 0; i < this.asteroids.length; i++ ){\n    for (let j = i+1; j < this.asteroids.length; j++) {\n      if (this.asteroids[i].isCollidedWith(this.asteroids[j]) && i !== j) {\n        // alert(\"COLLISION\");\n        console.log(this.asteroids)\n        let collision = this.asteroids[i].collideWith(this.asteroids[j]);\n        if (collision) return \n      } \n    }\n  }\n}\n\nGame.prototype.step = function(ctx){\n  this.moveObjects(ctx);\n  this.checkCollisions();\n}\n\nGame.prototype.remove = function(asteroid){\n  this.asteroids =  this.asteroids.filter(function(ele) {\n    return ele != asteroid;})\n}\n\nGame.prototype.allObjects = function(){\n  let new_array = [];\n  this.objects = this.asteroids.concat(this.ship)\n}\n\nmodule.exports = Game;\n\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game  = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\n\nfunction GameView(ctx) {\n  this.ctx = ctx;\n  this.game = new Game();\n  this.drawing_view = this.game.draw(ctx);\n}\n\nGameView.prototype.start = function(){\n  window.setInterval(()=>{\n    // this.game.moveObjects.call(this.game, this.ctx);\n    // console.log(\"n\")\n    this.game.step.call(this.game, this.ctx)\n    this.game.draw.call(this.game, this.ctx)\n  }, 20);\n}\n\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\")\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\")\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\nconst GameView = __webpack_require__(/*! ./game_view */ \"./src/game_view.js\")\n\nwindow.MovingObject = MovingObject;\nwindow.Asteroid = Asteroid\nwindow.Game = Game\nwindow.GameView = GameView\n\ndocument.addEventListener(\"DOMContentLoaded\", function(){\n  \n  const canvas = document.getElementById(\"game-canvas\")\n  canvas.width = 900;\n  canvas.height = 500; \n  const ctx = canvas.getContext('2d');\n  window.ctx = ctx;\n  // const mo = new MovingObject({\n  //     pos: [30, 30],\n  //     vel: [10, 10],\n  //     radius: 10,\n  //     color: \"#00FF00\"\n  // });\n  // const mo2 = new MovingObject({\n  //     pos: [50, 30],\n  //     vel: [10, 10],\n  //     radius: 10,\n  //     color: \"#00FF00\"\n  // });\n  \n  const game_view = new GameView(ctx);\n  game_view.start(); \n\n\n})\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function MovingObject(hash) {\n    this.pos = hash.pos; \n    this.vel = hash.vel;\n    this.radius = hash.radius;\n    this.color = hash.color;\n    this.game = hash.game\n}\n\nMovingObject.prototype.draw = function(ctx) {\n  ctx.beginPath();\n  ctx.strokeStyle = this.color;\n  ctx.lineWidth = 10;\n  ctx.arc(this.pos[0], this.pos[1], this.radius,0,2*Math.PI);\n  ctx.stroke();\n \n} \n\nMovingObject.prototype.move = function(){\n  // const result = []; \n  // result.push(this.pos[0] + this.vel[0])\n  // result.push(this.pos[1] + this.vel[1])\n  // return result\n  this.pos[0] += this.vel[0];\n  this.pos[1] += this.vel[1];\n  this.pos = this.game.wrap(this.pos); \n  \n}\n\nMovingObject.prototype.isCollidedWith = function(otherObject){\n  let sum = this.radius + otherObject.radius;\n  let x_dist = this.pos[0] - otherObject.pos[0]\n  let y_dist = this.pos[1] - otherObject.pos[1]\n  \n  \n  return ( Math.abs(x_dist) < sum && Math.abs(y_dist) < sum ) \n}\n\nMovingObject.prototype.collideWith = function(otherObject){\n  // this.game.remove(otherObject);\n  // this.game.remove(this);\n}\n\nmodule.exports = MovingObject; \n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\")\nconst Util = __webpack_require__(/*! ./util */ \"./src/util.js\")\n\nconst CONSTANTS ={\n  RADIUS: 5,\n  COLOR: \"green\"\n}\n\nfunction Ship(options){\n  options.radius = CONSTANTS.RADIUS\n  options.color = CONSTANTS.COLOR\n  options.vel = [0,0]; \n  MovingObject.call(this, options)\n}\n\nUtil.inherits(Ship, MovingObject)\n\nShip.prototype.relocate = function(){\n  this.pos = this.game.randomPosition()\n}\nmodule.exports = Ship\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = { \n  inherits(childClass,parentClass) {\n    function Surrogate(){};\n    Surrogate.prototype = parentClass.prototype;\n    childClass.prototype = new Surrogate(); \n    childClass.prototype.constructor = childClass; \n  },\n  \n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n  // Scale the length of a vector by the given amount.\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  }\n\n}\n\nmodule.exports = Util;\n\n\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ });
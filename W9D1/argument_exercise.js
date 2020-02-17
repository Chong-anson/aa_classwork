function sum(...args){
  let sum = 0 ;
  for(let i = 0;i< args.length; i++){
    sum += args[i]
  }

  return sum ;
}

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);

Function.prototype.myBind = function (context, ...args){
  // let args = Array.from(arguments).slice(1);
  return (...args2) => {
    this.call(context, ...args,...args2)
  }
}


class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true

function curriedSum(numArgs){
  let sum = 0;
  let i = 0;
  let total = numArgs;

  return function curry(num){
    sum += num;
    i++;
    if (i === total ){
      return sum;
    }
    return curry;
  }
}

// const cool = curriedSum(4);
// console.log(cool(5)(30)(20)(1)); // => 56

Function.prototype.curry = function (numArgs) {
  let total = numArgs; 
  let allArgs = [];
  const that = this;
  return function _curry(...args) {
    allArgs = allArgs.concat(args);
    if (allArgs.length < total) return _curry;
    return that(...allArgs);
  
  }
}

let cool = sum.curry(4);

// console.log(cool(1, 2, 3, 4));
console.log(cool(1)(2)(3)(4));
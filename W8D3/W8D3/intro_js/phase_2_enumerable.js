// myEach 
const array1 = [5, 2, 6];
let sum = 0; 

function block(element) {
  sum += element
};

// Another way to define block 
// const block = function(element) {
//   sum += element;
// }

Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
}

array1.myEach(block);

// Fat arrow
// array1.myEach(x => block(x));

// Pass in the whole function
// array1.myEach(function(x) { 
//   sum += x
// })

// console.log(sum);

// myMap 

Array.prototype.myMap = function(map) { 
  let result = [];
  // this.myEach(x => result.push(map(x)));
  this.myEach(x => {
    result.push(map(x))
  });
// this.myEach do |x| 
// result << callback(x) 
// end

  return result; 
}

var multiplier = function (element) {
  element *= 2;
  return element
}

// console.log([2,3,4].myEach(mulitplier))
// console.log([2,3,4].myMap(mulitplier));

Array.prototype.myReduce = function(callback, acc) {
  let start = 0 
  if (acc === undefined ) {
    acc = this[0];
    start = 1
  }
  for(start; start < this.length; start ++ ){
    acc = callback(acc, this[start]);
  }
  return acc;
}

// console.log([1, 2, 3].myReduce(function (acc, el) {
//   return acc + el;
// }, 25));


Array.prototype.bubblesort = function() {
  let sorted = false ; 

  while (!sorted) {
    sorted = true;

    for(let i = 0; i < this.length; i++) {
      if (this[i]>this[i+1]){
        this.swap(i,i+1);
        sorted = false
      }
    }
  }
  return this
}

Array.prototype.swap = function(i,j) {
  let temp = this[i];
  this[i] = this[j] ;
  this[j] = temp ; 

}

var random_array = function(length) {
  let result = [] ;
  for(let i =0; i< length ; i++ ){
    result.push(Math.floor(Math.random()*length));
  }
  return result; 
}
let arr = random_array(20) 
// console.log(arr)
// console.log(arr.bubblesort())

String.prototype.substring = function() {
  let result = [];
   for(let i=0; i<this.length; i++) {
     for(let j=0;j<this.length; j++) {
       let substr = this.slice(i,j+1) 
       if (substr){
         result.push(this.slice(i,j+1))

       }
     }
   }
   return result; 
}


// console.log("abcde".substring())

// Recursion 

let range = function(start, end) {
  if (start>end) {
    return [];
  }
  else if (start === end) {
    return [start];
  }
  else 
  {
    let arr = range(start, end-1)
    arr.push(end);
    return arr
  }
}

// console.log(range(32,20))

let sumRec = function(arr) {
  if (!arr.length) {
    return undefined;
  }
  else if (arr.length === 1) {
    return arr[0]
  } 
  else {
    result = sumRec(arr.slice(1))
    return (result + arr[0])
  }
  
}

// console.log(sumRec(range(1,1000)));
let exponent = function(base, exp) {
  if (exp < 0) {
    return NaN ;
  }
  else if (exp === 1) {
    return base;
  }
  else if (exp === 0) {
    return 1; 
  }
  else{
    previous = exponent(base, Math.floor(exp/2));
    if (exp % 2 === 0) {
      return Math.pow(previous,2);
    }
    else {
      return Math.pow(previous,2) * base
    }

  }
}

// console.log(exponent(3,3));
let bsearch = function(arr, target) { 
  // console.log(arr.length)
  if (arr.length) 
  {
    let mid = Math.floor(arr.length / 2) ;
    // console.log(mid);
    debugger
    switch (Math.sign(arr[mid]-target)){
      case 1:
        {
          debugger
          let index = bsearch(arr.slice(0, mid), target);
          debugger
          return index;
        } 
      case -1:
        {
          let index = bsearch(arr.slice(mid + 1), target);
          if (index===-1){
            debugger
            return -1;
          }
          else {
            debugger
            return (mid + index + 1);
          }
        }
      case 0:
        { 
          debugger
          return mid;
        }
    }
  }
  else {
    return -1; 
  }
}

// console.log(bsearch(range(5,10),10));

let mergesort = function(arr) { 
  let mid = Math.floor(arr.length / 2);
  let left_arr = mergesort(arr.slice(0,mid));
  let right_arr = mergesort(arr.slice(mid));
  return merge(left_arr, right_arr);
}

let merge = function (left, right) {
  
}
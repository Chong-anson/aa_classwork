// Uniq

// Array.prototype.uniq = function() {
//   let result = [];
//   for (let i=0; i< this.length; i++) {
//     if (!result.includes(this[i])) {
//       result.push(this[i]);
//     }
//   }
//   return result;
// }

//   console.log([1, 2, 2, 3, 3, 3].uniq()); 


// twoSum

// Array.prototype.twoSum = function() {
//   let result = [];

//   for (let i = 0; i < this.length; i++) {
//     for (let j = i + 1 ; j < this.length; j++) {
//       if (this[i] + this[j] === 0) {
//         let pair = [this[i], this[j]];
//         result.push(pair);
//       }
//     }
//   }
//   return result;
// }

// solved with dictionary: 
// Array.prototype.twoSum = function() {
//   let result = [];
//   let dict = {};

//   for (let i = 0; i < this.length; i++) {
//     dict[0- this[i]] = this[i];
//     if (dict[this[i]]) {
//       let pair = [dict[this[i]], this[i]];
//       result.push(pair);
//     }
//   }
//   return result;
// }

// console.log([-3,-2,-1,2, 3].twoSum());


// Transpose
Array.prototype.transpose = function() {
  let result = [];
  for (i = 0; i < this.length; i++) {
    let subArray = [];
    for (j = 0; j < this.length; j++) {
      subArray.push(this[j][i]);
    }
    result.push(subArray);
  }
  return result;
}


console.log([[1,2,3],[4,5,6],[7,8,9]].transpose());



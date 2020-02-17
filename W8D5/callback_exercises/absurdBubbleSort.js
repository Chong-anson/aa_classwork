const reader = require('readline');
const rl = reader.createInterface({
  input: process.stdin,
  output: process.stdout
})

function askIfGreaterThan(el1, el2, swap){
  debugger
  rl.question(`Is ${el1} greater than ${el2}`, function(answer){
     swap(answer === "Y");
  })
}

function InnerSort(arr, i, madeAnySwaps, outerSort){

  function swap(flag){
    if (flag){
      let temp = arr[i]; 
      arr[i] = arr[i+1]; 
      arr[i+1] = temp;
      madeAnySwaps = true;
    }
    i++;
    InnerSort(arr, i, madeAnySwaps, outerSort);
  };

  if (i === (arr.length-1)) {
    outerSort(madeAnySwaps);

  }
  else
  {
    // swap the items, set boolean to false 
    askIfGreaterThan(arr[i],arr[i+1],swap);
  }
}

function absurdSort(arr, sortCompletionCallback){
  outerSort(true);
  function outerSort(madeAnySwaps){
    if (madeAnySwaps){
      InnerSort(arr,0,false, outerSort);
    }
    else{
      sortCompletionCallback(arr);
    }
  }
}

let absurdBubbleSort = function(arr, sortCompletionCallback) { 
  absurdSort(arr,sortCompletionCallback);
}

console.log(absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  rl.close();
}));
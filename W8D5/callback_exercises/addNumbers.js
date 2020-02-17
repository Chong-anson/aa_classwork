const readline = require('readline')
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
})

// rl.question("Input a number", function (ans) {
//   console.log(ans);
//   rl.close(); 
// });


function addNumbers(sum, end_idx, output_callback) {
  if (end_idx > 0 ) {
    rl.question("Input a number: ", function(answer){
      sum += parseInt(answer); 
      if (end_idx === 1){
        output_callback(sum); 
        rl.close();
      }
      else {
        console.log(`The partial sum is ${sum}`)
        addNumbers(sum, end_idx-1, output_callback)
      }
    });    
  }
  else {
    return NaN; 
  }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

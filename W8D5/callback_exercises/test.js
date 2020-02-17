function SumCalculator() {
    // scope 0
    this.sum = 0;
}

this.sum = 0

SumCalculator.prototype.addNumbers = function (numbers) {
    // scope 1
    // let sum = 0 ; 
    numbers.forEach(function(number)
    {
        // scope 2
        // console.log(this.sum)
        console.log(this.sum)
        console.log(`${this}`)
        this.sum += number; // noooo!
        // console.log(`${sum}`)
        // return sum;
    });


};

// console.log(this)
let su = new SumCalculator;
console.log(SumCalculator.prototype.addNumbers([4,5,6]));
// console.log(sum)
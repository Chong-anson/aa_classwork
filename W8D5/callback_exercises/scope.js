const callback1 = function (callback2) {
    console.log(`${this} is the context of callback1`)
    callback2()
}

class obj1 {
    f1(){
        console.log(this)
    }
    f2(cb){
        cb()
    }
    exec() {
        this.f2(function() {
            console.log(this)
        })
    }
}

(new obj1).exec(); 

// callback1(function(){console.log(this, `is the context of callback2`)});
let obj = {
    method1: function(){
        console.log(this, `is the context of method1`)
        const callback2 = ()=> {
            console.log(this ,`is the context of callback2`)
        }
        const callback1 = function(callback2) {
            console.log(this ,`is the context of callback1`)
            callback2()
        }
        callback1(callback2)
    }
}




// obj.method1()
// console.log("=============")

class Test {
    constructor(name) {
        this.name = name;
    }
    
    method1() {
        const that = this
        console.log(`${this} is the context of method1`)
        const callback2 = function () {
            console.log(`${this} is the context of callback2`)
            console.log(`${that} is the scope of that`)
        }
        const callback1 = function (callback2) {
            console.log(`${this} is the context of callback1`)
            callback2()
        }
        callback1(callback2)
    }
 
    method2() {
        console.log(`${this} is the context of method2`)
        const callback1 = function (callback2) {
            console.log(`${this} is the context of callback1`)
            callback2()
        }
        callback1(function () {
            console.log(`${this} is the context of callback2`)
        })
    }

    method3(callback1) {
        console.log(`${this} is the context of method3`)
        console.log
        const callback2 = function () {
            console.log(`${this} is the context of callback2`)
        }
        callback1(callback2)
    }

    method4(callback1) {
        console.log(`${this} is the context of method4`)

        callback1(() => {
            console.log(`${this} is the context of callback2`)
        })
    }

    method5(callback1, callback2) {
        console.log(`${this} is the context of method5`)


        callback1(callback2)
    }

    method6(callback2) {
        console.log(`${this} is the context of method6`)

        const callback1 = function () {
            console.log(`${this} is the context of callback1`)
            callback2()
        }
        callback1(callback2)
    }
}
a = new Test('test1')
// method1: both callback1 and callback2 are defined locally
console.log("method1")
a.method1()
console.log("======")
//=> [object Object] is the context of method1
// undefined is the context of callback1
// undefined is the context of callback2 <- in the scope of callback 1, different with the undefined of callback1's context


// method2: callback1 is defined locally, callback2 is defined as the arg of callback1
// console.log("method2")
// a.method2()
// console.log("======")

// =>[object Object] is the context of method2
// undefined is the context of callback1
// undefined is the context of callback2 <- same with the context of callback 1


// method3: callback1 is defined globally, callback2 is defined locally.
// console.log("method3")
// a.method3(callback1)
// console.log("======")

// =>[object Object] is the context of method3
// [object global] is the context of callback1
// undefined is the context of callback2


// method4: callback1 is defined globally, callback2 is defined as an arrow function
// console.log("method4")
// a.method4(callback1)
// console.log("======")

// =>[object Object] is the context of method4
// [object global] is the context of callback1
// [object Object] is the context of callback2

// method5: callback1 is defined globally, callback2 is defined as the arg of method5
// console.log("method5")
// a.method5(callback1, function () {
//     console.log(this ,`is the context of callback2`)
// })
// console.log("======")

// =>[object Object] is the context of method5
// [object global] is the context of callback1
// [object global] is the context of callback2

// method6: callback1 is defined locally, callback2 is defined as the arg of method6
// console.log("method6")
// a.method6(function () {
//     console.log(this ,`is the context of callback2`)
// })
// console.log("======")

//=> [object Object] is the context of method6
// undefined is the context of callback1
// [object global] is the context of callback2

let test2 = {
    method1: function () {
        console.log(`${this} is the context of method1`)
        const callback2 = function () {
            console.log(`${this} is the context of callback2`)
        }
        const callback1 = function (callback2) {
            console.log(`${this} is the context of callback1`)
            callback2()
        }
        callback1(callback2)
    },
    method2: function() {
        console.log(`${this} is the context of method2`)
        const callback1 = function (callback2) {
            console.log(`${this} is the context of callback1`)
            callback2()
        }
        callback1(function () {
            console.log(`${this} is the context of callback2`)
        })
    }
}

test2.method1()
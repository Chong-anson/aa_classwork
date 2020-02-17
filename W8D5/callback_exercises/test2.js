function curryingExample(str) {
    let strCurry = "";
    strCurry += str;

    function curryReturn(str) {
        if (str === undefined) {
            return strCurry;
        };
        strCurry += str;
        return curryReturn;
    }

    return curryReturn
}

console.log(curryingReturn("b")())
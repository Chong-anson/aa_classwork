class DOMNodeCollection {
  constructor(array){
    this.array = array;
  }
}

DOMNodeCollection.prototype.html = function(str){
  if(str === undefined){
    return this.array[0].innerHTML;
  }
  else {
    this.array.forEach( el => {
      el.innerHTML = str;
    });
  }
};

DOMNodeCollection.prototype.empty = function () {
  this.array.forEach(el => {
    el.innerHTML = "";
  });
};

DOMNodeCollection.prototype.append = function(arg) {
 this.array.forEach( el =>{
   if (arg instanceof HTMLElement){
     el.innerHTML += arg.outerHTML;
   }
  else if (typeof arg === "string"){
    // debugger
    el.innerHTML += arg;
  }
  else if (arg instanceof DOMNodeCollection){
    arg.array.forEach( appendElement => {
      el.innerHTML += appendElement.outerHTML;
    });
  }
 });

};

DOMNodeCollection.prototype.attr = function(attrName, attrValue) {
   if (attrName) {
     if(attrValue === undefined) {
        return this.array[0].attributes[attrName];
      } else {
        return this.array[0].attributes[attrName].value = attrValue;
     }
   }
};

DOMNodeCollection.prototype.addClass = function(className){
  this.array.forEach( (el) => {
    if (className){
      el.className += ` ${className}`;      
    }
  })
  return this;
}

DOMNodeCollection.prototype.removeClass = function(className) {
  this.array.forEach(el => {
    if (className) {
      let cl = el.className;
      cl = cl.replace(className, "");
    
      el.className = cl;
    }
  })
  return this;
}

DOMNodeCollection.prototype.children = function () {
  let result = [];
  this.array.forEach(el => {
    result.push(...el.children);
  })
  return new DOMNodeCollection(result);
}

DOMNodeCollection.prototype.parent = function () {
  let result = [];
  this.array.forEach( el => {
    result.push(el.parentElement);
  })
  return new DOMNodeCollection(result)
}

DOMNodeCollection.prototype.find = function(selector) {
  let list = [];
  this.array.forEach(el => {
    list.push(...Array.from(el.querySelectorAll(selector)));
  })

  return new DOMNodeCollection(list)
};

DOMNodeCollection.prototype.remove = function() {
  this.array.forEach( el=> {
    el.outerHTML = ""
  })

  return this 
}

module.exports = DOMNodeCollection;
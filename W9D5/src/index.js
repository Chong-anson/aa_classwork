const DOMNodeCollection = require("./dom_node_collection.js")
const $l  = function(arg) {
  let result = [];
  if (typeof arg === 'string'){
    result = Array.from(document.querySelectorAll(arg));
    return new DOMNodeCollection(result);
  }
  else if (arg instanceof HTMLElement){
    return new DOMNodeCollection([arg]);
  }

};


window.$l = $l;
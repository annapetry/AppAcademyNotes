Function.prototype.myBind = function (context) {
  var fn = this;
  var bindArgs = Array.prototype.slice.call(arguments, 1);
  return function () {
    var currentArgs = Array.prototype.slice.call(arguments);
    return fn.apply(context, bindArgs.concat(currentArgs));
  };
};


// function Cat (name) {
//   this.name = name;
// };
//
// var c = new Cat("Simon");
//
// Cat.prototype.meow = function () {
//   console.log(this.name + " says Meow!");
// };
//
// meow.myBind(c);
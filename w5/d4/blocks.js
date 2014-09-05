Array.prototype.myEach = function (callback) {
  for (var i = 0; i < this.length; ++i) {
    callback(this[i]);
  }
};

var array = [1, 2, 3, 4, 5];
var printDouble = function (x) {
  console.log(x * 2);
};

array.myEach(printDouble);

Array.prototype.myMap = function (callback) {
  var mapped = [];
  
  this.myEach(function(x) {
    mapped.push(callback(x));
  });
  
  return mapped;
};

var makeSquared = function (x) {
  return x * x;
};

console.log(array.myMap(makeSquared));

Array.prototype.myInject = function (callback, initial) {
  // if(initial === undefined) {
  //   initial = this[0];
  // }
  var total = initial;
  this.myEach(function(x) {
    total = callback(total, x);
  });
  return total;
};
//
// [].myInject()

var makeSum = function(total, x){
  return total + x;
};

console.log(array.myInject(0, makeSum));
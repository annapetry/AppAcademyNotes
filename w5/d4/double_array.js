var doubleArray = function(array) {
  var doubled = [];
  
  for (var i = 0; i < array.length; ++i) {
    var el = array[i];
    doubled.push(el * 2);
  }
  
  return doubled;
};

var array = [1, 2, 3, 4, 5];

console.log(array);
console.log(doubleArray(array));
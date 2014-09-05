Array.prototype.twoSum = function() {
  var indices = [];
  
  for (var i = 0; i < (this.length - 1); ++i) {
    var el1 = this[i];
    
    for (var j = i + 1; j < this.length; ++j) {
      var el2 = this[j];
      
      if (el1 + el2 === 0) {
        indices.push([i, j]);
      }
    }
  }
  
  return indices;
};

var array = [-1, 0, 2, -2, 1];

console.log(array);
console.log(array.twoSum());
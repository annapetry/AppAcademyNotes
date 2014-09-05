Array.prototype.transpose = function() {
  var size = this.length;
  
  for (var i = 0; i < size - 1; ++i) {
    for (var j = i + 1; j < size; ++j) {
      var temp = this[i][j];
      this[i][j] = this[j][i];
      this[j][i] = temp;
    }
  }
  
  return this;
};

var rows = [ [0,1,2], [3,4,5], [6,7,8] ];

console.log(rows);
console.log(rows.transpose());
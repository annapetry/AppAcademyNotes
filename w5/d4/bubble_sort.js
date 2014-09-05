Array.prototype.bubbleSort = function () {
  var sorted = false;
  
  while(!sorted){
    sorted = true;
    
    for(var i = 0, j = 1; i < this.length - 1; ++i, ++j){
      if(this[i] > this[j]){
        var temp = this[i];
        this[i] = this[j];
        this[j] = temp;
        sorted = false;
      }
    }
  }
  return this;
};

var array = [1, 4, 7, 2, 8, 7, 3];

console.log(array.bubbleSort());
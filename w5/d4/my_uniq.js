Array.prototype.myUniq = function () {
  var result = [];
  
  for(var i = 0; i < this.length; i ++){
    if(result.indexOf(this[i]) === -1){
      result.push(this[i]);
    }
  }
  
  return result;
};

var array = [1, 2, 3, 3, 4].myUniq();
var array1 = [1, 2, 3];

console.log(array);
console.log(array1.myUniq());
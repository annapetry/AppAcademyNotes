function sum () {
  var nums = Array.prototype.slice.call(arguments);
  var result = 0;
  if (nums.length === 0) {
    return result;
  } else {
    nums.forEach( function (num) {
      result += num;
    });
    return result;
  }
};

console.log(sum());
console.log(sum(1, 2, 3, 4, 5));
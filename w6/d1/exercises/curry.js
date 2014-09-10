// function curriedSum (numArgs) {
//   var numbers = [];
//   var _curriedSum = function (num) {
//     numbers.push(num);
//     if (numbers.length === numArgs) {
//       var result = 0;
//       numbers.forEach(function (num) {
//         result += num;
//       });
//       return result;
//     } else {
//       return _curriedSum;
//     }
//   };
//
//   return _curriedSum;
// };
//
// var sum = curriedSum(4);
// console.log(sum(5)(4)(3)(4));

Function.prototype.myCurry = function (numArgs) {
  var args = [];
  var fn = this;
  var _fn = function (arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return fn.apply(null, args);
    } else {
      return _fn;
    }
  };
  return _fn;
};

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

sumThree(4, 20, 6); // == 30

// you'll write `Function#curry`!
var f1 = sumThree.myCurry(3);

var f2 = f1(4);
var f3 = f2(20);
var result = f3(6); // = 30
console.log(result);
// or more briefly:
// sumThree.myCurry(3)(4)(20)(6); // == 30

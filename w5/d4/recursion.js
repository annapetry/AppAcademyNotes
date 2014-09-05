//review
var range = function(start, end) {
  if (start === end) {
    return end;
  }
  
  return [start].concat(range(start + 1, end));
};

console.log("--range--");
console.log("makes range 1 through 3: " + (range(1, 3).toString() === [1, 2, 3].toString()));


var expo1 = function(base, pow){
  if(pow === 1) return base;
 
  return base * expo1(base, pow - 1);
};

console.log("\n--expo1--");
console.log("evaluates 2^3 as 8: " + (expo1(2, 3) === 8));


var expo2 = function(base, pow){
  if (pow === 0) return 1;
  if (pow === 1) return base;

  if (pow % 2 === 0) {
    var result = expo2(base, pow / 2);
    return result * result;
  } else {
    var result =  expo2(base, (pow - 1) / 2);
    return base * result * result;
  }
};

console.log("\n--expo2--");
console.log("evaluates 3^6 as 729: " + (expo2(3, 6) === 729));


var fib = function(x) {
  if (x === 1) return [0];
  if (x === 2) return [0, 1];
  
  var i = x - 2;
  var j = x - 3;
  var f = fib(x - 1);
  
  f.push(f[i] + f[j]);
  
  return f;
};

console.log("\n--fib--")
console.log("gets the first 5 numbers: " + (fib(5).toString() === [0, 1, 1, 2, 3].toString()));


var bsearch = function(array, target) {
  if (array.length === 0) {
    return null;
  } else {
    var mid = Math.floor(array.length / 2);
    if (array[mid] > target) {
      return bsearch(array.slice(0, mid), target);
    } else if (array[mid] < target) {
      var res = bsearch(array.slice(mid + 1), target);
      return res !== null ? mid + res + 1 : null;
    } else {
      return mid;
    }
  }
};

var xyz = [1, 2, 3, 4];

console.log( "\n--bsearch test results--");
console.log( "-> returns index of smallr node: " + (bsearch(xyz, 2) === 1) );
console.log( "-> returns index of center node: " + (bsearch(xyz, 3) === 2) );
console.log( "-> returns index of bigger node: " + (bsearch(xyz, 4) === 3) );
console.log( "-> returns -1 on invalid sml node: " + (bsearch(xyz, 0) === null) );
console.log( "-> returns -1 on invalid big node: " + (bsearch(xyz, 6) === null) );


var makeChange = function(money, denoms) {
  if (denoms.length === 0 || money === 0) {
    return [];
  }
  
  var best = [];
  
  for (var i = 0; i < denoms.length; ++i) {
    var denom = denoms[i];
      
    if (money >= denom) {
      var cur = makeChange(money - denom, denoms);
      cur.push(denom);
    
      if (best.length === 0 || cur.length < best.length) {
        best = cur;
      }
    }
  }
  
  return best;
};

makeChange(14, [10,7,1]);

console.log("\n--make change--");
console.log("makes the correct change: "
  + (makeChange(14, [10, 7, 1]).toString() === [7, 7].toString())
  + " ([" + makeChange(14, [10, 7, 1]) + "])");
  

var mergeSort = function(array) {
  if (array.length <= 1) {
    return array;
  }
  
  var mid = Math.floor(array.length / 2);
  
  var left = mergeSort(array.slice(0, mid));
  var right = mergeSort(array.slice(mid));
  var result = merge(left, right);
    
  return result;
};


var merge = function(array1, array2) {
  var result = [];
  
  while(array1.length > 0 && array2.length > 0) {
    if(array1[0] < array2[0]) {
      result.push(array1.shift());
    } else {
      result.push(array2.shift());    
    }
  }
  
  return result.concat(array1).concat(array2)
}

var mergeArray = [9, 4, 2, 3, 1, 5, 6, 1, 3, 5];
var expectedRes = [1, 1, 2, 3, 3, 4, 5, 5, 6, 9].toString();
var mergeSortRes = mergeSort(mergeArray);

console.log("\n--merge sort--");
console.log("sorts an array: " + (mergeSortRes.toString() === expectedRes)
  + " (" + mergeSortRes + ")");


// TODO: REMOVE DUPLICATES
var subsets = function(array) {
  if (array.length === 0) {
    return array;
  }
  
  var allSubs = [array];
  
  for (var i = 0; i < array.length; ++i) {
    var sansEl = array.slice(0);
    sansEl.splice(i, 1);
    
    rest = subsets(sansEl.splice(i, 1));
    
    rest.forEach(function (sub) {
      allSubs.push(sub.push(array[0]))
    });
  
    allSubs = allSubs.concat(rest);
    // allSubs.push(sansEl);
  }
    
  return allSubs;
};

var subArray = [1, 2, 3];

console.log("\n--subsets--");
console.log(subsets(subArray));
var substrings = function(string) {
  var subs = [];
  
  for (var i = 0; i < string.length - 1; ++i) {
    for (var j = i + 1; j < string.length; ++j) {
      substr = string.substring(i, j);
      
      if (subs.indexOf(substr) == -1) {
        subs.push(substr);
      }
    }
  }
  
  return subs;
};

console.log(substrings("cats"));
console.log(substrings("catscats"));
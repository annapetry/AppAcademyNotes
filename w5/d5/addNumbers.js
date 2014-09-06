var readline = require('readline');

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

var addNumbers = function(sum, numsLeft, completionCallback) {
	if (numsLeft === 0) {
		return completionCallback(sum);
	}
	
	reader.question("Pardon me User, moight yoou provouide an int? ", 
		function(response) {
			var userNumber = parseInt(response);
			sum += userNumber;

			addNumbers(sum, numsLeft - 1, completionCallback);
	});
	
	console.log("\nCurrent Sum: " + sum);

};

addNumbers(0, 3, function (sum) {
  console.log("Total Sum: " + sum);
	reader.close();
});
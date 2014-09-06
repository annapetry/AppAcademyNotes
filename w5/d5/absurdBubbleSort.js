var readline = require('readline');

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

var askIfLessThan = function(el1, el2, callback) {
	var userPrompt = "Can you do me a favor? Is " + el1 + " less than " + el2 + "? ";
	reader.question(userPrompt, function(response) {
			if (response.toUpperCase() === 'NO') {
				callback(true);
			} else {
				callback(false);
			}
	});
};

// var swapped = false;

var innerBubbleSortLoop = function(arr, i, madeAnySwaps, outerBubbleSortLoop) {
	if (i === (arr.length - 1)) {
		outerBubbleSortLoop(madeAnySwaps);
	}

	if (i < arr.length - 1) {
		askIfLessThan(arr[i], arr[i + 1], function(isLessThan) {
			if (isLessThan) { 
				var el1 = arr[i];
				var	el2 = arr[i + 1];
				arr[i] = el2;
				arr[i + 1] = el1;
				madeAnySwaps = true;
			}
			// 	innerBubbleSortLoop(arr, i + 1, true, outerBubbleSortLoop);
			// } else {
				innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
			// }
		});
	}
};

var absurdBubbleSort = function(arr, sortCompletionCallback) {
	var madeAnySwaps = true;
	var outerBubbleSortLoop = function(madeAnySwaps) {
		if (madeAnySwaps) {
			madeAnySwaps = false;
			innerBubbleSortLoop(arr, 0, madeAnySwaps, outerBubbleSortLoop);
		} else {
			sortCompletionCallback(arr);
		}
	};
	
	outerBubbleSortLoop(madeAnySwaps);
};


absurdBubbleSort([3, 2, 6], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});
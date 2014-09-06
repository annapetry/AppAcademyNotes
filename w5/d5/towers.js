var readline = require('readline');

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Constructor Class
var HanoiGame = function() {
	this.towers = [[3, 2, 1], [], []];
};

HanoiGame.prototype.isWon = function() {
	if (this.towers[2].toString() === [3, 2, 1].toString()) {
		return true;
	} else {
		return false;
	}
};

HanoiGame.prototype.isValidMove = function(startTowerIdx, endTowerIdx) {
	var startLength = this.towers[startTowerIdx].length;
	var endLength = this.towers[endTowerIdx].length;
	var startPc = this.towers[startTowerIdx][startLength - 1];
	
	if (startLength === 0) {
			return false;	
	} else if (endLength === 0) {
		return true;
	} else if (this.towers[endTowerIdx][endLength - 1] < startPc) {
		return false;
	} else {
		return true;
	}
};

HanoiGame.prototype.move = function(startTowerIdx, endTowerIdx) {

	if (this.isValidMove(startTowerIdx, endTowerIdx)) {
		var startPc = this.towers[startTowerIdx].pop();
		this.towers[endTowerIdx].push(startPc);
		return true;
	} else {
		return false;
	}
};

HanoiGame.prototype.print = function() {
	var t = 1;
	this.towers.forEach(function (tower) {
		console.log("Tower " + t + JSON.stringify(tower));
		t += 1;
	});
};

HanoiGame.prototype.promptMove = function (callback) {
	this.print();
	var that = this;
	var userPrompt = "Enter a START tower and an END tower: S,E ";
	reader.question(userPrompt, function (response){
		var moves = response.split(",");
		callback.call(that, moves);
	});
};

HanoiGame.prototype.run = function (completionCallback) {
	
	var handleUserResponse = function(moves) {

		var success = this.move((moves[0] - 1), (moves[1] - 1));
		if (success) {
			if (this.isWon()) {
				completionCallback();
			} else {
				this.run(completionCallback);
			}
		} else {
			console.log("I-N-V-A-L-I-D MVE.");
			this.run(completionCallback);
		}
	};
	
	this.promptMove(handleUserResponse);
};

var game = new HanoiGame();
game.run(function() {
	console.log("Oh man! You won! You totally won! You're a dawg!");
	reader.close();
});

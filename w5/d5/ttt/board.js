function Board () {
	this.grid = [
		['*', '*', '*'],
		['*', '*', '*'],
		['*', '*', '*']
	];
}


Board.prototype.renderGrid = function () {
	var gridAxis = ['-', 1, 2, 3];
	console.log(gridAxis.join(" "));
	var that = this;
	gridAxis.forEach(function (el) {
		if (el === '-') {
		} else {
			console.log(el + " " + that.grid[el - 1].join(" "));
		}
	});
}


Board.prototype.won = funciton () {
	this.
}


var b = new Board();

b.renderGrid();

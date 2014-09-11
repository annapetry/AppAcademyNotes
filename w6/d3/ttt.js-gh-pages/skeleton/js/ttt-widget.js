(function () {
  if (typeof TTT === "undefined") {
    window.TTT = {};
  }

  var Widget = TTT.Widget = function (game, $el) {
    this.game = game;
    this.$el = $el;
  };

  Widget.prototype.bindEvents = function () {
    var that = this;
    this.$el.off();
    this.$el.on("click", ".col", function (event) {
      console.log("clicking square");
      var $square = $(event.currentTarget);
      that.makeMove($square); 
    });
    
    $('.reset-game').off();
    $('.reset-game').on('click', function (event) {
      console.log("clicking button");
      event.preventDefault();
      that.resetGame(); 
    });
    
    console.log("End of bindEvents");
  };

  Widget.prototype.makeMove = function ($square) {
    var position = $square.data("pos");
    
    var move = this.game.playMove(position);
    
    if (move === undefined) {
      if (this.game.currentPlayer === "x") {
        $square.attr("style", "background-color: green");
      } else {
        $square.attr("style", "background-color: red");
      }
    }
    
    var gameOver = this.game.isOver();
    
    if (gameOver) {
      if (this.game.winner()) {
        if (this.game.currentPlayer === "x") {
          alert("Green is the Winner!");
        } else {
          alert("Red is the Winner!");
        }
      } else {
        alert("Game is a Draw");
      }
      this.$el.off('click', '.col');
    }
  };

  Widget.prototype.play = function () {
    this.setupBoard();
    // this.setupButton();
    this.bindEvents();
  };

  Widget.prototype.setupBoard = function () {
    this.$el.empty();
    
    for (var i = 0; i < 3; i++) {
      // create row div
      var $row = $("<div></div>");
      $row.addClass("clearfix row");
      for (var j = 0; j < 3; j++) {
        // create col w data info
        var $col = $("<div></div>");
        $col.addClass("col");
        $col.data("pos", [i, j]);
        $row.append($col);
      }
      this.$el.append($row);
    }
  };
  
  // Widget.prototype.setupButton = function () {
  //   var $button = $("<button></button>");
  //   $button.text("Reset Game");
  //   $button.addClass("button");
  //   this.$el.append($button);
  // };
  
  Widget.prototype.resetGame = function () {
    var game = new TTT.Game();
    this.game = game;
    // this.game.Board.makeGrid();
    this.play();
  };
})();






















(function () {
  if (typeof Hanoi === "undefined") {
    window.Hanoi = {};
  }
  
  var Towers = Hanoi.Towers = function (game, $el) {
    this.game = game;
    this.$el = $el;
  };
  
  Towers.prototype.play = function () {
    // this.setupBoard();
    this.drawDisc();
    this.bindEvents();
  };
  
  Towers.prototype.bindEvents = function () {
    var that = this;
    var $start;
    var $end;
    
    this.$el.on("click", ".pile", function (event) {
      if ($start) {
        $start = $(event.currentTarget);
      } else {
        $end = $(event.currentTarget);
      }
      that.makeMove($start, $end); 
      $start = undefined;
    });
  };
  
  Towers.prototype.makeMove = function ($start, $end) {
    var startPosition = $start.data("pos");
    var endPosition = $end.data("pos");
    
    
    
    var move = this.game.move(startPosition, endPosition);
    
    if (move) {
      // pop top el from start, drop it in end
      
    }
  };
  
  Towers.prototype.drawDiscs = function() {
    this.$el.find('.disc').removeClass('one two three');
    
    this.$el.find('.tower').each(function(idx, tower) {
      this.game.towers[idx].each (function(idx, disc) {
        if (disc) {
          console.log("there is a disc");
        } else {
          console.log("empty");
        }
      }
    )
  }
};
  
  // Towers.prototype.setupBoard = function () {
//     this.$el.empty();
//
//     for (var i = 0; i < 3; i++) {
//       var $tower = $("<div></div>");
//       $tower.addClass("tower tower" + (i + 1))
//
//       for (var j = 0; j < 3; j++) {
//         var $disc = $("<div></div>");
//         $disc.addClass("disc");
//         $tower.append($disc);
//       }
//       this.$el.append($tower);
//     }
//
//   };
})();
















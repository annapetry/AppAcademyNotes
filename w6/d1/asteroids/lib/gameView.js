// Stores a Game instance.
// Stores a canvas context to draw the game into.
// Installs key listeners to move the ship and fire bullets.
// Installs a timer to call Game#step.+

/*global Asteroids */
(function () {
  if (typeof window.Asteroids === "undefined" ) {
    window.Asteroids = {};
  }
  
  var GameView = Asteroids.GameView = function (canvasEl) {
    this.game = new Asteroids.Game();
    this.ctx = canvasEl.getContext("2d");
  };
  
  GameView.prototype.start = function () {
    var that = this;
    window.setInterval((function() {
      that.game.moveObjects();
      that.game.draw(that.ctx);
    }).bind(that), 20);
  };
})();
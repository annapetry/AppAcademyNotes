/*global Asteroids */
(function () {
  if (typeof window.Asteroids === "undefined" ) {
    window.Asteroids = {};
  }
  
  var Game = Asteroids.Game = function () {
    this.roids = Game.addAsteroids();
  };
  
  Game.DIM_X = 800;
  Game.DIM_Y = 800;
  Game.NUM_ASTEROIDS = 5;
  
  Game.addAsteroids = function () {
    var result = [];
    var that = this;
    
    while (result.length < Game.NUM_ASTEROIDS) {
      
      result.push(new Asteroids.Asteroid(
        Game.randomPos(Game.DIM_X, Game.DIM_Y),
        that
      ));
    }
    
    return result;
  };
  
  Game.randomPos = function () {
    return [
      Math.floor(Math.random() * Game.DIM_X),
      Math.floor(Math.random() * Game.DIM_Y)
    ];
  };
  
  Game.prototype.draw = function (ctx) {
    ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
    
    this.roids.forEach(function (stroid) {
      stroid.draw(ctx);
    });
  };
  
  Game.prototype.moveObjects = function () {
    this.roids.forEach( function (stroid) {
      stroid.move();
    });
  };
  
  Game.wrap = function (pos) {
    var x = pos[0];
    var y = pos[1];
    
    if (x < 0) {
      x += Game.DIM_X;
    }
    if (x > Game.DIM_X) {
      x -= Game.DIM_X;
    }
    if (y < 0) {
      y += Game.DIM_Y;
    }
    if (y > Game.DIM_Y) {
      y -= Game.DIM_Y;
    }
    
    return [x, y];
  };

})();
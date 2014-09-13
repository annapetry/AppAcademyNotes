$.Carousel = function (el) {
  this.$el = $(el);
  this.$activeIndex = 0;
  this.$items = $(this.$el.find(".items"));
  this.$el.on("click", ".slide-left", this.slideLeft.bind(this));
  this.$el.on("click", ".slide-right", this.slideRight.bind(this));
};

$.Carousel.prototype.slideLeft = function(event) {
  // event.preventDefault();
  this.slide(-1);
};

$.Carousel.prototype.slideRight = function(event) {
  // event.preventDefault();  
  this.slide(1);
};

$.Carousel.prototype.slide = function (dir) {
  var $oldActiveImage = $(this.$items.children()[this.$activeIndex]);
  // update active index
  var direction;
  if (dir === 1) {
    // go right
    direction = "right";
    this.$activeIndex = (this.$activeIndex + 1) % this.$items.children().length;
  } else{
    // go left
    direction = "left";
    if ( this.$activeIndex === 0) {
      this.$activeIndex = this.$items.children().length - 1;
    } else {
      this.$activeIndex--;
    }
  }
  
  var $newActiveImage = $(this.$items.children()[this.$activeIndex]);
  
  $newActiveImage.addClass("active").addClass(direction);
  setTimeout(function() {
    $newActiveImage.removeClass(direction)
  }, 0)
  
  $oldActiveImage.addClass(
    direction === "right" ? "left" : "right"
  );
  
  $oldActiveImage.one('transitionend', function() {
    $oldActiveImage.removeClass("right left active");
  });
  
};


$.fn.carousel = function () {
  return this.each(function () {
    new $.Carousel(this);
  });
};
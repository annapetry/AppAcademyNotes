$.Thumbnails = function (el) {
  this.$el = $(el);
  this.$activeIndex = 0;
  this.$items = this.$el.find(".items");
  // this.setActiveImage().bind(this);
  // this.setActiveThumb().bind(this);
  this.$imageNav = $("<div id='image-nav'></div>");
  this.$el.append(this.$imageNav);
  this.fillGutter();
  //this.$thumbs = $(this.$items.find(".mini"));
};

$.Thumbnails.prototype.fillGutter = function() {
  this.$imageNav.append("<ul id='gutter'></ul>")
    .prepend("<a href='#'>Left</a>")
    .append("<a href='#'>Right</a>");
  
  $('#gutter').addClass('clearfix');  
 
  var $images = $(this.$items.children());
  var idx = this.$activeIndex;
  var $fiveImg = $($images.slice(idx, idx + 5));
  var $cloned = $fiveImg.clone();
  
  $cloned.each(function (index, img) {
    var $li = $("<li></li>");
    $li.append(img);
    $li.addClass("mini");
    $('#gutter').append($li);
  });
};

// $.Thumbnails.prototype.setActiveImage = function() {
//   $("img").removeClass("active");
//   this.$currentImage = $('.items').children()[this.$activeIndex];
//   this.$currentImage.addClass("active");
// };
//
// $.Thumbnails.prototype.setActiveThumb = function() {
//   $("#gutter").find(".active").removeClass("active");
//   $('#gutter').children().children()[this.$activeIndex].addClass("active");
// };






$.fn.thumbnail = function () {
  return this.each(function () {
    new $.Thumbnails(this);
  });
};
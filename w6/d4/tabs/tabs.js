$.Tabs = function (el) {
  this.$el = $(el);
  this.$contentTabs = $(this.$el.data("content-tabs"));
  
  this.$el.on('click', 'a', this.clickTab.bind(this));
};

$.Tabs.prototype.clickTab = function(event) {
  event.preventDefault();
  // change link classes
  var $activeLink = this.$el.find(".active");
  $activeLink.removeClass("active");
  $activeLink = $(event.currentTarget).addClass("active");

  var $oldActiveTab = $(this.$contentTabs.find(".active"));
  $oldActiveTab.removeClass("active").addClass("transitioning");
  var $newActiveTab = $(this.$contentTabs.find($activeLink.attr('href')));

  $oldActiveTab.one('transitionend', function() {
    $oldActiveTab.removeClass("transitioning");
    $newActiveTab.addClass("transitioning");
    setTimeout(function () {
      $newActiveTab.removeClass("transitioning").addClass("active");
    }, 0);
  });
};

$.fn.tabs = function () {
  return this.each(function () {
    new $.Tabs(this);
  });
};
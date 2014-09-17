NewsReader.Views.NewFeed = Backbone.View.extend({
  template: JST["feeds/new"],
  
  events: {
    "submit form#new_feed_form": "handleNewFeed"
  },
  
  render: function () {
    var renderedContent = this.template({
      model: this.model
    });
    
    this.$el.html(renderedContent);
    return this;
  },
  
  handleNewFeed: function (event) {
    event.preventDefault();
    var formData = $(event.currentTarget).serializeJSON();
    var feed = new NewsReader.Models.Feed({url: formData.feed.url});
    
    feed.save({}, {
      success: function () {
        NewsReader.Collections.feeds.add(feed);
      }
    });
  }
  
})
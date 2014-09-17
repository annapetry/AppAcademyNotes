NewsReader.Views.IndexView = Backbone.View.extend({
  template: JST["feeds/index"],
  
  tagName: 'ul',
  
  events: {
    "click button#delete": "removeFeed"
  },
  
  initialize: function (){
    this.listenTo(this.collection, 'sync remove', this.render);
  },
  
  render: function () {
    var renderedContent = this.template({
      feeds: this.collection
    });
    this.$el.html(renderedContent);
    var formView = new NewsReader.Views.NewFeed();
    this.$el.append(formView.render().$el);
    return this;
  },
  
  removeFeed: function (event) {
    var currentFeedId = $(event.currentTarget).data("feed-id");
    var currentFeed = NewsReader.Collections.feeds.get(currentFeedId);
    currentFeed.destroy();
  }
})
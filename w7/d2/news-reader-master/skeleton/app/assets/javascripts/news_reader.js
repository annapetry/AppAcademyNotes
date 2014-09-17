window.NewsReader = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    NewsReader.Collections.feeds = new NewsReader.Collections.Feeds;
    
    new NewsReader.Routers.Router ({
      "$rootEl": $('#content')
    });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  NewsReader.initialize();
});

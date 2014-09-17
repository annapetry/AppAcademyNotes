NewsReader.Routers.Router = Backbone.Router.extend({
  routes: {
    '': "index",
    'feeds/:id': "show"
  },
  
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },
  
  index: function() {
    NewsReader.Collections.feeds.fetch();
    
    var indexView = new NewsReader.Views.IndexView({
      collection: NewsReader.Collections.feeds
    }); 
    
    this._swapView(indexView);
  },
  
  show: function (id){
    var feed = NewsReader.Collections.feeds.getOrFetch(id);

    var showView = new NewsReader.Views.ShowView({
      model: feed
    });
    
    this._swapView(showView);
  },
  
  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(this._currentView.render().$el);
  }
});
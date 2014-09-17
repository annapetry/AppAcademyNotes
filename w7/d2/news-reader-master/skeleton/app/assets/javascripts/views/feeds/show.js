NewsReader.Views.ShowView = Backbone.View.extend({
  template: JST["feeds/show"],
  
  events: {
    "click button#refresh" : "redirect"
  },
  
  initialize: function (){
    this.listenTo(this.model, 'sync add', this.render);
  },
  
  redirect: function () {
    this.model.fetch();
  },
  
  tagName: 'ul',
  
  render: function () {
    var renderedContent = this.template({
      feed: this.model
    });
    this.$el.html(renderedContent);
    var that = this;
    this.model.entries().each( function (entry) {
      var entryView = new NewsReader.Views.EntryView({ model: entry });
      that.$el.append(entryView.render().$el);
    });
    
    return this;
  },
});
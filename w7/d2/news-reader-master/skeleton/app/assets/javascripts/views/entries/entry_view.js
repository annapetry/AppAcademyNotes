NewsReader.Views.EntryView = Backbone.View.extend({
  template: JST['entries/show'],
  
  tagName: 'li',
  
  render: function() {
    var renderedContent = this.template({ entry: this.model });
    this.$el.html(renderedContent);
    return this;
  }
})
class Ryan.Routers.Application extends Backbone.Router

  initialize: ->
    new Ryan.Views.Contact el: 'form'
    new Ryan.Views.Scroll el: 'nav'

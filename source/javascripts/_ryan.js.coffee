window.Ryan =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Ryan.Routers.Application
    Backbone.history.start pushState: Modernizr.history

$(document).ready ->
  Ryan.initialize()

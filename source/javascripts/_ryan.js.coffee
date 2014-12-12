window.Ryan =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Ryan.Routers.Application

$(document).ready ->
  Ryan.initialize()

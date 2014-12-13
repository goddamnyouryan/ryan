class Ryan.Routers.Application extends Backbone.Router

  initialize: ->
    @openLinksInTabs()
    new Ryan.Views.Contact el: 'form'
    new Ryan.Views.Scroll el: 'ul.links'

  openLinksInTabs: ->
    $("a[href^='http://']").attr('target','_blank')
    $("a[href^='https://']").attr('target','_blank')

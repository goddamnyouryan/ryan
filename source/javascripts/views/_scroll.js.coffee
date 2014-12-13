class Ryan.Views.Scroll extends Backbone.View

  events:
    'click a.scroll': 'scrollToAnchor'

  scrollToAnchor: ->
    event.preventDefault()
    target = $(event.target)
    hash = target.attr('href').split('/')[1]
    $('html,body').animate({ scrollTop: @scrollDistance(hash) }, { easing: 'swing', duration: 500 })

  scrollDistance: (id) ->
    distance = $("#{id}").offset().top
    # distance = distance - $('header').outerHeight() if $(window).width() > 800
    distance

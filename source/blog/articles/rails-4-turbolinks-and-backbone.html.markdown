---
title: Rails 4 Turbolinks and Backbone
date: 2013-07-27
---

I spent the last hour or so trying to make the [backbone.js](http://www.backbonejs.org) router and turbolinks play nicely on my new rails 4 app.

Turns out it was fairly straightforwards, but I had to learn a bit more about how Backbone.history works

Here's what I did:

With Turbolinks, you only get a document.ready event on the initial page load. Since turbolinks reloads the "body" tag, if you don't have your js in the body tag you won't reload them, and therefore won't get another document.ready call.

This is what my base backbone file looked like (in coffeescript of course):

    # app/assets/javascripts/summerland.js.coffee

    window.Summerland =
      Models: {}
      Collections: {}
      Views: {}
      Routers: {}
      initialize: ->
        new Summerland.Routers.Application
        Backbone.history.start pushState: true

    $(document).ready ->
      Summerland.initialize()


The problem here is that the router only gets called on `document.ready`, so when you click a link, the page loads via turbolink, and the router doesn't get called again.

Luckily turbolinks creates a new event called 'page:load' that we can take advantage of.

Unfortunately, you can't just call the router again instead, you have to stop the history and then start it again, like so:


    # app/assets/javascripts/summerland.js.coffee

    window.Summerland =
      Models: {}
      Collections: {}
      Views: {}
      Routers: {}
      initialize: ->
        new Summerland.Routers.Application
        Backbone.history.start pushState: true

    $(document).ready ->
      Summerland.initialize()

    $(document).on 'page:load', ->
      Backbone.history.stop()
      Summerland.initialize()

This should initialize the router and history normally on your initial pageview, and then restart the history on subsequent link visits.

Seems to work so far!

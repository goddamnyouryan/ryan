class Ryan.Views.Contact extends Backbone.View

  initialize: ->
    @validate()

  events:
    'submit': 'sendFormEmail'

  sendFormEmail: (event) ->
    event.preventDefault()
    return unless @$el.valid()
    target = $(event.target)
    $.ajax
      url: target.attr 'action'
      method: 'POST'
      data: target.serialize()
      dataType: 'json'
      success: =>
        @$('textarea').after "<div class='success'>Your message has been sent. Ryan will be sure to delete it soon. Ha ha just kidding.</div>"
        target[0].reset()
      error: ->
        alert 'Uh Oh, something went wrong. You should just email me at ryan@goddamnyouryan.com'

  validate: ->
    @$el.validate
      errorPlacement: ->
        ''
      rules:
        name: 'required'
        _replyto:
          required: true
          email: true
        message: 'required'

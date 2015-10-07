setup500px = () ->
  _500px.init {
    sdk_key: 'fdcaea5c35561158c89cf39bf30efc827d7d88cd'
  }

  _500px.on 'authorization_obtained', () ->
    $('#not_logged_in').hide()
    $('#logged_in').show()

    _500px.api '/users', (response) ->
      me = response.data.user;
      $('#username').html(username)

  _500px.on 'logout', () ->
    $('#not_logged_in').show()
    $('#logged_in').hide()

  _500px.getAuthorizationStatus()

  $('#oauth-login').click _500px.login
  $('#oauth-logout').click _500px.logout

$ ->
  setup500px()

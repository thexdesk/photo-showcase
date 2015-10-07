oops = () ->
  console.log 'Something went wrong with this request... please try again later'

like = (id) ->
  _500px.api "/photos/#{id}/favorite", 'post', (response) ->
    if (response.success)
      console.log 'Liked a photo'
    else
      oops()

unlike = (id) ->
  _500px.api "/photos/#{id}/favorite", 'delete', (response) ->
    if (response.success)
      console.log 'Unliked a photo'
    else
      oops()

updateFavorites = (ids) ->
  $favorited = $('.ps-photo').filter () ->
    ids.indexOf($(this).data('id')) > -1

  $favorited.find('.favorited').show()


# Taken from https://github.com/500px/500px-js-sdk/blob/master/examples/example1.html
setup500px = () ->
  _500px.init {
    sdk_key: 'fdcaea5c35561158c89cf39bf30efc827d7d88cd'
  }

  _500px.on 'authorization_obtained', () ->
    $('.not_logged_in').hide()
    $('.logged_in').show()

    _500px.api '/users', (response) ->
      me = response.data.user;
      $('#username').html(me.username)

      _500px.api '/photos', { feature: 'user_favorites', user_id: me.id }, (response) ->
        photos = response.data.photos
        if (photos.length != 0)
          ids = $.map photos, (photo) ->
            photo.id

          updateFavorites(ids)


  _500px.on 'logout', () ->
    $('.not_logged_in').show()
    $('.logged_in').hide()

  _500px.getAuthorizationStatus()

  $('#oauth-login').click _500px.login
  $('#oauth-logout').click _500px.logout

  $('.ps-photo').click () ->
    _this = this
    id = $(this).data('id')

    _500px.api "/photos/#{id}", (response) ->
      if (response.success)
        if (response.data.photo.favorited)
          unlike(id)
          $(_this).find('.favorited').hide()
        else
          like(id)
          $(_this).find('.favorited').show()
      else
        oops()

$ ->
  setup500px()

oops = () ->
  console.log 'Something went wrong with this request... please try again later'

like = ($heart, id) ->
  _500px.api "/photos/#{id}/favorite", 'post', (response) ->
    oops() if !response.success
    favorite($heart)

unlike = ($heart, id) ->
  _500px.api "/photos/#{id}/favorite", 'delete', (response) ->
    oops() if !response.success
    unfavorite($heart)

# JQuery can't add class to SVG
favorite = ($heart) ->
  $heart.attr('class', 'ps-heart favorited');

unfavorite = ($heart) ->
  $heart.attr('class', 'ps-heart');

updateFavorites = (ids) ->
  $favorited = $('.ps-photo-box').filter () ->
    ids.indexOf($(this).data('id')) > -1

  favorite($favorited.find('.ps-heart'));

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

  $('.ps-photo-box').click () ->
    $heart = $(this).find('.ps-heart')
    id = $(this).data('id')

    if ($heart.attr('class') == 'ps-heart')
      like($heart, id)
    else
      unlike($heart, id)

setupPackery = () ->
  $('#ps-photos').packery {
    itemSelector: '.ps-photo-box'
    gutter: 10
  }

$ ->
  setup500px()
  setupPackery()

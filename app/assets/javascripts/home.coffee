$ ->
  $('#try-demo').click ->
    url = $('[name="url"]').val()
    keyword = $('[name="keyword"]').val()
    $.ajax
      method: 'POST'
      url: '/demo'
      data:
        demo:
          url: url
          keyword: keyword
      success: (msg) ->
        $('#try-demo').removeClass('is-loading')
        window.location.href = '/'
    $('#try-demo').addClass('is-loading')
    return false

  $('#demo').submit ->
    url = $('[name="url"]').val()
    keyword = $('[name="keyword"]').val()
    $.ajax
      method: 'POST'
      url: '/demo'
      data:
        demo:
          url: url
          keyword: keyword
      success: (msg) ->
        $('#try-demo').removeClass('is-loading')
        window.location.href = '/'
    $('#try-demo').addClass('is-loading')
    return false

  $('#subscribe').submit ->
    $('#subscribe-success').css('display', 'none')
    $('#subscribe-error').css('display', 'none')

    email = $('.email').val()
    $.ajax
      method: 'POST'
      url: '/preorder'
      data:
        preorder:
          email: email
      success: (msg) ->
        if msg.status == 'success'
          $('#success-text').text(msg.msg)
          $('#subscribe-success').css('display', 'block')
          $('#mce-EMAIL').val('')
        else
          $('#error-text').text(msg.msg)
          $('#subscribe-error').css('display', 'block')
    return false

  $('#workflow').css('width', $('figure').width())
  $('#workflow').css('height', $('figure').height())

  $('#video').click ->
    $('figure').hide()
    $('#workflow').show()
    $('#workflow_html5_api').show()
    $('#screenshot').parent().removeClass('is-active')
    $('#video').parent().addClass('is-active')

  $('#screenshot').click ->
    $('#workflow').hide()
    $('#workflow_html5_api').hide()
    $('figure').show()
    $('#video').parent().removeClass('is-active')
    $('#screenshot').parent().addClass('is-active')

  # Navbar
  $('.nav-toggle').click ->
    $(@).toggleClass('is-active')
    $('.nav-menu').toggleClass('is-active')

  $('.modal-close').on 'click', ->
    $('#signin').removeClass('is-active')

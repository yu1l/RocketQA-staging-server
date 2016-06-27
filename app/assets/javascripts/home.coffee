$ ->
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

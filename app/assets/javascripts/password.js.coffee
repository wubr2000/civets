$ ->

  $('#show-password-button').on 'click', (e) ->
    switch $(this).data('state')
      when 'show'
        $(this).html $(this).html().replace('Show','Hide')
        $(this).removeClass('btn-warning').addClass('btn-success')
        $('.showable-password').attr('type','text')
        $(this).data('state','hide')
      else
        $(this).html $(this).html().replace('Hide','Show')
        $(this).removeClass('btn-success').addClass('btn-warning')
        $('.showable-password').attr('type','password')
        $(this).data('state','show')
        
    $('.showable-password').first().focus()
    
    e.preventDefault()
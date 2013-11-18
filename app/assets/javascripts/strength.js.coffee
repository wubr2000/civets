$ ->
  checkMatch = (event) ->
    pw = $('#user_password').val()
    pc = $('#user_password_confirmation').val()
    
    if pw == pc
      $('#match-div').html("Passwords match!").addClass('pmatch')
    else
      $('#match-div').html("Passwords don't match!").removeClass('pmatch')
  
  setStrengthMeter = (pw) ->
    result = zxcvbn pw
    score = result.score
    strength = (score / 4) * 100
    
    color = switch score
      when 1 then 'danger'
      when 2 then 'warning'
      when 3 then 'success'
      else 'info'
    
    $('#time-to-crack').html result.crack_time_display
    
    $('#strength-meter')
      .removeClass('progress-bar-danger')
      .removeClass('progress-bar-warning')
      .removeClass('progress-bar-success')
      .removeClass('progress-bar-info')
      .addClass('progress-bar-' + color)
      .css('width', strength + '%')
  
  $('#user_password_confirmation').on 'keyup', checkMatch

  $('#user_password').on 'keyup', (event) ->
    pw = $(@).val()
    
    try
      setStrengthMeter pw
    catch error
      console.log error
      
    checkMatch()

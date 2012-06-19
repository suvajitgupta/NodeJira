#= require 'lib/jquery.min.js'
#= require 'lib/jquery.validate.min.js'

$ ->
  $("#id").focus()
  $('#id').keydown (e) ->
    $('p.error').text ''
  $("#login-form").validate()
  

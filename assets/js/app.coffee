#= require 'lib/jquery.min.js'
#= require 'lib/jquery.validate.min.js'
#= require 'login.coffee'

$ ->
  $("#id").focus()
  $("#login-form").validate()
  $("#login").click window.login
  

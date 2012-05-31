#= require 'lib/jquery.min.js'
#= require 'lib/jquery.validate.min.js'
#= require 'get_details.coffee'

$ ->
  $("#id").focus()
  $("#jira_form").validate()
  $("#get_details").click window.get_details
  

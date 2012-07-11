#= require 'lib/jquery.min.js'
#= require 'lib/jquery.validate.min.js'

$ ->
  $("#id").focus()
  $('#id').keydown (e) ->
    $('p.error').text ''
  $("#login-form").validate()
  $("#key_search_tab").click ->
    $("#issue-form").css("display", "inline-block")
    $("#jql-form").css("display", "none")
    $("#builder-form").css("display", "none")
  $("#jql_tab").click ->
    $("#issue-form").css("display", "none")
    $("#jql-form").css("display", "inline-block")
    $("#builder-form").css("display", "none")
  $("#builder_tab").click ->
    $("#issue-form").css("display", "none")
    $("#jql-form").css("display", "none")
    $("#builder-form").css("display", "inline-block")
  $(".list-item-view").click ->
    value = this.getElementsByTagName('td')[0].innerHTML
    $(".invisible-issue-form #key").val(value)
    $(".invisible-issue-form").submit()
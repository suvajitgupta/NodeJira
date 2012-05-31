window.get_details = (event)->
  event.preventDefault()

  form = $("#jira_form")
  data = form.serialize()

  $.ajax(url: "/", type: "POST", data: data)
    .success((data)->
      alert data
      idInput = $("#id")
      idInput.val('')
      idInput.focus()
    )
    .error((xhr, error)->
      alert error
    )

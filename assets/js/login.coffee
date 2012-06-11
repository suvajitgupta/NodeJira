window.login = (event)->
  event.preventDefault()

  form = $("#jira-form")
  data = form.serialize()

  $.ajax(url: "/login", type: "POST", data: data)
    .success((data)->
      alert data
    )
    .error((xhr, error)->
      alert error
    )

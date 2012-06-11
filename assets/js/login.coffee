window.login = (event)->
  event.preventDefault()

  form = $("#login-form")
  data = form.serialize()

  $.ajax(url: "/login", type: "POST", data: data)
    .success((data)->
      console.log data
    )
    .error((xhr, error)->
      alert error
    )

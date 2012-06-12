window.login = (event)->
  event.preventDefault()
  form = $("#login-form")
  data = form.serialize()
  
  $.ajax(url: "/login", type: "POST", data: data)
    .success((html)->
      document.write html
    )
    .error((xhr, error)->
      alert error
    )
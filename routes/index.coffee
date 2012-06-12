jira_api = require '../jira_api'

module.exports =
  
  show_login_dialog: (req, res, next) ->
    console.log "Launching NodeJira Login Dialog"
    res.render 'login'
    
  authenticate: (req, res, next) ->
    jira_api.login req.body.username, req.body.password, (err, body)->
      if err?
        console.log err
      else
        console.log body
        res.render 'issue'

  get_details: (req, res, next) ->
    jira_api.get_details req.body.id, (err, body)->
      if err?
        console.log err
      else
        console.log body
        res.render 'details'
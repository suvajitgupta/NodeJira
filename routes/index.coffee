jira_api = require '../jira_api'

module.exports =

  show_login_dialog: (req, res, next) ->
    console.log "Launching NodeJira Login Dialog"
    res.render 'login'

  authenticate: (req, res, next) ->
    jira_api.authenticate req.body.username, req.body.password, (err, body)->
      if err?
        console.log err
        res.render 'login', error: 'Invalid username or password.'
      else
        req.session.is_logged_in = true
        console.log body
        res.redirect '/issue'

  show_issue_dialog: (req, res, next) ->
    res.render 'issue'

  get_issue_details: (req, res, next) ->
    jira_api.get_issue_details req.body.id, (err, body)->
      if err?
        console.log err
      else
        console.log body
        res.render 'details'

  logout: (req, res, next) ->
    req.session.is_logged_in = false
    res.redirect '/' # login page

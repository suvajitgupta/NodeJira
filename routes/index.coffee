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
    jira_api.get_issue_details req.body.id, (err, details)->
      if err?
        console.log err
        res.render 'issue', error: err.msg.errorMessages[0]
      else
        console.log JSON.stringify details
        res.render 'details', { details }

  get_issue_list: (req, res, next) ->
    console.log req
    jira_api.get_issue_list req.body.id, (err, list) ->
      if err?
        console.log err
        res.render 'issuelist', error: err.msg.errorMessages[0]
      else
        console.log JSON.stringify list
        res.render 'issuelist', { list }

  logout: (req, res, next) ->
    req.session.is_logged_in = false
    res.redirect '/' # login page

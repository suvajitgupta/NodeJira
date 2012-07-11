jira_api = require '../jira_api'

module.exports =

  show_login_dialog: (req, res, next) ->
    res.render 'login'

  authenticate: (req, res, next) ->
    jira_api.authenticate req.body.username, req.body.password, (err, body)->
      if err?
        res.render 'login', error: 'Invalid username or password.'
      else
        req.session.is_logged_in = true
        res.redirect '/search'

  show_search_dialog: (req, res, next) ->
    res.render 'search'

  get_issue_details: (req, res, next) ->
    jira_api.get_issue_details req.body.key, (err, details)->
      if err?
        res.render 'search', error: err.msg.errorMessages[0]
      else
        res.render 'details', { details }

  get_issue_list: (req, res, next) ->
    jira_api.get_issue_list req.body.jql, (err, list) ->
      if err?
        res.render 'search', error: err.msg.errorMessages[0]
      else
        res.render 'list', { list }

  logout: (req, res, next) ->
    jira_api.logout (err, messsage) ->
      if err?
        res.render '/', error: err.msg.errorMessages[0]
      else
        req.session.is_logged_in = false
        res.redirect '/'

jira_api = require '../jira_api'

module.exports =
  
  # renders GUI
  index_get: (req, res, next) ->
    console.log "Launching NodeJira Login Dialog"
    res.render 'index'
    
  # pull data from Jira
  index_post: (req, res, next) ->
    jira_api.login req.body.username, req.body.password, (err, body)->
      if err?
        console.log err
      else
        console.log body
      
    
    
    

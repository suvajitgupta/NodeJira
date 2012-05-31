jira_api = require '../jira_api'

module.exports =
  
  # renders GUI
  index_get: (req, res, next) ->
    console.log "Launching NodeJira GUI"
    res.render 'index'
    
  # pull data from Jira
  index_post: (req, res, next) ->
    console.log "Getting details for id: #{req.body.id}"
    jira_api.get_details req.body.id, (err, body)->
      if err?
        console.log err
      else
        console.log body
      
    
    
    

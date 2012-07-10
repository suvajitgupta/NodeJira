express = require 'express'
assets = require 'connect-assets'
routes = require './routes'
port = process.env.PORT or 3000

module.exports = app = express.createServer()

app.set 'view engine', 'jade'
app.set 'view options', layout: false
app.use assets src: "#{__dirname}/assets"
app.use express.favicon()
app.use express.bodyParser()
app.use express.methodOverride()
app.use express.cookieParser()
app.use express.session secret: 'randomstuffherethatstryingtobeasecret12@@124'
app.use app.router
app.use express.static "#{__dirname}/public"

# setup defaults
app.helpers
  title: "NodeJira Console"

middleware =
  must_be_logged_in: (req, res, next) ->
    if req.session.is_logged_in
      next()
    else
      res.redirect '/' # login page

# setup routes
app.get  '/', routes.show_login_dialog
app.post '/login', routes.authenticate
app.get  '/issue', middleware.must_be_logged_in, routes.show_issue_dialog
app.post '/details', middleware.must_be_logged_in, routes.get_issue_details
app.get  '/logout', middleware.must_be_logged_in, routes.logout
app.get  '/issuelist', middleware.must_be_logged_in, routes.get_issue_list
  
# start server
app.listen port, -> console.log "Listening @ http://0.0.0.0:#{port}"

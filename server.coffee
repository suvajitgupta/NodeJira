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

# setup routes
app.get  '/', routes.index_get   # login dialog
app.post '/login', routes.index_post  # login to Jira 

# start server
app.listen port, -> console.log "Listening @ http://0.0.0.0:#{port}"

CONFIG = require './config'
request = require 'request'

module.exports =
  get_details: (id, cb)->
    request_options =
      url: CONFIG.authentication_url
      method: 'POST'
      body:
        username: CONFIG.username
        password: CONFIG.password
      json: true
      jar: false
    console.log request_options
    request request_options, (err, response, body)=>
        if cb?
          if err?
            cb err, null
          else if response?.statusCode not in [200, 201]
            cb code: response.statusCode, msg: body, null
          else
            cb null, body

CONFIG = require './config'
request = require 'request'

module.exports =
  authenticate: (username, password, cb)->
    request_options =
      url: CONFIG.authentication_url
      method: 'POST'
      body:
        username: username
        password: password
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
            this.cookies = [];
            if response.headers['set-cookie']
              this.cookies = response.headers['set-cookie']

  get_issue_details: (id, cb)->
    console.log id
    console.log this.cookies
    console.log this.cookies.join ";"
    request_options =
      url: CONFIG.content_url+"/issue/"+id
      method: 'GET'
      headers:
        Cookie: this.cookies.join ";"
      json: true
      jar: false
    console.log request_options
    request request_options, (err, response, body)=>
        if cb?
          if err?
            cb err, null
          else if response?.statusCode not in [200,201]
            cb code: response.statusCode, msg: body, null
          else
            cb null, body
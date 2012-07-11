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
    request request_options, (err, response, body)=>
        if cb?
          if err?
            cb err, null
          else if response?.statusCode not in [200, 201]
            cb code: response.statusCode, msg: body, null
          else
            cb null, body
            this.cookies
            if response.headers['set-cookie']
              this.cookies = response.headers['set-cookie']

  get_issue_details: (key, cb)->
    request_options =
      url: CONFIG.content_url+"/issue/"+key
      method: 'GET'
      headers:
        Cookie: this.cookies.join ";"
      json: true
      jar: false
    request request_options, (err, response, body)=>
        if cb?
          if err?
            cb err, null
          else if response?.statusCode not in [200,201]
            cb code: response.statusCode, msg: body, null
          else
            cb null, body

  get_issue_list: (jql, cb)->
    request_options =
      url: CONFIG.content_url+"/search?jql="+jql
      method: 'GET'
      headers:
        Cookie: this.cookies.join ";"
      json: true
      jar: false
    request request_options, (err, response, body)=>
        if cb?
          if err?
            cb err, null
          else if response?.statusCode not in [200,201]
            cb code: response.statusCode, msg: body, null
          else
            cb null, body

  logout: (cb)->
    request_options =
      url: CONFIG.authentication_url
      method: 'DELETE'
      headers:
        Cookie: this.cookies.join ";"
      json: true
      jar: false
    request request_options, (err, response, body)=>
      if cb?
        if err?
          cb err, null
        else if response?.statusCode not in[204]
          cb code: response.statusCode, msg: body, null
        else
          this.cookies = null
          cb null, body

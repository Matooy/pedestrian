child_process = require 'child_process'

module.exports = (robot) ->
  robot.respond /pull/, (msg) ->
    try
      msg.send "git pulling..."
      child_process.exec 'git pull', (error, stdout, stderr) ->
        if error
          msg.send "get pull failed: " + stderr
        else
          output = stdout+''
          if not /Already up\-to\-date/.test output
            msg.send "Updated!!"
            setTimeout () ->
              msg.send "Restarting..."
              process.exit()
            , 500
          else
            msg.send "Nothing to do."
    catch e
      msg.send "git pull failed: " + e

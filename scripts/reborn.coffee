child_process = require 'child_process'

module.exports = (robot) ->
  robot.hear /bot.*reborn/, (bot) ->
    try
      robot.adapter.notice bot.envelope, "updating..."
      child_process.exec 'git pull', (error, stdout, stderr) ->
        if error
          robot.adapter.notice bot.envelope, "git pull failed: " + stderr
        else
          output = stdout+''
          if not /Already up\-to\-date/.test output
            robot.adapter.notice bot.envelope, "botが更新されました: " + output
            robot.adapter.notice bot.envelope, "再起動します"
            process.exit()
          else
            robot.adapter.notice bot.envelope, "botは最新です"
    catch e
      robot.adapter.notice bot.envelope, "git pull failed:" + e

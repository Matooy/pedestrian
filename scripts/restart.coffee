
child_process = require 'child_process'

module.exports = (robot) ->
  robot.respond /restart/i, (msg) ->
    msg.send "Restarting..."
    process.exit()

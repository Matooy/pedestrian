
module.exports = (robot) ->

  robot.hear /hola/i, (msg) ->
    msg.send "Hola."

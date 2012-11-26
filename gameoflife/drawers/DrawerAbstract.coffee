module.exports = class
 constructor: () ->
 useField: (@field) ->
 
 clearConsole: ->
   process.stdout.write '\u001B[2J\u001B[0;0f' # clear screen
 

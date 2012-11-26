module.exports = class extends require('./DrawerAbstract')
 constructor: () ->
   @turns = 0
   @startTime = new Date().getTime()

   
 
 draw: () ->
   @clearConsole()
   now = new Date().getTime()
   duration = now - @startTime
   
   turnsPerSecond = @turns / duration*1000
   console.log "turn: #{@turns}\tturns per second:#{turnsPerSecond}\tDuration: #{Math.round(duration/1000)}s";
   @turns++



module.exports = class Game
  constructor: () ->
    @stepTime = 10
  setStepTime: (@stepTime) ->
  useEngine: (@engine) ->
  useDrawer: (@drawer) ->
  useField: (@field) ->  
    
  start: ()=>
    @engine.useField @field
    @drawer.useField @field
    
    @doTurn()

  doTurn: ()=>
    @drawer.draw()
    @engine.doTurn()
    
    
    setTimeout (=> @doTurn()), @stepTime
    
    
      

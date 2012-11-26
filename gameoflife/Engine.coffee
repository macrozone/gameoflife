module.exports = class
  constructor: () ->
    @drawers = []
    @stepTime = 0
    
  setStepTime: (@stepTime) ->
  useLogic: (@logic) ->
  addDrawer: (drawer) ->
    @drawers.push drawer
  useField: (@field) ->  
    
  start: ()=>
   

    @logic.useField @field

    drawer.useField @field for drawer in @drawers
    @doTurn()

  doTurn: ()=>
  
    drawer.draw() for drawer in @drawers
    @logic.doTurn()
    if @stepTime >0
      setTimeout (=> @doTurn()), @stepTime
    else
      process.nextTick (=> @doTurn())
    

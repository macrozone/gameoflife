Engine = require('./Engine')
engineWorker = {}
#engineWorker.on 'doTurn', () ->
 # engine.doTurn()

engine = new Engine()

process.on 'message', (m) =>
  switch m.id
    when 'init' 
      engine.useField m.field
      process.send {id: 'ready'}
     
 
      
    when 'doTurn' 
      field = engine.getField()
      field[field.length-1] = m.lastRow
      engine.doTurn()
      process.send {id: "done", field: engine.getField()}
      
  
  

## this module is not working yet

module.exports = class
  constructor: () ->
    @drawers = []
    @stepTime = 0
    @numCPUs = require('os').cpus().length
    @initWorkers()
    @workersDone = 0
    @workersReady = 0
    
  initWorkers: () ->
    
    @workers = []

    for i in [0..@numCPUs-1]
      worker = {}
      worker.process = child_process.fork './logicWorker'
      worker.process.on 'message', (data)=>
        console.log data
      @workers.push worker
      
  setStepTime: (@stepTime) ->
  useLogic: (@logic) ->
  addDrawer: (drawer) ->
    @drawers.push drawer
  useField: (@field) ->  
    
  start: ()=>
   
    height = @field.length
    for worker, index in @workers
      
      heightPart = Math.ceil height / @numCPUs 
      worker.from = index * heightPart - 1
      worker.to = (index+1) * heightPart
     
      worker.ready = false
      part = @field[worker.from..worker.to]
      worker.process.send {id: "init", field: part}
      worker.process.on 'message', (m) =>
        console.log m
        switch m.id
          when 'done' then @onWorkerDone worker, m.field
          when 'ready' then @onWorkerReady worker
      
    #@logic.useField @field

   
    drawer.useField @field for drawer in @drawers
    #@doTurn()

  doTurn: ()=>
  
    drawer.draw() for drawer in @drawers
    #@logic.doTurn()
    
    @workersDone = 0
    for worker, index in @workers
      worker.done = false
      rowToReplace = @field[worker.to]
      worker.process.send {id: 'doTurn', 'lastRow': rowToReplace}
    
      
    #if @stepTime >0
    #  setTimeout (=> @doTurn()), @stepTime
    #else
    #  process.nextTick (=> @doTurn())
  onWorkerReady: (worker) =>
    console.log "worker ready" + @workersReady
    worker.ready = true
    @workersReady++
    
    if(@workersReady >= @workers.length-1)
      
      @doTurn()
  
  onWorkerDone: (worker, result) =>
    
    worker.ready = true
    @field[worker.from+1..worker.to-1] = result
    @workersDone++
    
    if(@workersDone >= @workers.length-1)
      @workersDone = 0
      if @stepTime >0
        setTimeout (=> @doTurn()), @stepTime
      else
        process.nextTick (=> @doTurn())
    
    
      

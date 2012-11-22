module.exports = class Engine
 constructor: () ->
   
 useField: (@field) ->
   
 
 doTurn: ()->
  
  next = []
  for row, y in @field
    next[y] = []
    for cell, x in row
      next[y][x] = @isStillAlive cell, x, y
      
      #process.stdout.write if @next[y][x] then "alive] " else "dead] "
    #process.stdout.write '\n'
  
  for row, y in next
    for cell, x in row
      @field[y][x] = cell
  
  


      
  
 isStillAlive: (wasAlive, x,y) ->
    
    neighbors = @countNeighbors x, y
    #process.stdout.write "["+neighbors
    return true if !wasAlive and neighbors == 3
    return false if wasAlive and neighbors < 2
    return true if wasAlive and 2 <= neighbors <= 3
    return false
    
 countNeighbors: (x,y) ->
   neighbors = 0
 
   neighbors++ if @field[y-1]?[x-1]
   
   neighbors++ if @field[y]?[x-1]
   neighbors++ if @field[y+1]?[x-1]
   
   neighbors++ if @field[y-1]?[x]
   neighbors++ if @field[y+1]?[x]
 
   neighbors++ if @field[y-1]?[x+1]
   neighbors++ if @field[y]?[x+1]
   neighbors++ if @field[y+1]?[x+1]
   neighbors
     

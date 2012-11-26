module.exports = class
 constructor: () ->
   @next = []
 useField: (@field) ->

 
 getField: () ->
   @field
 
 
 doTurn: ()->
  
  for row, y in @field

    if not @next[y]? then @next[y] = []
    for cell, x in row
      @next[y][x] = @isStillAlive cell, x, y
      
  
  # copy array back in field
  for row, y in @next
    for cell, x in row
      @field[y][x] = cell

 isStillAlive: (wasAlive, x,y) ->
    neighbors = @countNeighbors x, y
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
     

module.exports = class
  constructor: () ->
   @possibility = 0.25
   @width = 10
   @height = 10
    
  setWidth: (@width) ->
    
  setHeight: (@height) ->
  
  setPossibility: (@possibility) ->
  
  createRandom: () ->
    (@randomCell() for a in [0..@width-1] for b in [0..@height-1])
    
  randomCell: () ->
    if Math.random() < @possibility then true else false

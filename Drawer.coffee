module.exports = class Drawer
 constructor: () ->
 useField: (@field) ->
   
 draw: () ->
   process.stdout.write '\u001B[2J\u001B[0;0f' # clear screen
   @drawRow row, y for row, y in @field
   
 drawRow: (row, y)=>
  @drawCell cell, x, y for cell, x in row
  process.stdout.write '\n'
 drawCell: (cell, x, y) ->
   process.stdout.write if cell then '#' else ' '
   



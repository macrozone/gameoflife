module.exports = class extends require('./DrawerAbstract')
 constructor: () ->
   
 draw: () ->
   @clearConsole()
   @drawRow row, y for row, y in @field
   
 drawRow: (row, y)=>
  @drawCell cell, x, y for cell, x in row
  process.stdout.write '\n'
 drawCell: (cell, x, y) ->
  process.stdout.write if cell then '#' else ' '
   



gol = require './gameoflife/app.coffee'

fieldCreator = new gol.FieldCreator()
fieldCreator.setWidth 80
fieldCreator.setHeight 60
fieldCreator.setPossibility 0.5


field = fieldCreator.createRandom()


app = gol.create()

app.setStepTime 10

logic = new gol.Logic()

app.addDrawer new gol.ConsoleDrawer()

#app.addDrawer new gol.StatsDrawer()
app.useLogic logic
app.useField field



app.start()

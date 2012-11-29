gol = require './gameoflife'

fieldCreator = new gol.FieldCreator()
fieldCreator.setWidth 160
fieldCreator.setHeight 40
fieldCreator.setPossibility 0.5


field = fieldCreator.createRandom()


app = gol.create()

app.setStepTime 1

logic = new gol.Logic()

app.addDrawer new gol.ConsoleDrawer()

#app.addDrawer new gol.StatsDrawer()
app.useLogic logic
app.useField field



app.start()

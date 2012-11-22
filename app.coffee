FieldCreator = require './FieldCreator'
Drawer = require './Drawer'
Engine = require './Engine'
Game = require './Game'


fieldCreator = new FieldCreator
fieldCreator.setWidth 80
fieldCreator.setHeight 80
fieldCreator.setPossibility 0.2
field = fieldCreator.createRandom()


app = new Game()
drawer = new Drawer()
engine = new Engine()

app.useDrawer drawer
app.useEngine engine
app.useField field



app.start()

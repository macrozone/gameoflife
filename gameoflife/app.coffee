module.exports =
  FieldCreator: require('./FieldCreator')
  Logic: require('./Logic')
  ConsoleDrawer: require('./drawers/ConsoleDrawer')
  StatsDrawer: require('./drawers/StatsDrawer')
  create: ->
    new (require './Engine')
  createMulticore: ->
    new require('./MulticoreEngine')

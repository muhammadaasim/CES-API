var routes = require('express').Router();

var {getConfig,updateConfig} = require('../controller/config')
routes.get('/', getConfig)
routes.put('/:id', updateConfig)

module.exports = routes;
var routes = require('express').Router();

var {getRecheck,getRecheckByDeptId,insertRecheck} = require('../controller/recheck')
routes.get('/', getRecheck)
routes.post('/', insertRecheck)
routes.get('/:id', getRecheckByDeptId)

module.exports = routes;
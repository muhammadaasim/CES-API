var routes = require('express').Router();

var {getRecheck,getRecheckByDeptId,insertRecheck,UpdateStatus} = require('../controller/recheck')
routes.get('/', getRecheck)
routes.post('/', insertRecheck)
routes.get('/:id', getRecheckByDeptId)
routes.put('/updatestatus/:id', UpdateStatus);

module.exports = routes;
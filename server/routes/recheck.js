var routes = require('express').Router();

var {getRecheck,getRecheckByDeptId,insertRecheck,UpdateStatus,UpdateMarks} = require('../controller/recheck')
routes.get('/', getRecheck)
routes.post('/', insertRecheck)
routes.get('/:id', getRecheckByDeptId)
routes.put('/updatestatus/:id', UpdateStatus);
routes.put('/updatemarks/:id', UpdateMarks);


module.exports = routes;
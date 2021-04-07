var routes = require('express').Router();

var {getIncharge,getInchargeById,getInchargeByDept,insertIncharge,loginIncharge} = require('../controller/incharge')

routes.get('/', getIncharge)
routes.post('/', insertIncharge)
routes.post('/login', loginIncharge)
routes.get('/dept/:id', getInchargeByDept)
routes.get('/:id', getInchargeById)

module.exports = routes;
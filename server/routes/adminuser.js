var routes = require('express').Router();

var {getadmin,getadminById,insertadmin,status,loginadmin} = require('../controller/adminuser')

routes.get('/', getadmin)
routes.post('/', insertadmin)
routes.post('/login', loginadmin)
routes.get('/:id', getadminById)

module.exports = routes;
var routes = require('express').Router();

var {GetExamController,getControllerById,loginController,insertController} = require('../controller/examcontroller')

routes.get('/', GetExamController)
routes.post('/', insertController)
routes.post('/login', loginController)
routes.get('/:id', getControllerById)

module.exports = routes;
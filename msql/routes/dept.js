var routes = require('express').Router();

var {getDepartment,insertDepartment,getDepartmentById} = require('../controller/dept')
routes.get('/', getDepartment)
routes.post('/', insertDepartment)
routes.get('/:id', getDepartmentById)

module.exports = routes;
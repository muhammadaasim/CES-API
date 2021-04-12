var routes = require('express').Router();

var {insertExamForm} = require('../controller/examform')
// routes.get('/', getDepartment)
routes.post('/', insertExamForm)
// routes.get('/:id', getDepartmentById)

module.exports = routes;
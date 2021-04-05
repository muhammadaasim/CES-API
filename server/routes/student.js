var routes = require('express').Router();

var {getStudent,insertStudent,getStudentById} = require('../controller/student')
routes.get('/', getStudent)
routes.post('/', insertStudent)
routes.get('/:id', getStudentById)

module.exports = routes;
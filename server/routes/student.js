var routes = require('express').Router();

var {getStudent,insertStudent,getStudentById,updateStudent} = require('../controller/student')
routes.get('/', getStudent)
routes.post('/', insertStudent)
routes.get('/:id', getStudentById)
routes.put('/:id', updateStudent)

module.exports = routes;
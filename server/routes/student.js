var routes = require('express').Router();

var {getStudent,insertStudent,getStudentById,updateStudent,loginStudent} = require('../controller/student')
routes.get('/', getStudent)
routes.post('/', insertStudent)

routes.post('/login', loginStudent)

routes.get('/:id', getStudentById)
routes.put('/:id', updateStudent)

module.exports = routes;
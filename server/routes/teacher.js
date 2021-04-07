var routes = require('express').Router();

var {getTeacher,getTeacherById,getTeacherByDept,insertTeacher,loginTeacher} = require('../controller/teacher')

routes.get('/', getTeacher)
routes.post('/', insertTeacher)
routes.post('/login', loginTeacher)
routes.get('/dept/:id', getTeacherByDept)
routes.get('/:id', getTeacherById)

module.exports = routes;
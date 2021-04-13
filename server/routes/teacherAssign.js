var routes = require('express').Router();

var { getTeacherAssign,getTeacherAssignByID,getTeacherAssignByHodID,getTeacherAssignBySemID,AssignSubject,getTeacherAssignBySession} = require('../controller/teacherAssign')
routes.get('/',getTeacherAssign)
routes.post('/', AssignSubject)
routes.get('/:id', getTeacherAssignByID)
routes.get('/session/:session', getTeacherAssignBySession)
routes.get('/hod/:id', getTeacherAssignByHodID)
routes.get('/sem/:id', getTeacherAssignBySemID)

module.exports = routes;
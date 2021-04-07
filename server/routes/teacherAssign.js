var routes = require('express').Router();

var { getTeacherAssign,getTeacherAssignByID,getTeacherAssignByHodID } = require('../controller/teacherAssign')
routes.get('/',getTeacherAssign)
// routes.post('/', insertSubject)
routes.get('/:id', getTeacherAssignByID)
routes.get('/incharge/:id', getTeacherAssignByHodID)
// routes.get('/sem/:id', getSubjectBySemId)

module.exports = routes;
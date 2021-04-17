var routes = require('express').Router();

var { getTeacherAssign,getTeacherAssignByID,getTeacherAssignByHodID,teacherassignedsubjectformByTid
    ,getTeacherAssignBySemID,AssignSubject,getTeacherAssignBySession,teacherassignedsubjectform,deassign} = require('../controller/teacherAssign')
routes.get('/',getTeacherAssign)
routes.post('/', AssignSubject)
routes.get('/form/:id',teacherassignedsubjectformByTid)
routes.delete('/deassign/',deassign)
routes.get('/form',teacherassignedsubjectform)
routes.get('/:id', getTeacherAssignByID)
routes.get('/session/:session', getTeacherAssignBySession)
routes.get('/hod/:id', getTeacherAssignByHodID)
routes.get('/sem/:id', getTeacherAssignBySemID)



module.exports = routes;
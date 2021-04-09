var routes = require('express').Router();

var {getSubject,insertSubject,getSubjectById,getSubjectBySemId,getSubjectByDeptId} = require('../controller/subject')
routes.get('/', getSubject)
routes.get('/dept/:id', getSubjectByDeptId)
routes.post('/', insertSubject)
routes.get('/:id', getSubjectById)
routes.get('/sem/:id', getSubjectBySemId)

module.exports = routes;
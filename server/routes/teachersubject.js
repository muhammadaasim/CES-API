var routes = require('express').Router();

var {getSubject,insertSubject,getSubjectById,getSubjectBySemId} = require('../controller/subject')
routes.get('/', getSubject)
routes.post('/', insertSubject)
routes.get('/:id', getSubjectById)
routes.get('/sem/:id', getSubjectBySemId)

module.exports = routes;
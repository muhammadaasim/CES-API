var routes = require('express').Router();

var {insertExamForm,UpdateStatus,getExamforms,getExamFormByStdId,insertSubjects,getExamformswithsubj} = require('../controller/examform')
routes.get('/', getExamforms)
routes.get('/:id', getExamFormByStdId)
routes.post('/', insertExamForm)
routes.post('/subject/', insertSubjects)
routes.put('/updatestatus/:formid',UpdateStatus);
// routes.get('/subjects', getExamformswithsubj)
// routes.get('/subjects/:id', getExamFormwithsubByStdId)

module.exports = routes;
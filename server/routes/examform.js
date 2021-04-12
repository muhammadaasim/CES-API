var routes = require('express').Router();

var {insertExamForm,UpdateStatus,getExamforms} = require('../controller/examform')
routes.get('/', getExamforms)
routes.post('/', insertExamForm)
routes.put('/updatestatus/:formid',UpdateStatus);
// routes.get('/:id', getDepartmentById)

module.exports = routes;
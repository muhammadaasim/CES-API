var routes = require('express').Router();
var {upload} = require('../index')
var {
	insertExamForm,
	UpdateStatus,
	getExamforms,
	getExamFormByStdId,
	insertSubjects,
	getExamformswithsubj,
	getExamFormwithsubByStdId,
	getExamFormByDeptId,
	GetSlip,
	getExamFormwithsubByFormId
} = require('../controller/examform');
routes.get('/', getExamforms);
routes.get('/subject', getExamformswithsubj);
routes.get('/subject/:id', getExamFormwithsubByStdId);
routes.get('/form/:id', getExamFormwithsubByFormId);
routes.get('/dept/:id', getExamFormByDeptId);
routes.get('/:id', getExamFormByStdId);
routes.post('/', upload.single('image'),insertExamForm);
routes.post('/subject', insertSubjects);
routes.get('/slip/:session/:id', GetSlip);
routes.put('/updatestatus/:formid', UpdateStatus);


module.exports = routes;

var routes = require('express').Router();

var {
	getSubject,
	insertSubject,
	getSubjectById,
	getSubjectBySemId,
	getSubjectByDeptId,
    updateSubjectStatus
} = require('../controller/subject');
routes.get('/', getSubject);
routes.get('/dept/:id', getSubjectByDeptId);
routes.post('/', insertSubject);
routes.get('/:id', getSubjectById);
routes.get('/sem/:id', getSubjectBySemId);
routes.put('/status/:id', updateSubjectStatus);

module.exports = routes;

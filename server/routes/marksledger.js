var routes = require('express').Router();

var {
	getMarks,
	getMarksByFormID,
	GetMarksByDept,
	UpdateStatus
} = require('../controller/marksledger');

routes.get('/', getMarks);
routes.get('/:id', getMarksByFormID);
routes.get('/dept/:id', GetMarksByDept);
routes.put('/updatestatus/:id', UpdateStatus);


module.exports = routes;

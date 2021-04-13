var routes = require('express').Router();

var {
	getMarks,
	getMarksByFormID,
	GetMarksByDept,
	UpdateStatus, updateIsMarked
} = require('../controller/marksledger');

routes.get('/', getMarks);
routes.get('/:id', getMarksByFormID);
routes.get('/dept/:id', GetMarksByDept);
routes.put('/updatestatus/:id', UpdateStatus);
routes.put('/ismarked', updateIsMarked);


module.exports = routes;

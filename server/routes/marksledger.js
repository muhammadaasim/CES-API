var routes = require('express').Router();

var {
	getMarks,
	getMarksByHodID,
	GetMarksByDept,
	UpdateStatus,
	DeleteIsMarked,
	insertMarksLedger,
	Getmarksheet
} = require('../controller/marksledger');

routes.get('/', getMarks);
routes.post('/', insertMarksLedger);
routes.get('/hod/:id', getMarksByHodID);
routes.get('/dept/:id', GetMarksByDept);
routes.get('/getmarksheet/:std_id/:sem_id', Getmarksheet);
routes.put('/updatestatus/:id', UpdateStatus);
routes.delete('/ismarked', DeleteIsMarked);


module.exports = routes;

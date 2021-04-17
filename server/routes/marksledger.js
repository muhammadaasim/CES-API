var routes = require('express').Router();

var {
	getMarks,
	getMarksByHodID,
	GetMarksByDept,
	UpdateStatus,
	updateIsMarked,
	insertMarksLedger,
	Getmarksheet,
	UpdateMarks
} = require('../controller/marksledger');

routes.get('/', getMarks);
routes.post('/', insertMarksLedger);
routes.get('/hod/:id', getMarksByHodID);
routes.put('/updatemarks/:id', UpdateMarks);
routes.get('/dept/:id', GetMarksByDept);
routes.get('/getmarksheet/:std_id/:sem_id', Getmarksheet);
routes.put('/updatestatus/:id', UpdateStatus);
routes.put('/ismarked/:id', updateIsMarked);


module.exports = routes;

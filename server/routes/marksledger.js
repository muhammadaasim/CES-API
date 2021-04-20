var routes = require('express').Router();

var {
	getMarks,
	getMarksByHodID,
	GetMarksByDept,
	UpdateStatus,
	updateIsMarked,
	insertMarksLedger,
	GetMarksheet,
	UpdateMarks,
	getledger
} = require('../controller/marksledger');

routes.get('/ledger', getledger);
routes.get('/', getMarks);
routes.post('/', insertMarksLedger);
routes.get('/hod/:id', getMarksByHodID);
routes.put('/updatemarks/:id', UpdateMarks);
routes.get('/dept/:id', GetMarksByDept);
routes.get('/getmarksheet/:std_id/:sem_id', GetMarksheet);
routes.put('/updatestatus/:id', UpdateStatus);
routes.put('/ismarked/:id', updateIsMarked);


module.exports = routes;

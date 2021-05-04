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
	getledger,
	getMarksByID,
	PromoteStd,
	GetStdList,
	GetGazzated, GPStd

} = require('../controller/marksledger');



routes.get('/getpassedstd', GPStd);
routes.get('/gazzated', GetGazzated);
routes.get('/ledger', getledger);
routes.get('/', getMarks);
routes.get('/:id', getMarksByID);
routes.post('/', insertMarksLedger);
routes.get('/hod/:id', getMarksByHodID);
routes.put('/promotestd', PromoteStd);
routes.put('/updatemarks/:id', UpdateMarks);
routes.get('/dept/:id', GetMarksByDept);
routes.get('/getmarksheet/:std_id/:sem_id', GetMarksheet);
routes.put('/updatestatus/:id', UpdateStatus);
routes.put('/ismarked/:id', updateIsMarked);
routes.get('/stdlist', GetStdList);




module.exports = routes;

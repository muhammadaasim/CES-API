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
	GetStdList,GetGazzated1,
	GetGazzated, GPStd,GetTranscript,GetTermback

} = require('../controller/marksledger');



routes.get('/termback', GetTermback);
routes.get('/getpassedstd', GPStd);
routes.get('/gazzated', GetGazzated);
routes.get('/gazzated1', GetGazzated1);
routes.get('/ledger', getledger);
routes.get('/', getMarks);
routes.get('/:id', getMarksByID);
routes.post('/', insertMarksLedger);
routes.get('/hod/:id', getMarksByHodID);
routes.put('/promotestd', PromoteStd);
routes.put('/updatemarks/:id', UpdateMarks);
routes.get('/dept/:id', GetMarksByDept);
routes.get('/getmarksheet/:std_id/:sem_id', GetMarksheet);
routes.get('/getts/:std_id', GetTranscript);
routes.put('/updatestatus/:id', UpdateStatus);
routes.put('/ismarked/:id', updateIsMarked);
routes.get('/stdlist', GetStdList);




module.exports = routes;

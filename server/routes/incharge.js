var routes = require('express').Router();
var { upload } = require('../index');
var {
	getIncharge,
	getInchargeById,
	getInchargeByDept,
	insertIncharge,
	loginIncharge
} = require('../controller/incharge');

routes.get('/', getIncharge);
routes.post('/', upload.single('image'), insertIncharge);
routes.post('/login/', loginIncharge);
routes.get('/dept/:id', getInchargeByDept);
routes.get('/:id', getInchargeById);

module.exports = routes;

var routes = require('express').Router();
// var { upload } = require('../uploads/index')

var { upload } = require('../index');
var {
	getStudent,
	insertStudent,
	getStudentById,
	updateStudent,
	loginStudent,
	getStudentDeptId,
	status
} = require('../controller/student');
routes.get('/', getStudent);
routes.put('/status/', status);
routes.post('/', upload.single('image'), insertStudent);

routes.post('/login', loginStudent);

routes.get('/:id', getStudentById);
routes.get('/dept/:id', getStudentDeptId);
routes.put('/update/:id', upload.single('image'), updateStudent);

module.exports = routes;

var routes = require('express').Router();
var {upload} = require('../index')
var { getTeacher,
    getTeacherById,
    getTeacherByDept,
    insertTeacher,
    loginTeacher } = require('../controller/teacher');

routes.get('/', getTeacher);
routes.post('/',upload.single('image'), insertTeacher);
routes.post('/login', loginTeacher);
routes.get('/dept/:id', getTeacherByDept);
routes.get('/:id', getTeacherById);

module.exports = routes;

var routes = require('express').Router();

var {getSemester,insertSemester,getSemesterById,getSemesterByProgId,getSemesterByStdId,getSemesterByDeptId,insertEightSemester} = require('../controller/semester')
routes.get('/', getSemester)
routes.post('/', insertSemester)
routes.get('/std/:id/:id', getSemesterByStdId)
routes.get('/:id', getSemesterById)
routes.get('/prog/:id', getSemesterByProgId)
routes.post('/inserteightsemester', insertEightSemester)


module.exports = routes;
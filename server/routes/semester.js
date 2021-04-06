var routes = require('express').Router();

var {getSemester,insertSemester,getSemesterById,getSemesterByProgId} = require('../controller/semester')
routes.get('/', getSemester)
routes.post('/', insertSemester)
routes.get('/:id', getSemesterById)
routes.get('/prog/:id', getSemesterByProgId)

module.exports = routes;
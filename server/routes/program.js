var routes = require('express').Router();

var {getProgram,insertProgram,getProgramById,getProgramByDeptId} = require('../controller/prog')
routes.get('/', getProgram)
routes.post('/', insertProgram)
routes.get('/:id', getProgramById)
routes.get('/dept/:id', getProgramByDeptId)

module.exports = routes;
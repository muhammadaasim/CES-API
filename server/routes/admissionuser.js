var routes = require('express').Router();

var {getadmission,getadmissionById,insertadmission,status,loginadmission} = require('../controller/admissionuser')

routes.get('/', getadmission)
routes.post('/', insertadmission)
routes.post('/login', loginadmission)
routes.get('/:id', getadmissionById)

module.exports = routes;
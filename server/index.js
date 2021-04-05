var express = require('express');
var app = express();
app.use(express.json());

var dept = require('./routes/dept')
app.use('/dept', dept)

var student = require('./routes/student')
app.use('/student', student);

app.listen(4000, () => console.log('Server running'));

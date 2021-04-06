var express = require('express');
var cors=require('cors')
var app = express();


app.use(express.json());
app.use(cors());


var dept = require('./routes/dept')
app.use('/dept', dept)


var student = require('./routes/student')
app.use('/student', student);

var config = require('./routes/config')
app.use('/config', config);

app.listen(4000, () => console.log('Server running'));

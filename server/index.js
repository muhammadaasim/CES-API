var express = require('express');
var cors=require('cors')
var app = express();


app.use(express.json());
app.use(cors());


var dept = require('./routes/dept')
app.use('/dept', dept)

var prog = require('./routes/program')
app.use('/prog', prog);

var semester = require('./routes/semester')
app.use('/semester', semester);

var student = require('./routes/student')
app.use('/student', student);

var subject = require('./routes/subject')
app.use('/subject', subject);


var teacher = require('./routes/teacher')
app.use('/teacher', teacher);

var incharge = require('./routes/incharge')
app.use('/incharge', incharge);

var teacherassign = require('./routes/teacherAssign')
app.use('/teacherassign', teacherassign);


var config = require('./routes/config')
app.use('/config', config);

app.listen(4000, () => console.log('Server running'));

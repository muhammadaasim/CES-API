var express = require('express');
var cors = require('cors');
var app = express();

app.use(express.json());
app.use(cors());
app.use('/uploads', express.static('uploads'));

const multer = require('multer');

const DIR = './uploads/';

const Storage = multer.diskStorage({
	destination: function(req, file, cb) {
		cb(null, DIR);
	},
	filename: function(req, file, cb) {
		const fileName = file.originalname.toLocaleLowerCase().split(' ').join('-');
		cb(null, fileName);
	}
});
const fileFilter = (req, file, cb) => {
	if (file.mimetype === 'image/jpeg' || file.mimetype === 'image/png' || file.mimetype === 'image/jpg') {
		cb(null, true);
	} else {
		cb(null, false);
	}
};
module.exports.upload = multer({
	storage: Storage,
	limits: {
		fileSize: 1024 * 1024 * 5
	},
	fileFilter: fileFilter
});

var dept = require('./routes/dept');
app.use('/dept', dept);

var prog = require('./routes/program');
app.use('/prog', prog);

var semester = require('./routes/semester');
app.use('/semester', semester);

var student = require('./routes/student');
app.use('/student', student);

var subject = require('./routes/subject');
app.use('/subject', subject);

var teacher = require('./routes/teacher');
app.use('/teacher', teacher);

var incharge = require('./routes/incharge');
app.use('/incharge', incharge);

var teacherassign = require('./routes/teacherAssign');
app.use('/teacherassign', teacherassign);

var examcontroller = require('./routes/examcontroller');
app.use('/controller', examcontroller);

var examform = require('./routes/examform');
app.use('/examform', examform);

var marksledger = require('./routes/marksledger');
app.use('/marksledger', marksledger);

var admissionuser = require('./routes/admissionuser');
app.use('/admissionuser', admissionuser);

var config = require('./routes/config');
app.use('/config', config);

app.listen(4000, () => console.log('Server running on PORT = 4000'));

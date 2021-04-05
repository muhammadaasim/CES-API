var express = require('express');
var app = express();
app.use(express.json());

var dept = require('./routes/dept')
app.use('/dept', dept)

app.listen(4000, () => console.log('Server running'));

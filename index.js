
var mysql = require('mysql')
var connection = mysql.createConnection({
  host: 'localhost',
  user: 'mohsin',
  password: 'mohsinsoomro',
  port: '3306', 
  database: 'ces'
});

connection.connect(function(err) {
  if (err) throw err;
  connection.query("SELECT * FROM getAssignedTeacherByID where teacher_id=1", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
  });
});
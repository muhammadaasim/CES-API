var mysql = require('mysql');


module.exports.connection = mysql.createPool({
host:'sql6.freemysqlhosting.net',
user:'sql6403518',
password:'eYpYSTqByG', 
port: '3306',
database:'sql6403518'
});


// host: 'localhost',
//   user: 'mohsin',
//   password: 'mohsinsoomro',
//   port: '3306', 
//   database: 'ces'

// host: 'localhost',
// user: 'root',
// password: 'mohsin11',
// port: '3306',
// database: 'ces'
// });
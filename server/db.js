var mysql = require('mysql');


module.exports.connection = mysql.createPool({
    host: 'localhost',
    user: 'mohsin',
    password: 'Mohsin11',
    port: '3306', 
    database: 'ces'
});



// host: 'localhost',
// user: 'root',
// password: 'mohsin11',3
// port: '3306',
// database: 'ces'
// });
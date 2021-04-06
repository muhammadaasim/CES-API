var mysql = require('mysql');


module.exports.connection = mysql.createPool({
    host: 'localhost',
    user: 'mohsin',
    password: 'mohsinsoomro',
    port: '3306', 
    database: 'ces'
});



// host: 'localhost',
// user: 'root',
// password: 'mohsin11',
// port: '3306',
// database: 'ces'
// });
var mysql = require('mysql');


// const db_connection = mysql.createPool({
module.exports.connection = mysql.createPool({
	host: 'localhost',
	user: 'mohsin',
	password: 'mohsinsoomro',
	port: '3306', 
	database: 'ces'
});
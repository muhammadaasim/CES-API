var mysql = require('mysql');


// const db_connection = mysql.createPool({
module.exports.connection = mysql.createPool({
	host: 'localhost',
	user: 'root',
	password: 'mohsin11',
	port: '3306',
	database: 'ces'
});
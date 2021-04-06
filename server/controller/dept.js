var { connection } = require('../db');
module.exports.getDepartment = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			console.log('MySQL Connection Established: ', connection.threadId);
			connection.query('SELECT * FROM dept', function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ error:"",success: 'success', result: rows });
				connection.release((err) => console.log(err));
			});
		});
	} catch (e) {
		res.send({ error: 'Error getting department', department: [], success: 'Failed' });
	}
};
module.exports.getDepartmentById = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('SELECT * FROM dept WHERE id= ?', [ req.params.id ], function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ result: rows });
				connection.release((er) => console.log(er));
			});
		});
		// await connection.query('SELECT * FROM dept WHERE id= ?', [ req.params.id ], function(err, rows, fields) {
		// 	if (err) throw err;
		// 	res.send({ error: '', success: 'success', department: rows });
		// });
		// connection.end();
	} catch (e) {
		res.send({ error: 'Error getting department', department: [], success: 'Failed' });
	}
};

module.exports.insertDepartment = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(`INSERT INTO dept SET ?`, { name: req.body.name }, function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ error: null, message: 'Insert successfully', result: rows });
				connection.release((er) => console.log(er));
			});
		});
	} catch (e) {
		res.send({ error: 'Error getting department', department: [], success: 'Failed' });
	}
};

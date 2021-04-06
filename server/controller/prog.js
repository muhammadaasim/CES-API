var { connection } = require('../db');
module.exports.getProgram = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			console.log('MySQL Connection Established: ', connection.threadId);
			connection.query('SELECT * FROM GetPrograms;', function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ error:"",success: 'success', result: rows });
				connection.release((err) => console.log(err));
			});
		});
	} catch (e) {
		res.send({ error: 'Error getting program', program: [], success: 'Failed' });
	}
};
module.exports.getProgramById = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('SELECT * FROM GetPrograms WHERE prog_id= ?', [ req.params.id ], function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ result: rows });
				connection.release((er) => console.log(er));
			});
		});

	} catch (e) {
		res.send({ error: 'Error getting program', program: [], success: 'Failed' });
	}
};

module.exports.getProgramByDeptId = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('SELECT * FROM GetPrograms WHERE dept_id= ?', [ req.params.id ], function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ result: rows });
				connection.release((er) => console.log(er));
			});
		});

	} catch (e) {
		res.send({ error: 'Error getting program', program: [], success: 'Failed' });
	}
};

module.exports.insertProgram = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(`INSERT INTO program SET ?`, [{ name: req.body.name,dept_id: req.body.dept_id }], function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ error: null, message: 'Insert successfully', result: rows });
				connection.release((er) => console.log(er));
			});
		});
	} catch (e) {
		res.send({ error: 'Error getting program', program: [], success: 'Failed' });
	}
};

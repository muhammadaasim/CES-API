var { connection } = require('../db');
module.exports.getTeacher = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			console.log('MySQL Connection Established: ', connection.threadId);
			connection.query('SELECT * FROM GetTeacher', function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ error: '', success: 'success', result: rows });
				connection.release((err) => console.log(err));
			});
		});
	} catch (e) {
		res.send({
			error: 'Error getting teacher',
			result: [],
			success: 'Failed'
		});
	}
};
module.exports.getTeacherById = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('SELECT * FROM GetTeacher WHERE id = ?', [ req.params.id ], function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ result: rows });
				connection.release((er) => console.log(er));
			});
		});
	} catch (e) {
		res.send({
			error: 'Error getting teacher',
			result: [],
			success: 'Failed'
		});
	}
};

module.exports.getTeacherByDept = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('SELECT * FROM GetTeacher WHERE dept_id= ?', [ req.params.id ], function(
				err,
				rows,
				fields
			) {
				if (err) throw err;
				console.log(rows);
				res.send({ result: rows });
				connection.release((er) => console.log(er));
			});
		});
	} catch (e) {
		res.send({
			error: 'Error getting teacher',
			result: [],
			success: 'Failed'
		});
	}
};

module.exports.insertTeacher = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(`SELECT * FROM teacher WHERE cnic = ? `, [ req.body.cnic ], function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				if (rows.length > 0) {
					res.send({ error: 'CNIC Already exists' });
				} else {
					connection.query(
						`insert into teacher  SET ?  `,
						[
							{
								fullname: req.body.fullname,
								surname: req.body.surname,
								dept_id: req.body.dept_id,
								username: req.body.username,
								password: req.body.password,
								cnic: req.body.cnic,
								isdisabled:0
							}   
						],
						function(err, rows, fields) {
							if (err) throw err;
							console.log(rows);
							res.send({
								error: null,
								message: 'Insert successfully',
								result: rows
							});
						}
					);
				}

				connection.release((er) => console.log(er));
			});
		});
	} catch (e) {
		res.send({
			error: 'Error getting teacher',
			result: [],
			success: 'Failed'
		});
	}
};

module.exports.loginTeacher = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(
				`SELECT id FROM teacher WHERE username = ? AND password = ? AND isdisabled=0`,
				[ req.body.username, req.body.password ],
				function(err, rows, fields) {
					if (err) throw err;
					console.log(rows);
					res.send({
						error: null,
						result: rows
					});
					connection.release((er) => console.log(er));
				}
			);
		});
	} catch (e) {
		res.send({
			error: 'Error getting student login details',
			result: [],
			success: 'Failed'
		});
	}
};

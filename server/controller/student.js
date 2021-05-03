var { connection } = require('../db');
module.exports.getStudent = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			console.log('MySQL Connection Established: ', connection.threadId);
			connection.query('SELECT * FROM GetStudent ', function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ error: '', success: 'success', result: rows });
				connection.release((err) => console.log(err));
			});
		});
	} catch (e) {
		res.send({
			error: 'Error getting student',
			result: [],
			success: 'Failed'
		});
	}
};
module.exports.getStudentById = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('SELECT * FROM GetStudent WHERE id = ?', [ req.params.id ], function(err, rows, fields) {
				if (err) {
					console.log(err);
				}
				console.log(rows);
				res.send({ result: rows });
				connection.release((er) => console.log(er));
			});
		});
	} catch (e) {
		res.send({
			error: 'Error getting student',
			result: [],
			success: 'Failed'
		});
	}
};

module.exports.getStudentDeptId = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('SELECT * FROM GetStudent WHERE dept_id= ?', [ req.params.id ], function(
				err,
				rows,
				fields
			) {
				if (err) {
					console.log(err);
				}
				console.log(rows);
				res.send({ result: rows });
				connection.release((er) => console.log(er));
			});
		});
	} catch (e) {
		res.send({
			error: 'Error getting student',
			result: [],
			success: 'Failed'
		});
	}
};

module.exports.insertStudent = (req, res) => {
	try {
		if (!req.file) {
			res.send({ success: false });
		} else {
			const url = req.protocol + '://' + req.get('host');
			connection.getConnection((err, connection) => {
				if (err) throw err;
				connection.query(
					`INSERT INTO student SET ?`,
					[
						{
							rollno: req.body.rollno,
							fullname: req.body.fullname,
							prog_id: parseInt(req.body.prog_id),
							semester_id:parseInt(req.body.semester_id),
							caste: req.body.caste,
							dateofbirth: req.body.dateofbirth,
							religion: req.body.religion,
							gender: parseInt(req.body.gender),
							nationality: req.body.nationality,
							username: req.body.username,
							password: req.body.password,
							district: req.body.district,
							address: req.body.address,
							isdisabled: 0,
							fathername: req.body.fathername,
							insertiondate: new Date().getTime(),
							image: url + '/uploads/' + req.file.filename
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
						connection.release((er) => console.log(er));
					}
				);
			});
		}
	} catch (e) {
		res.send({
			error: 'Error getting student',
			result: [],
			success: 'Failed'
		});
	}
};

module.exports.updateStudent = (req, res) => {
	try {
		const url = req.protocol + '://' + req.get('host');
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(
				`UPDATE student SET ?  WHERE id=?`,
				[
					{
						rollno: req.body.rollno,
						fullname: req.body.fullname,
						fathername: req.body.fathername,
						prog_id: req.body.prog_id,
						caste: req.body.caste,
						dateofbirth: req.body.dateofbirth,
						religion: req.body.religion,
						gender: req.body.gender,
						nationality: req.body.nationality,
						district: req.body.district,
						address: req.body.address,
						username: req.body.username,
						password: req.body.password,
						isdisabled: req.body.isdisabled,
						image: url + '/uploads/' + req.file.filename
					},
					req.params.id
				],
				function(err, rows, fields) {
					if (err) throw err;
					console.log(rows);
					res.send({
						error: null,
						message: 'Updated Successful',
						result: rows
					});
					connection.release((er) => console.log(er));
				}
			);
		});
	} catch (e) {
		res.send({
			error: 'Error getting student',
			result: [],
			success: 'Failed'
		});
	}
};
module.exports.status = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(
				`UPDATE student SET isdisabled=? WHERE id=?`,
				[ req.body.isdisabled, req.body.id ],
				function(err, rows, fields) {
					if (err) throw err;
					console.log(rows);
					res.send({
						error: null,
						message: 'status changes Successful',
						result: rows
					});
					connection.release((er) => console.log(er));
				}
			);
		});
	} catch (e) {
		res.send({
			error: 'Error getting student',
			result: [],
			success: 'Failed'
		});
	}
};

module.exports.loginStudent = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(
				`SELECT id FROM student WHERE username = ? AND password = ? and isdisabled=0`,
				[ req.body.username, req.body.password ],
				function(err, rows, fields) {
					if (err) throw err;
					console.log(rows);
					if (rows) {
						res.send({
							error: null,
							result: rows
						});
						connection.release((er) => console.log(er));
					} else {
						res.send({
							error: null,
							message: 'Login Failed',
							result: ''
						});
						connection.release((er) => console.log(er));
					}
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

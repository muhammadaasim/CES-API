var { connection } = require('../db');
module.exports.getMarks = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			console.log('MySQL Connection Established: ', connection.threadId);
			connection.query('SELECT * FROM getmarksled', function(err, rows, fields) {
				if (err) throw err;
				res.send({ error: '', success: 'success', result: rows });
				connection.release((err) => console.log(err));
			});
		});
	} catch (e) {
		res.send({
			error: 'Error getting marks ledger',
			result: [],
			success: 'Failed'
		});
	}
};

module.exports.Getmarksheet = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(
				'select * from getmarksheet where std_id=? and sem_id=? and status=4',
				[ req.params.std_id, req.params.sem_id ],
				function(err, rows, fields) {
					if (err) {
						console.log(err);
					}
					res.send({ result: rows });
					connection.release((er) => console.log(er));
				}
			);
		});
	} catch (e) {
		res.send({
			error: 'Error getting marks ledger',
			result: [],
			success: 'Failed'
		});
	}
};

module.exports.getMarksByHodID = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('select * from getmarksled where hod_id= ?', [ req.params.id ], function(
				err,
				rows,
				fields
			) {
				if (err) {
					console.log(err);
				}
				res.send({ result: rows });
				connection.release((er) => console.log(er));
			});
		});
	} catch (e) {
		res.send({
			error: 'Error getting marks ledger',
			result: [],
			success: 'Failed'
		});
	}
};
module.exports.GetMarksByDept = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('SELECT * FROM getmark where dept_id=?', [ req.params.id ], function(err, rows, fields) {
				if (err) {
					console.log(err);
				}
				res.send({ result: rows });
				connection.release((er) => console.log(er));
			});
		});
	} catch (e) {
		res.send({
			error: 'Error getting from marks ledger',
			result: [],
			success: 'Failed'
		});
	}
};

module.exports.insertMarksLedger = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(
				`INSERT INTO marks_ledger SET ?`,
				[
					{
						std_id: req.body.std_id,
						sub_id: req.body.sub_id,
						t_id: req.body.t_id,
						f_id: req.body.f_id,
						midmark: req.body.midmark,
						status: 1,
						date: new Date().getTime(),
						sessionalmark: req.body.sessionalmark,
						finalmark: req.body.finalmark,
						totalmark:
							parseInt(req.body.midmark) +
							parseInt(req.body.sessionalmark) +
							parseInt(req.body.finalmark),
						remarks: ''
					}
				],
				function(err, rows, fields) {
					if (err) throw err;

					res.send({
						error: null,
						message: 'Insert successfully',
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

module.exports.UpdateStatus = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(
				`UPDATE marks_ledger SET status = ? , remarks=? WHERE  id = ?`,
				[ req.body.status, req.body.remarks, req.params.id ],
				function(err, rows, fields) {
					if (err) throw err;
					res.send({
						error: null,
						message: 'Update successfully',
						result: rows
					});
					connection.release((er) => console.log(er));
				}
			);
		});
	} catch (e) {
		res.send({
			error: 'Error getting updating data',
			result: [],
			success: 'Failed'
		});
	}
};

module.exports.updateIsMarked = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(
				`UPDATE f_form_subject SET ismarked = ? WHERE  id = ?`,
				[ req.body.ismarked, req.params.id ],
				function(err, rows, fields) {
					if (err) throw err;
					res.send({
						error: null,
						message: 'Update successfully',
						result: rows
					});
					connection.release((er) => console.log(er));
				}
			);
		});
	} catch (e) {
		res.send({
			error: 'Error getting updating data',
			result: [],
			success: 'Failed'
		});
	}
};

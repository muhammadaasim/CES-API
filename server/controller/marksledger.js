var { connection } = require('../db');
// var _=require('lodash')
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

module.exports.GPStd = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			console.log('MySQL Connection Established: ', connection.threadId);
			connection.query('SELECT * FROM getpassedstudent', function(err, rows, fields) {
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



module.exports.getMarksByID = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			console.log('MySQL Connection Established: ', connection.threadId);
			connection.query('SELECT * FROM getmarksled where id =?',[req.params.id], function(err, rows, fields) {
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

// module.exports.Getmarksheet = (req, res) => {
// 	try {
// 		connection.getConnection((err, connection) => {
// 			if (err) throw err;
// 			connection.query(
// 				'select * from getmarkshee where std_id=? and sem_id=?',
// 				[ req.params.std_id, req.params.sem_id ],
// 				function(err, rows, fields) {
// 					if (err) {
// 						console.log(err);
// 					}
// 					res.send({ result: rows });
// 					connection.release((er) => console.log(er));
// 				}
// 			);
// 		});
// 	} catch (e) {
// 		res.send({
// 			error: 'Error getting marks ledger',
// 			result: [],
// 			success: 'Failed'
// 		});
// 	}
// };




module.exports.GetGazzated = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(
				"SELECT * from GetGazzated ",
				function(err, rows, fields) {
					if (err) {
						console.log(err);
					}
			//		const filterByDept=_.chain(rows).groupBy('rollno').map((item,key)=>({rollno:key,data:item})).value()
					

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


module.exports.GetGazzated1 = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(
				"SELECT DISTINCT * FROM getgazzated1 WHERE remarks NOT IN ('termback') AND semester NOT IN ('Eighth') ",
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

module.exports.GetTermback = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(
				"SELECT DISTINCT * FROM getgazzated1 WHERE remarks IN ('termback')",
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


module.exports.getledger = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(
				'select * from getmarksledger',
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

module.exports.GetAnnualMarksheet = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query("SELECT * FROM semmarksheet WHERE SEMESTER IN ('Second','Fourth','Sixth','Eighth') AND STD_ID=1", [ req.params.std_id ], function(
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

module.exports.GetMarksheet = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('select * from semmarksheet where std_id=? and sem_id=?', [ req.params.std_id,req.params.sem_id ], function(
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
module.exports.GetTranscript = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('select * from semmarksheet where std_id=?', [ req.params.std_id], function(
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
module.exports.GetStdList = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('SELECT * FROM getgazzated1', function(err, rows, fields) {
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

module.exports.UpdateMarks = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(
				`UPDATE marks_ledger SET sessionalmark=?,midmark=?,finalmark=?,totalmark=? WHERE  id = ?`,
				[ parseInt(req.body.sessionalmark), parseInt(req.body.midmark), parseInt(req.body.finalmark), parseInt(	parseInt(req.body.midmark) +
					parseInt(req.body.sessionalmark) +
					parseInt(req.body.finalmark)), parseInt(req.params.id) ],
				function(err, rows, fields) {
					if (err) throw err;
					res.send({
						error: null,
						message: 'Marks Update successfully',
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


module.exports.PromoteStd = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(
				`UPDATE student SET semester_id=semester_id+1 WHERE id=?`,
				req.body.std_id,
				function(err, rows, fields) {
					if (err) throw err;
					res.send({
						error: null,
						message: 'Marks Update successfully',
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
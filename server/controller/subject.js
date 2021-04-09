var { connection } = require('../db');
module.exports.getSubject = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			console.log('MySQL Connection Established: ', connection.threadId);
			connection.query('SELECT * FROM GetSubjects', function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ error:"",success: 'success', result: rows });
				connection.release((err) => console.log(err));
			});
		});
	} catch (e) {
		res.send({ error: 'Error getting subject', subject: [], success: 'Failed' });
	}
};
module.exports.getSubjectById = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('SELECT * FROM GetSubjects WHERE subj_id= ?', [ req.params.id ], function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ result: rows });
				connection.release((er) => console.log(er));
			});
		});

	} catch (e) {
		res.send({ error: 'Error getting subject', subject: [], success: 'Failed' });
	}
};
module.exports.getSubjectByDeptId = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('SELECT * FROM getsubjects s INNER JOIN program p ON p.id=s.`Sem_id` WHERE p.`dept_id`=?', [ req.params.id ], function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ result: rows });
				connection.release((er) => console.log(er));
			});
		});

	} catch (e) {
		res.send({ error: 'Error getting subject', subject: [], success: 'Failed' });
	}
};



module.exports.getSubjectBySemId = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('SELECT * FROM GetSubjects WHERE sem_id= ?', [ req.params.id ], function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ result: rows });
				connection.release((er) => console.log(er));
			});
		});

	} catch (e) {
		res.send({ error: 'Error getting subject', subject: [], success: 'Failed' });
	}
};

module.exports.insertSubject = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(`INSERT INTO subject  SET ?  `,  [{name: req.body.name ,sem_id: req.body.sem_id }], function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ error: null, message: 'Insert successfully', result: rows });
				connection.release((er) => console.log(er));
			});
		});
	} catch (e) {
		res.send({ error: 'Error getting subject', subject: [], success: 'Failed' });
	}
};

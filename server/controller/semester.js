var { connection } = require('../db');
module.exports.getSemester = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			console.log('MySQL Connection Established: ', connection.threadId);
			connection.query('SELECT * FROM GetSemesters', function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ error:"",success: 'success', result: rows });
				connection.release((err) => console.log(err));
			});
		});
	} catch (e) {
		res.send({ error: 'Error getting semester', semester: [], success: 'Failed' });
	}
};
module.exports.getSemesterById = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('SELECT * FROM GetSemesters WHERE sem_id= ?', [ req.params.id ], function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ result: rows });
				connection.release((er) => console.log(er));
			});
		});

	} catch (e) {
		res.send({ error: 'Error getting semester', semester: [], success: 'Failed' });
	}
};

module.exports.getSemesterByStdId = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query("SELECT sm.id 'id', sm.name,p.id 'prog_id' FROM semester sm INNER JOIN program p ON p.id=sm.prog_id INNER JOIN student STD ON std.prog_id=p.id WHERE sm.id NOT IN( SELECT sem_id FROM examform WHERE STATUS IN (0,1,3) AND  std_id=?) AND  std.id=?", [ req.params.id,req.params.id], function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ result: rows });
				connection.release((er) => console.log(er));
			});
		});

	} catch (e) {
		res.send({ error: 'Error getting semester', semester: [], success: 'Failed' });
	}
};



module.exports.getSemesterByProgId = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('SELECT * FROM GetSemesters WHERE prog_id= ?', [ req.params.id ], function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ result: rows });
				connection.release((er) => console.log(er));
			});
		});

	} catch (e) {
		res.send({ error: 'Error getting semester', semester: [], success: 'Failed' });
	}
};


module.exports.insertSemester = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(`INSERT INTO semester  SET ?  `,  [{name: req.body.name ,prog_id: req.body.prog_id }], function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ error: null, message: 'Insert successfully', result: rows });
				connection.release((er) => console.log(er));
			});
		});
	} catch (e) {
		res.send({ error: 'Error getting semester', semester: [], success: 'Failed' });
	}
};

module.exports.insertEightSemester = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(`CALL Sp_inserteightsemesters(?) `,  req.body.prog_id , function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ error: null, message: 'Insert successfully', result: rows });
				connection.release((er) => console.log(er));
			});
		});
	} catch (e) {
		res.send({ error: 'Error getting semester', semester: [], success: 'Failed' });
	}
};

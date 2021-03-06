var { connection } = require('../db');
module.exports.getRecheck = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			console.log('MySQL Connection Established: ', connection.threadId);
			connection.query('SELECT * FROM GetRecheck', function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ error:"",success: 'success', result: rows });
				connection.release((err) => console.log(err));
			});
		});
	} catch (e) {
		res.send({ error: 'Error getting Recheck', department: [], success: 'Failed' });
	}
};
module.exports.getRecheckByDeptId = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('SELECT * FROM GetRecheck where dept_id = ?', [ req.params.id ], function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ result: rows });
				connection.release((er) => console.log(er));
			});
		});
	} catch (e) {
		res.send({ error: 'Error getting recheck', department: [], success: 'Failed' });
	}
};

module.exports.insertRecheck = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(`INSERT INTO recheck SET ?`,[{std_id: req.body.std_id ,
				ml_id: req.body.ml_id,remarks: req.body.remarks,status: req.body.status,
				p_mid:req.body.p_mid,p_sessional:req.body.p_sessional,p_final:req.body.p_final,
				p_total:req.body.p_total }], function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ error: null, message: 'Insert successfully', result: rows });
				connection.release((er) => console.log(er));
			});
		});
	} catch (e) {
		res.send({ error: 'Error getting Recheck', department: [], success: 'Failed' });
	}
};


module.exports.UpdateMarks = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(
				`UPDATE recheck SET n_sessional=?,n_mid=?,n_final=?,n_total=? WHERE id = ?`,
				[ parseInt(req.body.sessional), parseInt(req.body.mid), parseInt(req.body.final), parseInt(	parseInt(req.body.mid) +
					parseInt(req.body.sessional) +
					parseInt(req.body.final)), parseInt(req.params.id) ],
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

module.exports.UpdateStatus = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(
				`UPDATE recheck SET status = ? , remarks=? WHERE  id = ?`,
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
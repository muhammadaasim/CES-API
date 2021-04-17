var { connection } = require('../db');
module.exports.getTeacherAssign = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			console.log('MySQL Connection Established: ', connection.threadId);
			connection.query('SELECT * FROM getassignedteachers', function (err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ error: '', success: 'success', result: rows });
				connection.release((err) => console.log(err));
			});
		});
	} catch (e) {
		res.send({
			error: 'Error getting subject',
			subject: [],
			success: 'Failed'
		});
	}
};
module.exports.getTeacherAssignByID = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('SELECT * FROM getassignedteachers WHERE teacher_id= ?', [req.params.id], function (
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
			error: 'Error getting subject',
			subject: [],
			success: 'Failed'
		});
	}
};

module.exports.getTeacherAssignByHodID = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('SELECT * FROM getassignedteachers WHERE incharge_id= ?', [req.params.id], function (
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
			error: 'Error getting teacher assign data',
			subject: [],
			success: 'Failed'
		});
	}
};

module.exports.getTeacherAssignBySemID = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('SELECT * FROM getassignedteachers WHERE sem_id= ?', [req.params.id], function (
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
			error: 'Error in getting teacher assign data',
			subject: [],
			success: 'Failed'
		});
	}
};

module.exports.getTeacherAssignBySession = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('SELECT * FROM getassignedteachers WHERE session = ?', [req.params.session], function (
				err,
				rows,
				fields
			) {
				if (err) throw err;
				res.send({ result: rows });
				connection.release((er) => console.log(er));
			});
		});
	} catch (e) {
		res.send({
			error: 'Error in getting teacher  data',
			subject: [],
			success: 'Failed'
		});
	}
};


module.exports.teacherassignedsubjectformByTid = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			console.log('MySQL Connection Established: ', connection.threadId);
			connection.query('SELECT * FROM teacherassignedsubjectform WHERE teacher_id=?', [req.params.id], function (err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ error: '', success: 'success', result: rows });
				connection.release((err) => console.log(err));
			});
		});
	} catch (e) {
		res.send({
			error: 'Error getting data',
			subject: [],
			success: 'Failed'
		});
	}
};
module.exports.teacherassignedsubjectform = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			console.log('MySQL Connection Established: ', connection.threadId);
			connection.query('SELECT * FROM teacherassignedsubjectform', function (err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ error: '', success: 'success', result: rows });
				connection.release((err) => console.log(err));
			});
		});
	} catch (e) {
		res.send({
			error: 'Error getting data',
			subject: [],
			success: 'Failed'
		});
	}
};


module.exports.AssignSubject = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(
				`INSERT INTO f_subject_teacher_assign  SET ?  `,
				[
					{
						sub_id: req.body.subid,
						t_id: req.body.tid,
						session: new Date().getFullYear(),
						incharge_id: req.body.hodid,
						date: new Date().getTime(),
						// isdisabled:req.body.isdisabled
					}
				],
				function (err, rows, fields) {
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
	} catch (e) {
		res.send({
			error: 'Error WHile Inserting Teacher assign data',
			subject: [],
			success: 'Failed'
		});
	}
};

module.exports.deassign = (req, res) => {
	console.log(req.body)	
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(`DELETE FROM f_subject_teacher_assign WHERE id = ?`,[req.body.id] , function(
				err,
				rows,
				fields
			) {
				if (err) throw err;
				console.log(rows);
				res.send({
					error: null,
					message: 'Delete successfully',
					result: rows
				});
				connection.release((er) => console.log(er));
			});
		});
	} catch (e) {
		res.send({
			error: 'Error getting updating data',
			result: [],
			success: 'Failed'
		});
	}
};
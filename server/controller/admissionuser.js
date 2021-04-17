var { connection } = require('../db');
module.exports.getadmission = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			console.log('MySQL Connection Established: ', connection.threadId);
			connection.query('SELECT * FROM admissionuser', function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ error: '', success: 'success', result: rows });
				connection.release((err) => console.log(err));
			});
		});
	} catch (e) {
		res.send({
			error: 'Error getting admission',
			result: [],
			success: 'Failed'
		});
	}
};
module.exports.getadmissionById = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('SELECT * FROM admissionuser WHERE id = ?', [ req.params.id ], function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ result: rows });
				connection.release((er) => console.log(er));
			});
		});
	} catch (e) {
		res.send({
			error: 'Error getting admission',
			result: [],
			success: 'Failed'
		});
	}
};


module.exports.insertadmission = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(`SELECT * FROM admissionuser WHERE cnic = ? `, [ req.body.cnic ], function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				if (rows.length > 0) {
					res.send({ error: 'CNIC Already exists' });
				} else {
					connection.query(
						`insert into admissionuser  SET ?  `,
						[
							{
								fullname: req.body.fullname,
								caste: req.body.caste,
								username: req.body.username,
								password: req.body.password,
								cnic: req.body.cnic,
								date:new Date().getTime()
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
			error: 'Error getting admission',
			result: [],
			success: 'Failed'
		}); 
	}
};

module.exports.loginadmission = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(
				`SELECT id FROM admissionuser WHERE username = ? AND password = ? AND isdisabled=0`,
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
module.exports.status = (req, res) => {
    try {
      connection.getConnection((err, connection) => {
        if (err) throw err;
        connection.query(
          `UPDATE admissionuser SET isdisabled=? WHERE id=?`,
          [ req.body.isdisabled,
            req.body.id,
          ],
          function (err, rows, fields) {
            if (err) throw err;
            console.log(rows);
            res.send({
              error: null,
              message: "status changes Successful",
              result: rows,
            });
            connection.release((er) => console.log(er));
          }
        );
      });
    } catch (e) {
      res.send({
        error: "Error getting student",
        result: [],
        success: "Failed",
      });
    }
  };
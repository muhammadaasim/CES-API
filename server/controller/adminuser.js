var { connection } = require('../db');
module.exports.getadmin = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			console.log('MySQL Connection Established: ', connection.threadId);
			connection.query('SELECT * FROM adminuser', function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ error: '', success: 'success', result: rows });
				connection.release((err) => console.log(err));
			});
		});
	} catch (e) {
		res.send({
			error: 'Error getting admin',
			result: [],
			success: 'Failed'
		});
	}
};
module.exports.getadminById = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query('SELECT * FROM adminuser WHERE id = ?', [ req.params.id ], function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				res.send({ result: rows });
				connection.release((er) => console.log(er));
			});
		});
	} catch (e) {
		res.send({
			error: 'Error getting admin',
			result: [],
			success: 'Failed'
		});
	}
};


module.exports.insertadmin = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(`SELECT * FROM adminuser WHERE cnic = ? `, [ req.body.cnic ], function(err, rows, fields) {
				if (err) throw err;
				console.log(rows);
				if (rows.length > 0) {
					res.send({ error: 'CNIC Already exists' });
				} else {
					connection.query(
						`insert into adminuser  SET ?  `,
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
			error: 'Error getting admin',
			result: [],
			success: 'Failed'
		}); 
	}
};

module.exports.loginadmin = (req, res) => {
	try {
		connection.getConnection((err, connection) => {
			if (err) throw err;
			connection.query(
				`SELECT id FROM adminuser WHERE username = ? AND password = ? AND isdisabled=0`,
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
			error: 'Error getting admin login details',
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
          `UPDATE adminuser SET isdisabled=? WHERE id=?`,
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
        error: "Error getting admin user",
        result: [],
        success: "Failed",
      });
    }
  };
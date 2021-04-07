var { connection } = require("../db");
module.exports.getIncharge = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      console.log("MySQL Connection Established: ", connection.threadId);
      connection.query(
        "SELECT * FROM getincharge",
        function (err, rows, fields) {
          if (err) throw err;
          console.log(rows);
          res.send({ error: "", success: "success", result: rows });
          connection.release((err) => console.log(err));
        }
      );
    });
  } catch (e) {
    res.send({
      error: "Error getting Incharge",
      result: [],
      success: "Failed",
    });
  }
};
module.exports.getInchargeById = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      connection.query(
        "SELECT * FROM GetIncharge WHERE incharge_id= ?",
        [req.params.id],
        function (err, rows, fields) {
          if (err) throw err;
          console.log(rows);
          res.send({ result: rows });
          connection.release((er) => console.log(er));
        }
      );
    });
  } catch (e) {
    res.send({
      error: "Error getting Incharge",
      result: [],
      success: "Failed",
    });
  }
};

module.exports.getInchargeByDept = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      connection.query(
        "SELECT * FROM GetIncharge WHERE dept_id= ?",
        [req.params.id],
        function (err, rows, fields) {
          if (err) throw err;
          console.log(rows);
          res.send({ result: rows });
          connection.release((er) => console.log(er));
        }
      );
    });
  } catch (e) {
    res.send({
      error: "Error getting Incharge",
      result: [],
      success: "Failed",
    });
  }
};

module.exports.insertIncharge = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      connection.query(
        `insert into Incharge  SET ?  `,
        [
          {
            fullname: req.body.fullname,
            caste: req.body.caste,
            dept_id: req.body.dept_id,
            username: req.body.username,
            password: req.body.password,
          },
        ],
        function (err, rows, fields) {
          if (err) throw err;
          console.log(rows);
          res.send({
            error: null,
            message: "Insert successfully",
            result: rows,
          });
          connection.release((er) => console.log(er));
        }
      );
    });
  } catch (e) {
    res.send({
      error: "Error getting Incharge",
      result: [],
      success: "Failed",
    });
  }
};

module.exports.loginIncharge = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      connection.query(
        `SELECT id FROM deptincharge WHERE username = ? AND password = ?`,
        [req.body.username, req.body.password],
        function (err, rows, fields) {
          if (err) throw err;
          console.log(rows);
          res.send({
            error: null,
            result: rows,
          });
          connection.release((er) => console.log(er));
        }
      );
    });
  } catch (e) {
    res.send({
      error: "Error getting student login details",
      result: [],
      success: "Failed",
    });
  }
};

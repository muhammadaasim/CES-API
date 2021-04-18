var { connection } = require("../db");
module.exports.GetExamController = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      console.log("MySQL Connection Established: ", connection.threadId);
      connection.query(
        "SELECT * FROM examcontroller",
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
      error: "Error getting Data",
      result: [],
      success: "Failed",
    });
  }
};
module.exports.getControllerById = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      connection.query(
        "SELECT * FROM examcontroller WHERE id = ?",
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
      error: "Error getting Data",
      result: [],
      success: "Failed",
    });
  }
};

module.exports.insertController = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      connection.query(
        `insert into examcontroller  SET ?  `,
        [
          {
            fullname: req.body.fullname,
            caste: req.body.caste,
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
      error: "Error getting Controller",
      result: [],
      success: "Failed",
    });
  }
};

module.exports.loginController = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      connection.query(
        `SELECT id FROM examcontroller WHERE username = ? AND password = ?`,
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

var { connection } = require("../db");
module.exports.getStudent = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      console.log("MySQL Connection Established: ", connection.threadId);
      connection.query("SELECT * FROM student", function (err, rows, fields) {
        if (err) throw err;
        console.log(rows);
        res.send({ error: "", success: "success", result: rows });
        connection.release((err) => console.log(err));
      });
    });
  } catch (e) {
    res.send({
      error: "Error getting student",
      student: [],
      success: "Failed",
    });
  }
};
module.exports.getStudentById = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      connection.query(
        "SELECT * FROM student WHERE id= ?",
        [req.params.id],
        function (err, rows, fields) {
          if (err) throw err;
          console.log(rows);
          res.send({ data: rows });
          connection.release((er) => console.log(er));
        }
      );
    });
  } catch (e) {
    res.send({
      error: "Error getting student",
      student: [],
      success: "Failed",
    });
  }
};

module.exports.insertStudent = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      connection.query(
        `INSERT INTO student SET ?`,
        { fullname: req.body.name },
        { rollno: req.body.rollno },
        { prog_id: req.body.prog_id },
        { caste: req.body.caste },
        { dateofbirth: req.body.dateofbirth },
        { religion: req.body.religion },
        { nationality: req.body.nationality },
        { gender: req.body.gender },
        { username: req.body.username },
		{ password: req.body.password },
        function (err, rows, fields) {
          if (err) throw err;
          console.log(rows);
          res.send({ error: null, message: "Insert successfully", data: rows });
          connection.release((er) => console.log(er));
        }
      );
    });
  } catch (e) {
    res.send({
      error: "Error getting student",
      student: [],
      success: "Failed",
    });
  }
};

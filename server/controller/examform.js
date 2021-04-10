var { connection } = require("../db");
module.exports.getExamforms = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      console.log("MySQL Connection Established: ", connection.threadId);
      connection.query(
        "SELECT * FROM examform ",
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
      error: "Error getting examform",
      result: [],
      success: "Failed",
    });
  }
};
module.exports.getExamFormByStdId = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      connection.query(
        "SELECT ef.id, ef.std_id, ef.session,ef.type,ef.status,ef.remarks,ef.date,sm.id 'sem_id',sm.name 'semester' FROM examform ef INNER JOIN semester sm ON sm.id=ef.sem_id WHERE std_id=?",
        [req.params.id],
        function (err, rows, fields) {
          if (err) {
            console.log(err);
          }
          console.log(rows);
          res.send({ result: rows });
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
module.exports.getExamFormByDeptId = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      connection.query(
        "SELECT * FROM getexamformdata WHERE dept_id=?",
        [req.params.id],
        function (err, rows, fields) {
          if (err) {
            console.log(err);
          }
          console.log(rows);
          res.send({ result: rows });
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

module.exports.insertExamForm = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      connection.query(
        `INSERT INTO examform SET ?`,
        [
          {
            std_id: req.body.std_id,
            session: new Date().getFullYear(),
            sem_id: req.body.sem_id,
            type: req.body.type,
            status: 0,
            remarks: "",
            date: new Date().getTime(),
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
      error: "Error getting student",
      result: [],
      success: "Failed",
    });
  }
};

module.exports.insertSubjects = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      connection.query(
        `insert into f_form_subject values( ?,?)`,
        [req.body.fid, req.body.subid],
        function (err, rows, fields) {
          if (err) throw err;
          console.log(rows);
          res.send({
            error: null,
            message: "Insert successfully",
            result: req.body.fid,
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

module.exports.UpdateStatus = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      connection.query(
        // `update config  SET isenabled = ?  WHERE id = ? `,[req.body.isenabled,req.params.id],
        `UPDATE examform SET status = ? WHERE  id = ?`,
        [req.body.status, req.params.formid],
        function (err, rows, fields) {
          if (err) throw err;
          console.log(rows);
          res.send({
            error: null,
            message: "Update successfully",
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


// };

module.exports.getExamformswithsubj = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      console.log("MySQL Connection Established: ", connection.threadId);
      connection.query(
        "SELECT * FROM getexamforms ",
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
      error: "Error getting examform",
      result: [],
      success: "Failed",
    });
  }
};
module.exports.getExamFormwithsubByStdId = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      connection.query(
        "SELECT * FROM getexamforms WHERE student_id=?",
        [req.params.id],
        function (err, rows, fields) {
          if (err) {
            console.log(err);
          }
          console.log(rows);
          res.send({ result: rows });
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

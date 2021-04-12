var { connection } = require("../db");
module.exports.getExamforms = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      console.log("MySQL Connection Established: ", connection.threadId);
      connection.query("SELECT * FROM examform ", function (err, rows, fields) {
        if (err) throw err;
        console.log(rows);
        res.send({ error: "", success: "success", result: rows });
        connection.release((err) => console.log(err));
      });
    });
  } catch (e) {
    res.send({
      error: "Error getting examform",
      result: [],
      success: "Failed",
    });
  }
};
module.exports.getStudentById = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      connection.query(
        "SELECT * FROM GetStudent WHERE student_id= ?",
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

// module.exports.updateStudent = (req, res) => {
//   try {
//     connection.getConnection((err, connection) => {
//       if (err) throw err;
//       connection.query(
//         `UPDATE student SET ?  WHERE id=?`,
//         [
//           {
//             rollno: req.body.rollno,
//             fullname: req.body.fullname,
//             prog_id: req.body.prog_id,
//             caste: req.body.caste,
//             dateofbirth: req.body.dateofbirth,
//             religion: req.body.religion,
//             gender: req.body.gender,
//             nationality: req.body.nationality,
//             username: req.body.username,
//             password: req.body.password,
//           },
//           req.params.id,
//         ],
//         function (err, rows, fields) {
//           if (err) throw err;
//           console.log(rows);
//           res.send({
//             error: null,
//             message: "Updated Successful",
//             result: rows,
//           });
//           connection.release((er) => console.log(er));
//         }
//       );
//     });
//   } catch (e) {
//     res.send({
//       error: "Error getting student",
//       result: [],
//       success: "Failed",
//     });
//   }
// };

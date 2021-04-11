var { connection } = require("../db");
module.exports.getExamforms = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      console.log("MySQL Connection Established: ", connection.threadId);
      connection.query(
        "SELECT * FROM getexamformdata",
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
module.exports.GetSlip = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      console.log("MySQL Connection Established: ", connection.threadId);
      connection.query(
        "SELECT std.rollno,(CASE WHEN (`std`.`gender` = 1) THEN 'Mr.' ELSE 'Miss.' END) AS `gender`, std.fullname,
        d.name 'dept',p.name 'program',ef.session'session',(CASE WHEN (`ef`.`type` = 0) THEN 'Fresh' ELSE 'Improver' END) AS `form_type`,
        sm.name 'Semester',sub.name 'subjects',(CASE WHEN (`sub`.`type` = 0) THEN 'Theory' ELSE 'Practical' END) AS `sub_type`
        
        FROM examform ef INNER JOIN `f_form_subject` fsub ON fsub.f_id=ef.id
       INNER JOIN SUBJECT sub ON sub.id=fsub.sub_id INNER JOIN semester sm ON sm.id=ef.sem_id 
       INNER JOIN student STD ON std.id=ef.std_id
       INNER JOIN program p ON p.id=std.prog_id INNER JOIN dept d ON d.id=p.dept_id
       AND SESSION="2021" AND ef.sem_id=4 AND ef.status=3 AND ef.type=0 ",
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

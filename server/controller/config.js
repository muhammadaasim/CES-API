var { connection } = require("../db");
module.exports.getConfig = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      console.log("MySQL Connection Established: ", connection.threadId);
      connection.query("select * from getconfig ", function (err, rows, fields) {
        if (err) throw err;
        console.log(rows);
        res.send({ error: "", success: "success", result: rows });
        connection.release((err) => console.log(err));
      });
    });
  } catch (e) {
    res.send({
      error: "Error getting Config",
      Config: [],
      success: "Failed",
    });
  }
};

module.exports.updateConfig = (req, res) => {
  try {
    connection.getConnection((err, connection) => {
      if (err) throw err;
      connection.query(
        `update config  SET startdate = ?,enddate=? WHERE id = ? `,[req.body.startdate,req.body.enddate,req.params.id],
        function (err, rows, fields) {
          if (err) throw err;
          console.log(rows);
          res.send({ error: null, message: "Insert successfully", result: rows });
          connection.release((er) => console.log(er));
        }
      );
    });
  } catch (e) {
    res.send({
      error: "Error getting Config",
      Config: [],
      success: "Failed",
    });
  }
};

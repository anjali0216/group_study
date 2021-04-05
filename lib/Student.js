const express = require("express");
var router = express.Router();

//var crypto = require("crypto");
//var nodemailer = require("nodemailer");

var Student = require("./StudentSchema");
var mongoose = require("mongoose");

/*var options = {
  service: "gmail",
  auth: {
    user: "<username>",
    pass: "<password>",
  },
};*/

var url = `mongodb://localhost:27017/`;

router.route("/signup").post((req, res) => {
//console.log("name");
  Student.findOne({ email: req.body.email }, function (err, user) {
    if (err) {
    }
    if (user) {

      return res.status(400).send({
        msg: "The email address is already associated with other account ",
      });
    }
  Student.findOne({ username: req.body.username }, function (err, user) {
    if (err) {
    }
    if (user) {

      return res.status(401).send({
        msg: "The username is already associated with other account ",
      });
    }
    Student.create(
      {
        email: req.body.email,
        username: req.body.username,
        password: req.body.password,
       // token: crypto.randomBytes(16).toString("hex"),
        name: req.body.name,
        course: req.body.course
      },
      (err, result) => {
        if (err) {
          console.log(err);
          return err;
        }
        res.json(result);
      }
    );
  });
  });
});

router.route("/signin").post((req, res) => {
  Student.findOne({ username: req.body.username }, (err, result) => {
    if (err) return res.status(500).json({ msg: err });
    if (result === null) {
      return res.status(403).json({msg: "Incorrect username"});
    }
    if (result.password === req.body.password) {
      res.status(200).json({
        result,
        msg: "success"
      } );
    } else {
      res.status(402).json({msg: "password is incorrect"});
    }
  });
});

module.exports = router;

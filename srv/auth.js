const cds = require("@sap/cds");
const session = require('express-session')
const passport = require('passport')
const LocalStrategy = require('passport-local').Strategy

module.exports = (req, res, next) => {
  console.log(req.user);
  if (req?.user) {
    req.user = new cds.User({
      id: req.user.name,
      _roles: { any: 1, 'identified-user': 1, 'authenticated-user': 1 },
      attr:{
        read: 1
      }
    })
    next()
  } else {
    req.user = new cds.User({
      id: 'unauthorized',
      _roles: { any: 1, 'authenticated-user': 1 },
      attr:{
        read: 0
      }
    })
    next()
  }
}
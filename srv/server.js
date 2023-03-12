"use strict";

const cds = require("@sap/cds");
const cds_swagger = require ('cds-swagger-ui-express');
const proxy = require("@sap/cds-odata-v2-adapter-proxy");

const session = require('express-session')
const passport = require('passport')
const express = require('express')
const LocalStrategy = require('passport-local').Strategy

require('./auth/passport')

cds.on("bootstrap", async (app) => {
    app.use(cds_swagger());
    app.use(proxy());
    app.use(express.urlencoded({extended: false}))

    app.use(session({
        secret: "secret",
        resave: false ,
        saveUninitialized: true ,
    }))

    app.use(passport.initialize());
    app.use(passport.session());

    app.get("/login", (req, res) => {
        res.render("login.ejs")    
    })
    
    app.post ("/login", passport.authenticate('local', {
        successRedirect: "/launchpage.html#Shell-home",
        failureRedirect: "/login",
    }));
});

module.exports = cds.server;
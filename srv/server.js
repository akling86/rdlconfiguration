"use strict";

const cds = require("@sap/cds");
const cds_swagger = require ('cds-swagger-ui-express');
const proxy = require("@sap/cds-odata-v2-adapter-proxy");

cds.on("bootstrap", app => app.use(cds_swagger(),proxy()));

module.exports = cds.server;
"use strict";

const cds = require("@sap/cds");

module.exports = (srv) => {
    srv.before('CREATE', 'Class', async (req) => {
        const {
            ID,
            type_code,
            parent_class_ID
        } = req.data;
        if(type_code === 'Core Class'){
            req.data.core_class_ID = ID;
        }
        else {
            await SELECT.one('Class')
                .columns(
                    'core_class_ID'
                )
                .where({
                    ID: parent_class_ID
                })
                .then(
                    response => {
                        req.data.core_class_ID = response.core_class_ID;
                    }
                )
                .catch(error => {
                    return req.error(error.message);
                });
            
        }
    });

    srv.after('READ', 'Class', async (classes) => {
        if(Array.isArray(classes)) {
            for(let cl of classes){
                await cds.run(`SELECT level,drilldown FROM "ClassHierarchy" where id = ?`,[cl.ID])
                    .then(
                        response => {
                            cl.level = response[0].level;
                            cl.drilldown = response[0].drilldown
                        }
                    );
            }
        }
    });
}
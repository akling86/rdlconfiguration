using rdl from '../db/rdl-data-model';

using sap from '@sap/cds/common';

@path: 'rdlconfig/classmanager'
service ClassManagerService @(impl:'./class-manager.js'){
    @readonly
    entity ClassType as projection on rdl.ClassType;
    @readonly
    entity ModelType as projection on rdl.ModelType;
    @readonly
    entity CoreClasses as projection on rdl.CoreClasses;
    @readonly
    entity ParentClasses as projection on rdl.ParentClasses;


    entity Class @(restrict: [ 
    { grant: ['READ','WRITE'], to: 'authenticated-user' , where: '$user.read = 1' }])
    as SELECT from rdl.Class{
        @sap.insertable : 'false'
		@sap.updatable : 'false'
        @sap.hierarchy.node.for: 'ID'
        key ID,
        @sap.insertable : 'true'
		@sap.updatable : 'false'
        class_id,
        @sap.insertable : 'true'
		@sap.updatable : 'false'
        class,
        @sap.insertable : 'true'
		@sap.updatable : 'true'
        definition,
        @sap.insertable : 'true'
		@sap.updatable : 'false'
        type,

        @sap.insertable : 'false'
		@sap.updatable : 'false'
        core_class : redirected to CoreClasses,
        @sap.insertable : 'true'
		@sap.updatable : 'true'
        @sap.hierarchy.parent.node.for: 'ID'
        parent_class : redirected to ParentClasses,
        @sap.insertable : 'true'
		@sap.updatable : 'false'
        model_type,
        @sap.insertable : 'true'
		@sap.updatable : 'true'
        is_domain,
        @sap.insertable : 'false'
		@sap.updatable : 'false'
        @sap.hierarchy.level.for: 'ID'
        level,
        @sap.insertable : 'false'
		@sap.updatable : 'false'
        @sap.hierarchy.drill.state.for: 'ID'
        drilldown
    };
    annotate Class with @odata.draft.enabled;
    
}
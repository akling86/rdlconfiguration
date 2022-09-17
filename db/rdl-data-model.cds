using { cuid } from '@sap/cds/common';
namespace rdl;

entity ClassType {
    key code : String(16);
}

entity ModelType {
    key code : String(16);
}

entity Class : cuid{
    class_id : String(32) @title : 'Class LE UID';
    class : String(128) @title : 'Class Name';
    definition : String(5000) @title : 'Definition';
    type : Association to ClassType @title : 'Class Type';

    core_class : Association to  one Class @title : 'Core Class';
    parent_class : Association to one Class @title : 'Parent Class';
    model_type : Association to ModelType @title : 'Model Type';
    is_domain : Boolean @title : 'Is Domain';

    level : Integer;
    virtual drilldown : String(16);
}

entity CoreClasses as SELECT from Class{
    key ID,
    class_id,
    class
}where type.code = 'Core Class';

entity ParentClasses as SELECT from Class{
    key ID,
    class_id,
    class,
    type.code as class_type,
    core_class.class as core_class
};


namespace rdl;

using {rdl} from '../db/rdl-data-model';

entity ClassOverview as SELECT from rdl.Class {
    @Analytics.Dimension : true
    @UI.Hidden: true
    ID,
    @Analytics.Dimension : true
    @title : 'Class Type'
    type.code as class_type,
    @Analytics.Dimension : true
    @title : 'Core Class'
    core_class.class as core_class,
    @Analytics.Dimension : true
    @title : 'Model Type'
    model_type.code as model_type,
    @Analytics.Measure : true
    @Aggregation.default : #SUM
    @title : 'Total'
    1 as cc : Integer
};

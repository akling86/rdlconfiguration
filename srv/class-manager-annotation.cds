using ClassManagerService from './class-manager';

annotate ClassManagerService.Class with @(
    UI: {
        HeaderInfo: {
            TypeName: 'Class',
            TypeNamePlural: 'Classes',
            Title          : {
                $Type : 'UI.DataField',
                Value : class_id
            },
            Description : {
                $Type: 'UI.DataField',
                Value: class
            }
        },
        LineItem: [
            {Value: class_id},
            {Value: class},
            {Value: definition},
            {Value: type_code},
            {Value: model_type_code}
        ],
        Facets: [
            {$Type: 'UI.ReferenceFacet', Label: 'Main', Target: '@UI.FieldGroup#Main'}
        ],
        FieldGroup#Main: {
            Data: [
                {Value: definition},
                {Value: type_code},
                {Value: model_type_code},
                {Value: parent_class_ID},
                {Value: core_class_ID}
            ]
        }
    },
) {
    core_class @(Common : { 
        Text : core_class.class,
        TextArrangement : #TextOnly,
        FieldControl : #ReadOnly,
        ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'CoreClasses',
            Parameters : [{
                $Type : 'Common.ValueListParameterOut', 
                ValueListProperty : 'ID', 
                LocalDataProperty : core_class_ID
            }]
        },
     });
     parent_class @(Common : { 
        Text : parent_class.class,
        TextArrangement : #TextOnly
     });
    type @(Common : 
        { ValueList : { 
            CollectionPath : 'ClassType', 
            Parameters : [ { 
                $Type : 'Common.ValueListParameterOut', 
                ValueListProperty : 'code', 
                LocalDataProperty : type_code }] 
            },
           ValueListWithFixedValues: true
        });
    model_type @(Common : 
        { ValueList : { 
            CollectionPath : 'ModelType', 
            Parameters : [ { 
                $Type : 'Common.ValueListParameterOut', 
                ValueListProperty : 'code', 
                LocalDataProperty : model_type_code }] 
            },
            ValueListWithFixedValues: true
        });
};
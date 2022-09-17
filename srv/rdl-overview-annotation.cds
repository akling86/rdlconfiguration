using RDLOverviewService from './rdl-overview';

annotate RDLOverviewService.Classes @(
  UI.Chart #ClassByType : {
    $Type : 'UI.ChartDefinitionType',
    Title : 'Classes By Class Type',
    ChartType: #Donut,
    MeasureAttributes : [
        {
            $Type : 'UI.ChartMeasureAttributeType',
            Measure : cc,
            Role : #Axis1
        },
    ],
    DimensionAttributes : [
        {
            $Type : 'UI.ChartDimensionAttributeType',
            Dimension : class_type,
            Role : #Series
        }
    ]
  },

  UI.Chart #ClassByCoreClass : {
    $Type : 'UI.ChartDefinitionType',
    Title : 'Classes by Core Class',
    ChartType: #Donut,
    MeasureAttributes : [
        {
            $Type : 'UI.ChartMeasureAttributeType',
            Measure : cc,
            Role : #Axis1
        },
    ],
    DimensionAttributes : [
        {
            $Type : 'UI.ChartDimensionAttributeType',
            Dimension : core_class,
            Role : #Series
        }
    ]
  },

  UI.Chart #ClassByModelType : {
    $Type : 'UI.ChartDefinitionType',
    Title : 'Classes By Model Type',
    ChartType: #Donut,
    MeasureAttributes : [
        {
            $Type : 'UI.ChartMeasureAttributeType',
            Measure : cc,
            Role : #Axis1
        },
    ],
    DimensionAttributes : [
        {
            $Type : 'UI.ChartDimensionAttributeType',
            Dimension : model_type,
            Role : #Series
        }
    ]
  },

  UI.DataPoint #Classes : {
    $Type : 'UI.DataPointType',
    Value: cc,
    Title: 'Total Classes'
  },

  UI.Identification #Classes : [
    {
        $Type : 'UI.DataFieldForIntentBasedNavigation',
        SemanticObject : 'classmanager',
        Action : 'app'
    }
  ]
);
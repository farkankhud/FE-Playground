using DependentValueHelpService as service from '../../srv/dependent-value-help';
annotate service.Employees with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'employeeNo',
                Value : employeeNo,
            },
            {
                $Type : 'UI.DataField',
                Label : 'firstName',
                Value : firstName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'lastName',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'email',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'salary',
                Value : salary,
            },
            {
                $Type : 'UI.DataField',
                Label : 'company_ID',
                Value : company_ID,
            },
             {
                $Type : 'UI.DataField',
                Label : 'Department',
                Value : department_ID,
            },
             {
                $Type : 'UI.DataField',
                Label : 'Role',
                Value : role_ID,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'employeeNo',
            Value : employeeNo,
        },
        {
            $Type : 'UI.DataField',
            Label : 'firstName',
            Value : firstName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'lastName',
            Value : lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'email',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Label : 'salary',
            Value : salary,
        },
    ],
);

// annotate service.Employees with {
//     company @Common.ValueList : {
//         $Type : 'Common.ValueListType',
//         CollectionPath : 'Companies',
//         Parameters : [
//             {
//                 $Type : 'Common.ValueListParameterInOut',
//                 LocalDataProperty : 'company_ID', // Added quotes
//                 ValueListProperty : 'ID',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'company',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'name',
//             },
//         ],
//     }
// };

// annotate service.Employees with {
//     department @Common.ValueList : {
//         $Type : 'Common.ValueListType',
//         CollectionPath : 'Departments',
//         Parameters : [
//             {
//                 $Type : 'Common.ValueListParameterInOut',
//                 LocalDataProperty : 'department_ID', // Added quotes
//                 ValueListProperty : 'ID',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'name',
//             },
//             {
//                 $Type : 'Common.ValueListParameterIn',
//                 // LocalDataProperty : 'company_ID',    // Local property on Employees view
//                 // ValueListProperty : 'company_ID',   // Generated property name on Departments view
//                 LocalDataProperty : 'company/ID', // Tells Fiori to look at the ID property via the company path
//                 ValueListProperty : 'company_ID', // Matches the target metadata property you shared earlier
//             },
//         ],
//     }
// };

annotate service.Employees with {
    company @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Companies',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : company_ID, // Quoted structural field name
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            // {
            //     $Type : 'Common.ValueListParameterDisplayOnly',
            //     ValueListProperty : 'name',
            // },
        ],
    }
};

annotate service.Employees with {
    department @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Departments',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : department_ID, // Quoted structural field name
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            // {
            //     // This parameter enforces the dynamic filtering logic
            //     $Type : 'Common.ValueListParameterIn',
            //     LocalDataProperty : company_ID,   // Relative row-level reference for Fiori UI
            //     ValueListProperty : 'company_ID',   // Matches the property on Departments entity
            // },
        ],
    }
};



annotate service.Employees with {
    role @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Roles',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : role_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'roleName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'description',
            },
        ],
    }
};
annotate service.Employees with @Common.SideEffects : {
    $Type : 'Common.SideEffectsType',
    SourceProperties : [ 'company_ID' ],
    TargetProperties : [ 'department_ID' ]
};



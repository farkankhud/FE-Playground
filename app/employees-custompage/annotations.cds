using custompageService as service from '../../srv/custompage-service';

// ---------------------------------------------------------------------
// Value help / dependent filtering (same pattern validated earlier —
// adjusted here because Companies no longer has a `company` field,
// only ID and name)
// ---------------------------------------------------------------------

annotate service.Employees with {
    company @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Companies',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : company_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
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
                LocalDataProperty : department_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                // Dependent filtering: only shows departments matching
                // the currently selected company on this row.
                $Type : 'Common.ValueListParameterIn',
                LocalDataProperty : company_ID,
                ValueListProperty : 'company_ID',
            },
        ],
    }
};

// ---------------------------------------------------------------------
// Text annotations — without these, Company/Department/Role show the
// raw key (GUID / code) instead of the friendly name. This is separate
// from the value-help annotations above: ValueListParameterDisplayOnly
// only controls what appears inside the F4 dialog, not what's shown on
// the page itself.
// ---------------------------------------------------------------------

annotate service.Employees with {
    company @(
        Common.Text            : company.name,
        Common.Text.@UI.TextArrangement : #TextOnly,
    )
};

annotate service.Employees with {
    department @(
        Common.Text            : department.name,
        Common.Text.@UI.TextArrangement : #TextOnly,
    )
};

annotate service.Employees with {
    role @(
        Common.Text            : role.roleName,
        Common.Text.@UI.TextArrangement : #TextOnly,
    )
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

// ---------------------------------------------------------------------
// UI annotations — macros:Table / macros:Form need these to know what
// to render. Not specific to custom pages; a standard FE app would
// need the exact same block.
// ---------------------------------------------------------------------

// ---------------------------------------------------------------------
// Property-level labels — needed because FilterBar fields (driven by
// UI.SelectionFields, a plain array of property paths) can't carry an
// inline Label the way LineItem/FieldGroup entries can. They fall back
// to whatever label the property itself has.
// ---------------------------------------------------------------------

annotate service.Employees with {
    employeeNo    @title : 'Employee No';
    firstName     @title : 'First Name';
    lastName      @title : 'Last Name';
    email         @title : 'Email';
    salary        @title : 'Salary';
    company    @title : 'Company';
    department @title : 'Department';
    role       @title : 'Role';
};

annotate service.Employees with @(
    UI.HeaderInfo : {
        TypeName       : 'Employee',
        TypeNamePlural : 'Employees',
        Title          : { Value : lastName },
        Description    : { Value : employeeNo },
    },

    UI.SelectionFields #SF1 : [
        employeeNo,
        company_ID,
        department_ID,
    ],

    UI.LineItem : [
        { Value : employeeNo,    Label : 'Employee No' },
        { Value : firstName,     Label : 'First Name' },
        { Value : lastName,      Label : 'Last Name' },
        { Value : email,         Label : 'Email' },
        { Value : salary,        Label : 'Salary' },
        { Value : company_ID,    Label : 'Company' },
        { Value : department_ID, Label : 'Department' },
    ],

    UI.FieldGroup #GeneralInfo : {
        Data : [
            { Value : employeeNo,    Label : 'Employee No' },
            { Value : firstName,     Label : 'First Name' },
            { Value : lastName,      Label : 'Last Name' },
            { Value : email,         Label : 'Email' },
            { Value : salary,        Label : 'Salary' },
            { Value : company_ID,    Label : 'Company' },
            { Value : department_ID, Label : 'Department' },
            { Value : role_ID,       Label : 'Role' },
        ],
    },

    UI.Facets : [
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'General Information',
            Target : '@UI.FieldGroup#GeneralInfo',
        },
    ],
);

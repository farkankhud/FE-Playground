namespace playground;

using { cuid, managed } from '@sap/cds/common';

entity Departments : cuid, managed {
    name        : String(100);
    company : String(5);

    employees   : Composition of many Employees
                    on employees.department = $self;
}

entity Roles : cuid, managed {
    roleName    : String(80);
    description : String(255);

    employees   : Composition of many Employees
                    on employees.role = $self;
}

entity Employees : cuid, managed {

    employeeNo : String(10);

    firstName  : String(80);

    lastName   : String(80);

    email      : String(120);

    salary     : Decimal(15,2);

    department : Association to Departments;

    company: String(5);

    role       : Association to Roles;

}
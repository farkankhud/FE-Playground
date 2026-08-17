namespace playground1;

// using { cuid, managed } from '@sap/cds/common';
entity Companies {
    key ID   : String(4);
    //  key   company: String(4);
        name : String(100);
}

entity Departments {
    key ID        : UUID;
        name      : String(100);
        company   : Association to Companies;
}

entity Roles {
    key ID        : UUID;
        roleName  : String(80);
        description : String(255);   
        department : Association to Departments;
}

entity Employees {
    key ID         : UUID;
        employeeNo : String(10);
        firstName  : String(80);
        lastName   : String(80);
        email     : String(80);
        salary    : Decimal(15,2);
        company    : Association to Companies;
        department : Association to Departments;
        role       : Association to Roles;
}
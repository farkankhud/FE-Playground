using { playground1 } from '../db/dependent-value-help';


service custompageService {

    entity Companies
        as projection on playground1.Companies;

    entity Departments
        as projection on playground1.Departments;

    entity Roles
        as projection on playground1.Roles;
@odata.draft.enabled: true
    entity Employees
        as projection on playground1.Employees;
}
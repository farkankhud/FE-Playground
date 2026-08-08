using playground from '../db/schema';

@odata.draft.enabled: true
service CatalogService {
    @odata.draft.enabled: true
    entity Employees
        as projection on playground.Employees;

    entity Departments
        as projection on playground.Departments;

    entity Roles
        as projection on playground.Roles;

}
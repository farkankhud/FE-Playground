// using { playground } from '../db/schema';
using playground from '../db/schema';

// @odata.draft.enabled: true
service ActionService {
//  @insertonly
@odata.draft.enabled: true
    entity Employees as projection on playground.Employees
        actions {
            action promoteEmployee() returns String;
        };
         entity Departments
        as projection on playground.Departments;

    entity Roles
        as projection on playground.Roles;

}
// annotate ActionService.Employees.actions.promoteEmployee with
//     @Core.OperationAvailable: not isPromoted;
annotate ActionService.Employees with actions {
    promoteEmployee @Core.OperationAvailable: {
        $edmJson: {
            $Not: { $Path: 'isPromoted' }
        }
    };
};
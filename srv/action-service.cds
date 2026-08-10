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

}
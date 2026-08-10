import cds from '@sap/cds';
class ActionService extends cds.ApplicationService {
  init() {
    const { Employees } = this.entities;

        this.on('promoteEmployee', Employees, async (req) => {

            console.log('Promote Employee action called');
            req.info('Employee promoted successfully');
            return 'Employee promoted successfully';
        });

        //  this.after('SAVE', Employees.drafts, async (data, req) => {

        //     const {
        //         employeeNo,
        //         firstName
        //     } = data;

        //     req.info(
        //         `Employee ${req.data.employeeNo} - ${req.data.firstName} created successfully`
        //     );

        // });
    //     this.on('CREATE', Employees, async (req) => {
    //         // const { employeeNo,firstName,lastName,email,salary,department,role } = req.data;
    //         // req.info(`Employee ${employeeNo} - ${firstName} created successfully`);
    //         // // req.info(`Employee ${data.employeeNo} - ${data.firstName} created successfully`);

    //         const {
    //     employeeNo,
    //     firstName,
    //     lastName,
    //     email,
    //     salary,
    //     department,
    //     role
    // } = req.data;

    // const employee = await INSERT.into(Employees).entries({
    //     employeeNo,
    //     firstName,
    //     lastName,
    //     email,
    //     salary,
    //     department,
    //     role
    // });

    // req.info(
    //     `Employee ${employeeNo} - ${firstName} created successfully`
    // );

    // return employee;
    //     });
        return super.init();
  }
}
export default ActionService
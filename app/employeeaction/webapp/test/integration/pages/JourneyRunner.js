sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"playground/employeeaction/employeeaction/test/integration/pages/EmployeesList.gen",
	"playground/employeeaction/employeeaction/test/integration/pages/EmployeesObjectPage.gen"
], function (JourneyRunner, EmployeesListGenerated, EmployeesObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('playground/employeeaction/employeeaction') + '/test/flp.html#app-preview',
        pages: {
			onTheEmployeesListGenerated: EmployeesListGenerated,
			onTheEmployeesObjectPageGenerated: EmployeesObjectPageGenerated
        },
        async: true
    });

    return runner;
});


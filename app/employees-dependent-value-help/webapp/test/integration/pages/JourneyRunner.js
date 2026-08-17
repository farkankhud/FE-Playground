sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"playground1/employee/valuehelp/employeesdependentvaluehelp/test/integration/pages/EmployeesList.gen",
	"playground1/employee/valuehelp/employeesdependentvaluehelp/test/integration/pages/EmployeesObjectPage.gen"
], function (JourneyRunner, EmployeesListGenerated, EmployeesObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('playground1/employee/valuehelp/employeesdependentvaluehelp') + '/test/flp.html#app-preview',
        pages: {
			onTheEmployeesListGenerated: EmployeesListGenerated,
			onTheEmployeesObjectPageGenerated: EmployeesObjectPageGenerated
        },
        async: true
    });

    return runner;
});


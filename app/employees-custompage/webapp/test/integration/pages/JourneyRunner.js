sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"playground/employee/custompage/employeescustompage/test/integration/pages/EmployeesMain.gen"
], function (JourneyRunner, EmployeesMainGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('playground/employee/custompage/employeescustompage') + '/test/flp.html#app-preview',
        pages: {
			onTheEmployeesMainGenerated: EmployeesMainGenerated
        },
        async: true
    });

    return runner;
});


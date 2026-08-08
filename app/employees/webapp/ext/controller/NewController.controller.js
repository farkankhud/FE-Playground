sap.ui.define(['sap/ui/core/mvc/ControllerExtension',
	"sap/m/MessageToast"
], function (ControllerExtension, MessageToast) {
	'use strict';

	return ControllerExtension.extend('playground.employee.employees.ext.controller.NewController', {
		// this section allows to extend lifecycle hooks or hooks provided by Fiori elements
		override: {
			/**
             * Called when a controller is instantiated and its View controls (if available) are already created.
             * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
             * @memberOf playground.employee.employees.ext.controller.NewController
             */
			onInit: function () {
				// you can access the Fiori elements extensionAPI via this.base.getExtensionAPI
				var oModel = this.base.getExtensionAPI().getModel();
				var ef = this.base.getExtensionAPI().getEditFlow();

// console.log(ef);
// console.log(typeof ef.attachOnAfterCreate);
// console.log(Object.getOwnPropertyNames(ef));
// console.log(Object.getOwnPropertyNames(Object.getPrototypeOf(ef)));
// var ef = this.base.getExtensionAPI().getEditFlow();

// console.log(ef.onAfterCreate.toString());
console.log(
    this.base.getExtensionAPI()
        .getEditFlow()
        .registerEditLifecycleCallbacks
        .toString()
);
var ef = this.base.getExtensionAPI().getEditFlow();
// debugger;
			},

			editFlow: {

                    //  onBeforeSave: async function (oContext) {
					// 	debugger;

                    //     var sEmployeeNo = oContext.context.getProperty("employeeNo");

                    //     MessageToast.show(
                    //         "Employee " + sEmployeeNo + " created successfully."
                    //     );
                    // },
					onAfterSave: async function (oContext) {
						debugger;

                        var sEmployeeNo = oContext.context.getProperty("employeeNo");

                        MessageToast.show(
                            "Employee " + sEmployeeNo + " created successfully."
                        );
                    }
                }
		}
	});
});

sap.ui.define(['sap/ui/core/mvc/ControllerExtension',
	'sap/m/MessageToast'
], function (ControllerExtension, MessageToast) {
	'use strict';

	return ControllerExtension.extend('playground.employeeaction.employeeaction.ext.controller.NewController', {
		// this section allows to extend lifecycle hooks or hooks provided by Fiori elements
		override: {
			/**
			 * Called when a controller is instantiated and its View controls (if available) are already created.
			 * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
			 * @memberOf playground.employeeaction.employeeaction.ext.controller.NewController
			 */
			onInit: function () {
				// you can access the Fiori elements extensionAPI via this.base.getExtensionAPI
				var oModel = this.base.getExtensionAPI().getModel();
				this._bCreatingEmployee = false;
			},
			editFlow: {

				onBeforeCreate: function () {
					this._bCreatingEmployee = true;
				},
				onAfterSave: async function (oContext) {
					debugger;
					var sEmployeeNo = oContext.context.getProperty("employeeNo");
					if (this._bCreatingEmployee) {
						// this._bCreatingEmployee = true;
						MessageToast.show(
							"Employee " + sEmployeeNo + " created successfully."
						);
						this._bCreatingEmployee = false;
					}
					else {
						MessageToast.show(
							"Employee " + sEmployeeNo + " updated successfully."
						);

					}




				},
				// onAfterDelete: async function (oContext) {
                   
                //         MessageToast.show(
                //             "Employee deleted successfully."
                //         );
                //     }
			}
		}
	});
});

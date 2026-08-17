sap.ui.define(
    [
        'sap/fe/core/PageController'
    ],
    function(PageController) {
        'use strict';

        return PageController.extend('playground.employee.custompage.employeescustompage.ext.view.Main', {
            /**
             * Called when a controller is instantiated and its View controls (if available) are already created.
             * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
             * @memberOf playground.employee.custompage.employeescustompage.ext.view.Main
             */
             onInit: function () {
                 PageController.prototype.onInit.apply(this, arguments); // needs to be called to properly initialize the page controller
             
                // Standard Fiori Elements auto-refreshes the List Report
                // table whenever you navigate back to it (e.g. after
                // Save on the Object Page). A custom page doesn't get
                // that for free — so we re-fetch the table's data
                // ourselves every time this route is matched again.
                this.getAppComponent()
                    .getRoutingService()
                    .attachRouteMatched(function (oEvent) {
                        if (oEvent.getParameter("name") === "EmployeesMain") {
                            const oTable = this.byId("employeesTable");
                            const oListBinding = oTable && oTable.getRowBinding();
                            if (oListBinding) {
                                oListBinding.refresh();
                            }
                        }
                    }, this); 
             
                },

                /**
             * Creates a new Employee draft and navigates to it — same
             * outcome as the auto-generated Create button on a standard
             * List Report, wired manually since macros:Table doesn't
             * generate it for you.
             * @memberOf playground.employee.custompage.employeescustompage.ext.view.Main
             */
            onCreate: function () {
                const oTable = this.byId("employeesTable");
                const oListBinding = oTable.getRowBinding();
 
                this.editFlow.createDocument(oListBinding, {
                    creationMode: "NewPage"
                });
            },
 
            /**
             * Deletes the currently selected row(s).
             * @memberOf playground.employee.custompage.employeescustompage.ext.view.Main
             */
            onDelete: function () {
                const oTable = this.byId("employeesTable");
                const aSelectedContexts = oTable.getSelectedContexts();
 
                this.editFlow.deleteDocument(aSelectedContexts);
            },
 
            /**

            /**
             * Similar to onAfterRendering, but this hook is invoked before the controller's View is re-rendered
             * (NOT before the first rendering! onInit() is used for that one!).
             * @memberOf playground.employee.custompage.employeescustompage.ext.view.Main
             */
            //  onBeforeRendering: function() {
            //
            //  },

            /**
             * Called when the View has been rendered (so its HTML is part of the document). Post-rendering manipulations of the HTML could be done here.
             * This hook is the same one that SAPUI5 controls get after being rendered.
             * @memberOf playground.employee.custompage.employeescustompage.ext.view.Main
             */
            //  onAfterRendering: function() {
            //
            //  },

            /**
             * Called when the Controller is destroyed. Use this one to free resources and finalize activities.
             * @memberOf playground.employee.custompage.employeescustompage.ext.view.Main
             */
            //  onExit: function() {
            //
            //  }
        });
    }
);

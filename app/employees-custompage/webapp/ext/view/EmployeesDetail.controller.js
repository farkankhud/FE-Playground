sap.ui.define(
    ["sap/fe/core/PageController"],
    function (PageController) {
        "use strict";

        return PageController.extend(
            "playground.employee.custompage.employeescustompage.ext.view.EmployeesDetail",
            {
                onInit: function () {
                    PageController.prototype.onInit.apply(this, arguments);
                    // sap.fe.core.PageController manages footer/editable
                    // state internally for standard FE templates and can
                    // reset showFooter after render, even though it's set
                    // to true in the XML. Reassert it after every render
                    // pass so our custom footer always stays visible.
    //********************Without this the footer would not be visible **    */

                    this.getView().addEventDelegate({
                        onAfterRendering: function () {
                            const oObjectPage = this.byId("employeeObjectPage");
                            if (oObjectPage && !oObjectPage.getShowFooter()) {
                                oObjectPage.setShowFooter(true);
                            }
                        }.bind(this)
                    });
                    
    //****************Without this the footer would not be visible **    */
                },

                onCreate: function () {
                    const oModel = this.getView().getModel();
                    const oListBinding = oModel.bindList("/Employees");

                    this.editFlow.createDocument(oListBinding, {
                        creationMode: "NewPage"
                    });
                },

                onEdit: function () {
                    const oContext = this.getView().getBindingContext();
                    this.editFlow.editDocument(oContext);
                },

                onSave: function () {
                    const oContext = this.getView().getBindingContext();
                    this.editFlow.saveDocument(oContext);
                },

                onCancel: function () {
                    const oContext = this.getView().getBindingContext();
                    this.editFlow.cancelDocument(oContext);
                }
            }
        );
    }
);
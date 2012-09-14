<%@ Page Title="Expoter Detail" Language="VB" MasterPageFile="~/Popup.master" AutoEventWireup="false"
    CodeFile="ExporterDetail.aspx.vb" Inherits="aspx.customer.ExporterDetail" %>

<%@ Register Assembly="Mytextbox" Namespace="Mytextbox" TagPrefix="MyTextbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .requireFieldValidate{
            background-color:#66FFAA;
        }
        .checkPercentValidate{
            background-color:red;
        }
    </style>

    <script type="text/javascript">
        function blurOnFocus(e) {
            e.preventDefault();
            this.blur();
        }
    </script>

    <script type="text/javascript">
        Ext.onReady(function() {
            //declare variable element
            var cifElement = Ext.select("[ExtId=CIF_TextBox]").first();
            var totLimitElement = Ext.select("[ExtId=TotalLimit_TextBox]").first();
            var cusNameElement = Ext.select("[ExtId=Name_TextBox]").first();
            var totOSElement = Ext.select("[ExtId=TotalOS_TextBox]").first();
            var businessElement = Ext.select("[ExtId=Business_TextBox]").first();
            var groupExpoElement = Ext.select("[ExtId=GroupExpo_TextBox]").first();
            var exportTo01Element = Ext.select("[ExtId=ExportTo1_DDL]").first();
            var exportTo02Element = Ext.select("[ExtId=ExportTo2_DDL]").first();
            var exportTo03Element = Ext.select("[ExtId=ExportTo3_DDL]").first();

            var revElement = Ext.select("[ExtId=Revenue_TextBox]").first();
            var revLocalElement = Ext.select("[ExtId=RevenueLocal_TextBox]").first();
            var revExportElement = Ext.select("[ExtId=RevenueExport_TextBox]").first();
            var exCurType01Element = Ext.select("[ExtId=ExCurrencyType1_DLL]").first();
            var exCurType02Element = Ext.select("[ExtId=ExCurrencyType2_DLL]").first();
            var exCurType03Element = Ext.select("[ExtId=ExCurrencyType3_DLL]").first();
            var exPer01Element = Ext.select("[ExtId=ExPercentage1_TextBox]").first();
            var exPer02Element = Ext.select("[ExtId=ExPercentage2_TextBox]").first();
            var exPer03Element = Ext.select("[ExtId=ExPercentage3_TextBox]").first();

            var cogsElement = Ext.select("[ExtId=COGS_TextBox]").first();
            var cogsLocalElement = Ext.select("[ExtId=COGSLocal_TextBox]").first();
            var cogsImportElement = Ext.select("[ExtId=COGSImport_TextBox]").first();
            var imCurType01Element = Ext.select("[ExtId=ImCurrencyType1_DLL]").first();
            var imCurType02Element = Ext.select("[ExtId=ImCurrencyType2_DLL]").first();
            var imCurType03Element = Ext.select("[ExtId=ImCurrencyType3_DLL]").first();
            var imPer01Element = Ext.select("[ExtId=ImPercentage1_TextBox]").first();
            var imPer02Element = Ext.select("[ExtId=ImPercentage2_TextBox]").first();
            var imPer03Element = Ext.select("[ExtId=ImPercentage3_TextBox]").first();

            var grossMarginElement = Ext.select("[ExtId=GrossMargin_TextBox]").first();
            var calGrossPerElement = Ext.select("[ExtId=CalGrossMarginPercent_TextBox]").first();
            var sgAElement = Ext.select("[ExtId=SGA_TextBox]").first();
            var netMarginElement = Ext.select("[ExtId=NetMargin_TextBox]").first();
            var calNetPerElement = Ext.select("[ExtId=CalNetMarginPercent_TextBox]").first();
            var payInterestElement = Ext.select("[ExtId=PayInterest_TextBox]").first();
            var payPrinElement = Ext.select("[ExtId=PayPrincipal_TextBox]").first();
            var calDSCRElement = Ext.select("[ExtId=CalDSCR_TextBox]").first();

            var updateByElement = Ext.select("[ExtId=UpdateBy_TextBox]").first();
            var updateNameElement = Ext.select("[ExtId=UpdateName_TextBox]").first();
            var updateDateElement = Ext.select("[ExtId=UpdateDate_TextBox]").first();

            var insertButton = Ext.select("[ExtId=InsertButton]").first();
            var updateButton = Ext.select("[ExtId=UpdateButton]").first();
            var deleteButton = Ext.select("[ExtId=DeleteButton]").first();

            var remarkElement = Ext.select("[ExtId=Remark_Textbox]").first();
            //end declare variable element


            //check percentage digit
            var percentageElements = Ext.select("input[IsPercentage=Yes]");
            percentageElements.set({ maxLength: 3 });
            //end check percentage digit


            //format IsNumeric Element onblur event
            var numericElements = Ext.select("input[IsNumeric=Yes]");
            numericElements.on({
                "blur": {
                    fn: function(e, t, o) {
                        t.value = (new MyNumber(t.value)).toCurrency(2);
                    }
                }
            });
            //format IsNumeric Element onblur event


            //add listener on readonly textbox css
            var readOnlyElements = Ext.select("input[class*=ReadOnly]");
            readOnlyElements.add(Ext.select("textarea[class*=ReadOnly]").first());
            readOnlyElements.on("focus", blurOnFocus);
            //end //add listener on readonly textbox css


            //lock country
            var countryElements = new Ext.CompositeElement().add([
                exportTo01Element,
                exportTo02Element,
                exportTo03Element
            ]);

            //initial
            //disable N/A Dropdown
            for (var i = 0; i < countryElements.getCount() - 1; i++) {
                if (countryElements.item(i).dom.selectedIndex == 0) {
                    countryElements.item(i + 1).dom.disabled = true;
                }
            }

            //add listener on change dropdown
            countryElements.on({
                "change": function(e, t, o) {
                    //find next index of this element
                    var nextIndex = 0;
                    for (var i = 0; i < o.srcElements.getCount(); i++) {
                        if (t.id == o.srcElements.item(i).dom.id) {
                            nextIndex = i + 1;
                            break;
                        }
                    }

                    //disable next dropdown if this dropdown index = 0
                    if (t.selectedIndex == 0) {
                        for (var i = nextIndex; i < o.srcElements.getCount(); i++) {
                            o.srcElements.item(i).dom.selectedIndex = 0;
                            o.srcElements.item(i).dom.disabled = true;
                        }
                    } else {
                        o.srcElements.item(nextIndex).dom.disabled = false;
                    }
                },
                scope: this,
                srcElements: countryElements
            });
            //end lock country


            var exportCurrencyTypeElements = new Ext.CompositeElement().add([
                exCurType01Element,
                exCurType02Element,
                exCurType03Element
            ]);
            var exportCurrencyPercentElements = new Ext.CompositeElement().add([
                exPer01Element,
                exPer02Element,
                exPer03Element
            ]);

            var srcRevElements = {
                revElement: revElement,
                revLocalElement: revLocalElement,
                revExportElement: revExportElement
            };


            //validate percent revenue
            new Ext.CompositeElementLite().add([
                revLocalElement,
                revExportElement
            ]).on({
                "keyup": {
                    fn: function(e, t, o) {
                        //var revLocalValue = new MyNumber(o.srcElements.revLocalElement.dom.value);
                        //var revExportValue = new MyNumber(o.srcElements.revExportElement.dom.value);

                        var targetElement = (t.id == o.srcElements.revLocalElement.dom.id) ? o.srcElements.revExportElement : o.srcElements.revLocalElement;
                        var currentValue = new MyNumber(t.value);

                        if (currentValue.getValue() < 0) {
                            //window.confirm()
                            t.value = 0;
                            currentValue = 0;
                        } else if (currentValue.getValue() > 100) {
                            t.value = 100;
                            currentValue = 100;
                        }
                        targetElement.dom.value = (new MyNumber(100)).subtraction(currentValue).getValue();

                        //enable currency
                        if (o.srcElements.revExportElement.dom.value > 0) {
                            o.exportTypeElements.item(0).dom.disabled = false;
                            //o.exportPercentElements.item(0).replaceClass("textBoxReadOnlyAlignRight", "textBoxNormalAlignRight");
                            //o.exportPercentElements.item(0).un("focus", blurOnFocus);
                        } else {
                            for (var i = 0; i < o.exportTypeElements.getCount(); i++) {
                                o.exportTypeElements.item(i).dom.selectedIndex = 0;
                                o.exportTypeElements.item(i).dom.disabled = true;

                                o.exportPercentElements.item(i).dom.value = "";
                                o.exportPercentElements.item(i).replaceClass("textBoxNormalAlignRight", "textBoxReadOnlyAlignRight");
                                o.exportPercentElements.item(i).on("focus", blurOnFocus);
                            }
                        }
                    },
                    scope: this,
                    srcElements: srcRevElements,
                    exportTypeElements: exportCurrencyTypeElements,
                    exportPercentElements: exportCurrencyPercentElements
                }
            });
            //end validate percent revenue


            //lock export currency
            //initial disable N/A Dropdown
            if ((new MyNumber(revExportElement.dom.value)).getValue() <= 0) {
                exportCurrencyTypeElements.item(0).dom.disabled = true;

                exportCurrencyPercentElements.item(0).replaceClass("textBoxNormalAlignRight", "textBoxReadOnlyAlignRight");
                exportCurrencyPercentElements.item(0).on("focus", blurOnFocus);
            }

            for (var i = 0; i < exportCurrencyTypeElements.getCount() - 1; i++) {
                if (exportCurrencyTypeElements.item(i).dom.selectedIndex == 0) {
                    exportCurrencyPercentElements.item(i).replaceClass("textBoxNormalAlignRight", "textBoxReadOnlyAlignRight");
                    exportCurrencyPercentElements.item(i).on("focus", blurOnFocus);
                
                    exportCurrencyTypeElements.item(i + 1).dom.disabled = true;

                    exportCurrencyPercentElements.item(i + 1).replaceClass("textBoxNormalAlignRight", "textBoxReadOnlyAlignRight");
                    exportCurrencyPercentElements.item(i + 1).on("focus", blurOnFocus);
                }
            }

            //add listener on change dropdown
            exportCurrencyTypeElements.on({
                "change": function(e, t, o) {
                    //find next index of this element
                    var nextIndex = 0;
                    for (var i = 0; i < o.srcElements.getCount(); i++) {
                        if (t.id == o.srcElements.item(i).dom.id) {
                            nextIndex = i + 1;
                            break;
                        }
                    }

                    //disable next dropdown if this dropdown index = 0
                    if (t.selectedIndex == 0) {
                        o.targetElements.item(nextIndex - 1).dom.value = "";
                        o.targetElements.item(nextIndex - 1).replaceClass("textBoxNormalAlignRight", "textBoxReadOnlyAlignRight");
                        o.targetElements.item(nextIndex - 1).on("focus", blurOnFocus);
                        
                        for (var i = nextIndex; i < o.srcElements.getCount(); i++) {
                            o.srcElements.item(i).dom.selectedIndex = 0;
                            o.srcElements.item(i).dom.disabled = true;

                            o.targetElements.item(i).dom.value = "";
                            o.targetElements.item(i).replaceClass("textBoxNormalAlignRight", "textBoxReadOnlyAlignRight");
                            o.targetElements.item(i).on("focus", blurOnFocus);
                        }
                    } else {
                        o.targetElements.item(nextIndex - 1).dom.value = "";
                        o.targetElements.item(nextIndex - 1).replaceClass("textBoxReadOnlyAlignRight", "textBoxNormalAlignRight");
                        o.targetElements.item(nextIndex - 1).un("focus", blurOnFocus);
                        
                        o.srcElements.item(nextIndex).dom.disabled = false;
                        
//                        o.targetElements.item(nextIndex).replaceClass("textBoxReadOnlyAlignRight", "textBoxNormalAlignRight");
//                        o.targetElements.item(nextIndex).un("focus", blurOnFocus);
                    }
                },
                scope: this,
                srcElements: exportCurrencyTypeElements,
                targetElements: exportCurrencyPercentElements
            });
            //end lock export currency


            var importCurrencyTypeElements = new Ext.CompositeElement().add([
                imCurType01Element,
                imCurType02Element,
                imCurType03Element
            ]);
            var importCurrencyPercentElements = new Ext.CompositeElement().add([
                imPer01Element,
                imPer02Element,
                imPer03Element
            ]);

            var srcCogsElements = {
                cogsElement: cogsElement,
                cogsLocalElement: cogsLocalElement,
                cogsImportElement: cogsImportElement
            };


            //validate percent cogs
            new Ext.CompositeElementLite().add([
                cogsLocalElement,
                cogsImportElement
            ]).on({
                "keyup": {
                    fn: function(e, t, o) {
                        var targetElement = (t.id == o.srcElements.cogsLocalElement.dom.id) ? o.srcElements.cogsImportElement : o.srcElements.cogsLocalElement;
                        var currentValue = new MyNumber(t.value);

                        if (currentValue.getValue() < 0) {
                            //window.confirm()
                            t.value = 0;
                            currentValue = 0;
                        } else if (currentValue.getValue() > 100) {
                            t.value = 100;
                            currentValue = 100;
                        }
                        targetElement.dom.value = (new MyNumber(100)).subtraction(currentValue).getValue();

                        //enable currency
                        if (o.srcElements.cogsImportElement.dom.value > 0) {
                            o.importTypeElements.item(0).dom.disabled = false;
                            o.importPercentElements.item(0).replaceClass("textBoxReadOnlyAlignRight", "textBoxNormalAlignRight");
                            o.importPercentElements.item(0).un("focus", blurOnFocus);
                        } else {
                            for (var i = 0; i < o.importTypeElements.getCount(); i++) {
                                o.importTypeElements.item(i).dom.selectedIndex = 0;
                                o.importTypeElements.item(i).dom.disabled = true;

                                o.importPercentElements.item(i).dom.value = "";
                                o.importPercentElements.item(i).replaceClass("textBoxNormalAlignRight", "textBoxReadOnlyAlignRight");
                                o.importPercentElements.item(i).on("focus", blurOnFocus);
                            }
                        }
                    },
                    scope: this,
                    srcElements: srcCogsElements,
                    importTypeElements: importCurrencyTypeElements,
                    importPercentElements: importCurrencyPercentElements
                }
            });
            //end validate percent cogs


            //lock import currency
            //initial disable N/A Dropdown
            if ((new MyNumber(cogsImportElement.dom.value)).getValue() <= 0) {
                importCurrencyTypeElements.item(0).dom.disabled = true;

                importCurrencyPercentElements.item(0).replaceClass("textBoxNormalAlignRight", "textBoxReadOnlyAlignRight");
                importCurrencyPercentElements.item(0).on("focus", blurOnFocus);
            }

            for (var i = 0; i < importCurrencyTypeElements.getCount() - 1; i++) {
                if (importCurrencyTypeElements.item(i).dom.selectedIndex == 0) {
                    importCurrencyPercentElements.item(i).replaceClass("textBoxNormalAlignRight", "textBoxReadOnlyAlignRight");
                    importCurrencyPercentElements.item(i).on("focus", blurOnFocus);
                    
                    importCurrencyTypeElements.item(i + 1).dom.disabled = true;

                    importCurrencyPercentElements.item(i + 1).replaceClass("textBoxNormalAlignRight", "textBoxReadOnlyAlignRight");
                    importCurrencyPercentElements.item(i + 1).on("focus", blurOnFocus);
                }
            }

            //add listener on change dropdown
            importCurrencyTypeElements.on({
                "change": function(e, t, o) {
                    //find next index of this element
                    var nextIndex = 0;
                    for (var i = 0; i < o.srcElements.getCount(); i++) {
                        if (t.id == o.srcElements.item(i).dom.id) {
                            nextIndex = i + 1;
                            break;
                        }
                    }

                    //disable next dropdown if this dropdown index = 0
                    if (t.selectedIndex == 0) {
                        o.targetElements.item(nextIndex - 1).dom.value = "";
                        o.targetElements.item(nextIndex - 1).replaceClass("textBoxNormalAlignRight", "textBoxReadOnlyAlignRight");
                        o.targetElements.item(nextIndex - 1).on("focus", blurOnFocus);
                        
                        for (var i = nextIndex; i < o.srcElements.getCount(); i++) {
                            o.srcElements.item(i).dom.selectedIndex = 0;
                            o.srcElements.item(i).dom.disabled = true;

                            o.targetElements.item(i).dom.value = "";
                            o.targetElements.item(i).replaceClass("textBoxNormalAlignRight", "textBoxReadOnlyAlignRight");
                            o.targetElements.item(i).on("focus", blurOnFocus);
                        }
                    } else {
                        o.targetElements.item(nextIndex - 1).dom.value = "";
                        o.targetElements.item(nextIndex - 1).replaceClass("textBoxReadOnlyAlignRight", "textBoxNormalAlignRight");
                        o.targetElements.item(nextIndex - 1).un("focus", blurOnFocus);
                        
                        o.srcElements.item(nextIndex).dom.disabled = false;

//                        o.targetElements.item(nextIndex).replaceClass("textBoxReadOnlyAlignRight", "textBoxNormalAlignRight");
//                        o.targetElements.item(nextIndex).un("focus", blurOnFocus);
                    }
                },
                scope: this,
                srcElements: importCurrencyTypeElements,
                targetElements: importCurrencyPercentElements
            });
            //end lock import currency


            //calGross margin
            var srcCalElements = {
                revElement: revElement,
                cogsElement: cogsElement,
                sgaElement: sgAElement,
                payIntElement: payInterestElement,
                payPrinElement: payPrinElement
            };

            var targetCalElements = {
                grossMarginElement: grossMarginElement,
                calGrossPerElement: calGrossPerElement,
                netMarginElement: netMarginElement,
                calNetPerElement: calNetPerElement,
                calDSCRElement: calDSCRElement
            };

            new Ext.CompositeElementLite().add([
                revElement,
                cogsElement,
                sgAElement,
                payInterestElement,
                payPrinElement
            ]).on({
                "keyup": {
                    fn: function(e, t, o) {
                        //var numericPatt = /[^0123456789.]/g;
                        var revValue = new MyNumber(o.srcElements.revElement.dom.value);
                        var cogsValue = new MyNumber(o.srcElements.cogsElement.dom.value);
                        var sgaValue = new MyNumber(o.srcElements.sgaElement.dom.value);
                        var payIntValue = new MyNumber(o.srcElements.payIntElement.dom.value);
                        var payPrinValue = new MyNumber(o.srcElements.payPrinElement.dom.value);

                        var grossValue = revValue.subtraction(cogsValue);

                        o.targetElements.grossMarginElement.dom.value = grossValue.toCurrency(2);
                        o.targetElements.calGrossPerElement.dom.value = grossValue.multiplication(100).division(revValue).toCurrency(2);

                        var netValue = grossValue.subtraction(sgaValue);
                        o.targetElements.netMarginElement.dom.value = netValue.toCurrency(2);
                        o.targetElements.calNetPerElement.dom.value = netValue.multiplication(100).division(revValue).toCurrency(2);

                        o.targetElements.calDSCRElement.dom.value = netValue.division(payIntValue.addition(payPrinValue)).toCurrency(2);
                    },
                    scope: this,
                    srcElements: srcCalElements,
                    targetElements: targetCalElements
                }
            });
            //end calGross margin


            //delete button confirm
            if (deleteButton) {
                deleteButton.on({
                    "click": {
                        fn: function(e, t, o) {
                            var result = confirm("คุณกำลังจะลบข้อมูลทั้งหมดของ Exporter รายนี้?");

                            if (result) {
                                alert("หลังจากลบข้อมูลแล้วอย่าลืมไปเปลี่ยน %export ที่หน้า port ด้วย");
                            } else {
                                e.stopEvent();
                            }
                        },
                        scope: this
                    }
                });
            }
            //end delete button confirm


            //validate export percentage on insert click
            function validatePercentage(validateComponent, relateComponent, filterElement) {
                var result = false;
                var sum = new MyNumber(0);
                var filterValue = new MyNumber(filterElement.dom.value);

                if (relateComponent.item(0).dom.selectedIndex == 0 && filterValue.getValue(true) == 0) {
                    return true;
                }

                for (var i = 0; i < validateComponent.getCount(); i++) {
                    if (relateComponent.item(i).dom.selectedIndex != 0) {
                        sum = sum.addition(validateComponent.item(i).dom.value);
                    } else {
                        //do nothing
                    }
                }

                if (sum.getValue() == 100) {
                    result = true;
                }

                return result;
            };

            function validateHandle(e, t, o) {
                var result = true;
                var resultPercent = true;

                //clear class of field validate
                Ext.select("[IsRequired=Yes]").removeClass("requireFieldValidate");
                Ext.select("[CheckPercent=False]").removeClass("checkPercentValidate");

                if (o.srcElements3.getValue(true) != 0) {
                    //revenueExport has value then dropdown must has value
                    o.srcElements2.item(0).dom.setAttribute("IsRequired", "Yes");
                } else {
                    o.srcElements2.item(0).dom.removeAttribute("IsRequired");
                }
                if (o.srcElements6.getValue(true) != 0) {
                    //cogsImport has value then dropdown must has value
                    o.srcElements5.item(0).dom.setAttribute("IsRequired", "Yes");
                } else {
                    o.srcElements5.item(0).dom.removeAttribute("IsRequired");
                } 
                //end class of clear field validate
                
                if (!validatePercentage(o.srcElements1, o.srcElements2, o.srcElements3)) {
                    resultPercent = false;

                    for (var i = 0; i < exportCurrencyTypeElements.getCount(); i++) {
                        if (exportCurrencyTypeElements.item(i).dom.selectedIndex != 0) {
                            exportCurrencyPercentElements.item(i).addClass("checkPercentValidate").dom.setAttribute("CheckPercent", "False");
                        }
                    }
                }

                if (!validatePercentage(o.srcElements4, o.srcElements5, o.srcElements6)) {
                    resultPercent = false;
 
                    for (var i = 0; i < importCurrencyTypeElements.getCount(); i++) {
                        if (importCurrencyTypeElements.item(i).dom.selectedIndex != 0) {
                            importCurrencyPercentElements.item(i).addClass("checkPercentValidate").dom.setAttribute("CheckPercent", "False");
                        }
                    }
                }

                var inputRequiredElements = Ext.select("input[IsRequired=Yes]");
                var selectRequiredElements = Ext.select("select[IsRequired=Yes]");

                for (var i = 0; i < inputRequiredElements.getCount(); i++) {
                    if (inputRequiredElements.item(i).dom.value == "") {
                        inputRequiredElements.item(i).addClass("requireFieldValidate");
                        result = false;
                    }
                }

                for (var i = 0; i < selectRequiredElements.getCount(); i++) {
                    if (selectRequiredElements.item(i).dom.selectedIndex == 0) {
                        selectRequiredElements.item(i).addClass("requireFieldValidate");
                        result = false;
                    }
                }

                //stop event if result = false
                if (!result || !resultPercent) {
                    e.stopEvent();

                    var msg = "";
                    if (!resultPercent) {
                        msg = msg + "<span style=&quote;color:red;font-weight:bold;&quote;>Sum of Currency Percentage must equal to 100.</span>";
                    }
                    if (!result) {
                        msg = msg + "<br/><span style=&quote;color:green;font-weight:bold;&quote;>Required Field can not be null.</span>";
                    }
                    Ext.Msg.alert("Validate failed", msg);
                }
            }

            if (insertButton) {
                insertButton.on({
                    "click": {
                        fn: validateHandle,
                        scope: this,
                        srcElements1: exportCurrencyPercentElements,
                        srcElements2: exportCurrencyTypeElements,
                        srcElements3: revExportElement,
                        srcElements4: importCurrencyPercentElements,
                        srcElements5: importCurrencyTypeElements,
                        srcElements6: cogsImportElement
                    }
                });
            }

            if (updateButton) {
                updateButton.on({
                    "click": {
                        fn: validateHandle,
                        scope: this,
                        srcElements1: exportCurrencyPercentElements,
                        srcElements2: exportCurrencyTypeElements,
                        srcElements3: revExportElement,
                        srcElements4: importCurrencyPercentElements,
                        srcElements5: importCurrencyTypeElements,
                        srcElements6: cogsImportElement
                    }
                });
            }
            //end validate export percentage on insert click

        });
        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:FormView ID="ExporterFormView" runat="server" CellPadding="4" DataKeyNames="CIF"
        Width="100%" Font-Bold="False" DataSourceID="Exporter_SqlDS">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <EditItemTemplate>
            <table width="100%" border="1" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 20%">
                        CIF
                    </td>
                    <td>
                        <MyTextbox:mytext ID="CIF_TextBox" ExtId="CIF_TextBox" IsInteger="Yes" runat="server" Text='<%# Bind("CIF") %>'
                            Width="20ex" CssClass="textBoxReadOnlyAlignRight" AllowUserKey="int_Integer"></MyTextbox:mytext>
                    </td>
                    <td>
                        Total Limit
                    </td>
                    <td>
                        <MyTextbox:mytext ID="TotalLimit_TextBox" ExtId="TotalLimit_TextBox" IsNumeric="Yes" IsRequired="Yes" runat="server" Text='<%# Bind("TOTAL_LIMIT", "{0:#,##0.00}") %>'
                            Width="20ex" CssClass="textBoxNormalAlignRight" AllowUserKey="num_Numeric" AutoCurrencyFormatOnKeyUp="true" TabIndex="11"></MyTextbox:mytext>
                        Baht
                    </td>
                </tr>
                <tr>
                    <td>
                        Name(Name of Exporter)
                    </td>
                    <td>
                        <asp:TextBox ID="Name_TextBox" ExtId="Name_TextBox" runat="server" Text='<%# Eval("Name") %>'
                            Width="45ex" CssClass="textBoxReadOnly"></asp:TextBox>
                    </td>
                    <td>
                        Total OS(<asp:Label ID="OS_ASOF_Label" ExtId="OS_ASOF_Label" runat="server" Text='<%# Eval("OS_AsOf", "{0:dd/MM/yy}") %>'></asp:Label>)
                    </td>
                    <td>
                        <MyTextbox:mytext ID="TotalOS_TextBox" ExtId="TotalOS_TextBox" runat="server" Text='<%# Bind("TOTAL_OS", "{0:#,##0.00}") %>'
                            Width="20ex" CssClass="textBoxReadOnlyAlignRight"></MyTextbox:mytext>
                        Baht
                    </td>
                </tr>
                <tr>
                    <td>
                        Goods(Type of Export)
                    </td>
                    <td>
                        <asp:TextBox ID="Business_TextBox" ExtId="Business_TextBox" runat="server" Text='<%# Eval("Business_1") %>'
                            Width="45ex" CssClass="textBoxReadOnly"></asp:TextBox>
                    </td>
                    <td>
                        Group Exposure
                    </td>
                    <td>
                        <MyTextbox:mytext ID="GroupExpo_TextBox" ExtId="GroupExpo_TextBox" IsNumeric="Yes" IsRequired="Yes" runat="server" Text='<%# Bind("GROUP_EXPOSURE", "{0:#,##0.00}") %>'
                            Width="20ex" CssClass="textBoxNormalAlignRight" AllowUserKey="num_Numeric" AutoCurrencyFormatOnKeyUp="true" TabIndex="12"></MyTextbox:mytext>
                        Baht
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <table width="100%" border="1" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width: 20%">
                                    Export to<br />
                                    (Country Exported to)
                                </td>
                                <td>
                                    <asp:DropDownList ID="ExportTo1_DDL" ExtId="ExportTo1_DDL" IsRequired="Yes" runat="server" DataSourceID="Country_SqlDS"
                                        DataTextField="DESCRIPTION" DataValueField="ID" TabIndex="13" 
                                        SelectedValue='<%# Bind("EXPORT_TO_1") %>'>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ExportTo2_DDL" ExtId="ExportTo2_DDL" runat="server" DataSourceID="Country_SqlDS"
                                        DataTextField="DESCRIPTION" DataValueField="ID" TabIndex="14" 
                                        SelectedValue='<%# Bind("EXPORT_TO_2") %>'>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ExportTo3_DDL" ExtId="ExportTo3_DDL" runat="server" DataSourceID="Country_SqlDS"
                                        DataTextField="DESCRIPTION" DataValueField="ID" TabIndex="15" 
                                        SelectedValue='<%# Bind("EXPORT_TO_3") %>'>
                                    </asp:DropDownList>
                                </td>
                                <td colspan="4">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 20px; background-color: White;">
                    </td>
                </tr>
                <tr>
                    <td>
                        Revenue
                    </td>
                    <td>
                        <MyTextbox:mytext ID="Revenue_TextBox" ExtId="Revenue_TextBox" IsNumeric="Yes" IsRequired="Yes" runat="server" Text='<%# Bind("REVENUE", "{0:#,##0.00}") %>'
                            Width="20ex" CssClass="textBoxNormalAlignRight" AllowUserKey="num_Numeric" AutoCurrencyFormatOnKeyUp="true" TabIndex="21"></MyTextbox:mytext>
                        Baht/YEAR
                    </td>
                    <td colspan="2" rowspan="2">
                    </td>
                </tr>
                <tr>
                    <td>
                        Revenue Local
                    </td>
                    <td>
                        <table width="100%" border="1" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width: 30%" colspan="2">
                                    <MyTextbox:mytext ID="RevenueLocal_TextBox" ExtId="RevenueLocal_TextBox" IsPercentage="Yes" IsRequired="Yes" runat="server"
                                        Text='<%# Bind("REVENUE_LOCAL") %>' Width="5ex" CssClass="textBoxNormalAlignRight"
                                         AllowUserKey="int_Integer" TabIndex="22"></MyTextbox:mytext>
                                    %
                                </td>
                                <td style="width: 40%">
                                    Revenue Export
                                </td>
                                <td style="width: 30%">
                                    <MyTextbox:mytext ID="RevenueExport_TextBox" ExtId="RevenueExport_TextBox" IsPercentage="Yes" IsRequired="Yes" runat="server"
                                        Text='<%# Bind("REVENUE_EXPORT") %>' Width="5ex" CssClass="textBoxNormalAlignRight"
                                        AllowUserKey="int_Integer" TabIndex="23"></MyTextbox:mytext>
                                    %
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        Currency
                    </td>
                    <td>
                        <asp:DropDownList ID="ExCurrencyType1_DLL" ExtId="ExCurrencyType1_DLL" runat="server"
                            DataSourceID="Currency_SqlDS" DataTextField="DESCRIPTION" DataValueField="ID"
                            TabIndex="24" SelectedValue='<%# Bind("EX_CURRENCY_TYPE_1") %>'>
                        </asp:DropDownList>
                        <MyTextbox:mytext ID="ExPercentage1_TextBox" ExtId="ExPercentage1_TextBox" IsPercentage="Yes" runat="server"
                            Text='<%# Bind("EX_PERCENTAGE_1") %>' Width="5ex" CssClass="textBoxNormalAlignRight"
                            AllowUserKey="int_Integer" TabIndex="25"></MyTextbox:mytext>
                        %
                    </td>
                    <td rowspan="3" colspan="2">
                        (Currency of Export)
                    </td>
                </tr>
                <tr>
                    <td>
                        Currency
                    </td>
                    <td>
                        <asp:DropDownList ID="ExCurrencyType2_DLL" ExtId="ExCurrencyType2_DLL" runat="server"
                            DataSourceID="Currency_SqlDS" DataTextField="DESCRIPTION" DataValueField="ID"
                            TabIndex="26" SelectedValue='<%# Bind("EX_CURRENCY_TYPE_2") %>'>
                        </asp:DropDownList>
                        <MyTextbox:mytext ID="ExPercentage2_TextBox" ExtId="ExPercentage2_TextBox" IsPercentage="Yes" runat="server"
                            Text='<%# Bind("EX_PERCENTAGE_2") %>' Width="5ex" CssClass="textBoxNormalAlignRight"
                            AllowUserKey="int_Integer" TabIndex="27"></MyTextbox:mytext>
                        %
                    </td>
                </tr>
                <tr>
                    <td>
                        Currency
                    </td>
                    <td>
                        <asp:DropDownList ID="ExCurrencyType3_DLL" ExtId="ExCurrencyType3_DLL" runat="server"
                            DataSourceID="Currency_SqlDS" DataTextField="DESCRIPTION" DataValueField="ID"
                            TabIndex="28" SelectedValue='<%# Bind("EX_CURRENCY_TYPE_3") %>'>
                        </asp:DropDownList>
                        <MyTextbox:mytext ID="ExPercentage3_TextBox" ExtId="ExPercentage3_TextBox" IsPercentage="Yes" runat="server"
                            Text='<%# Bind("EX_PERCENTAGE_3") %>' Width="5ex" CssClass="textBoxNormalAlignRight"
                            AllowUserKey="int_Integer" TabIndex="29"></MyTextbox:mytext>
                        %
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 20px; background-color: White;">
                    </td>
                </tr>
                <tr>
                    <td>
                        COGS
                    </td>
                    <td>
                        <MyTextbox:mytext ID="COGS_TextBox" ExtId="COGS_TextBox" IsNumeric="Yes" IsRequired="Yes" runat="server" Text='<%# Bind("COGS", "{0:#,##0.00}") %>'
                            Width="20ex" CssClass="textBoxNormalAlignRight" AllowUserKey="num_Numeric" AutoCurrencyFormatOnKeyUp="true" TabIndex="31"></MyTextbox:mytext>
                        Baht/YEAR
                    </td>
                    <td colspan="2">
                    </td>
                </tr>
                <tr>
                    <td>
                        COGS Local
                    </td>
                    <td>
                        <table width="100%" border="1" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width: 30%" colspan="2">
                                    <MyTextbox:mytext ID="COGSLocal_TextBox" ExtId="COGSLocal_TextBox" IsPercentage="Yes" IsRequired="Yes" runat="server" Text='<%# Bind("COGS_LOCAL") %>'
                                        Width="5ex" CssClass="textBoxNormalAlignRight" AllowUserKey="int_Integer" TabIndex="32"></MyTextbox:mytext>
                                    %
                                </td>
                                <td style="width: 40%">
                                    COGS Import
                                </td>
                                <td style="width: 30%">
                                    <MyTextbox:mytext ID="COGSImport_TextBox" ExtId="COGSImport_TextBox" IsPercentage="Yes" IsRequired="Yes" runat="server" Text='<%# Bind("COGS_IMPORT") %>'
                                        Width="5ex" CssClass="textBoxNormalAlignRight" AllowUserKey="int_Integer" TabIndex="33"></MyTextbox:mytext>
                                    %
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td colspan="2">
                        (% of imports to raw materials)
                    </td>
                </tr>
                <tr>
                    <td>
                        Currency
                    </td>
                    <td>
                        <asp:DropDownList ID="ImCurrencyType1_DLL" ExtId="ImCurrencyType1_DLL" runat="server"
                            DataSourceID="Currency_SqlDS" DataTextField="DESCRIPTION" DataValueField="ID"
                            TabIndex="34" SelectedValue='<%# Bind("IM_CURRENCY_TYPE_1") %>'>
                        </asp:DropDownList>
                        <MyTextbox:mytext ID="ImPercentage1_TextBox" ExtId="ImPercentage1_TextBox" IsPercentage="Yes" runat="server"
                            Text='<%# Bind("IM_PERCENTAGE_1") %>' Width="5ex" CssClass="textBoxNormalAlignRight"
                            AllowUserKey="int_Integer" TabIndex="35"></MyTextbox:mytext>
                        %
                    </td>
                    <td colspan="2" rowspan="3">
                        (Currency of Import)
                    </td>
                </tr>
                <tr>
                    <td>
                        Currency
                    </td>
                    <td>
                        <asp:DropDownList ID="ImCurrencyType2_DLL" ExtId="ImCurrencyType2_DLL" runat="server"
                            DataSourceID="Currency_SqlDS" DataTextField="DESCRIPTION" DataValueField="ID"
                            TabIndex="36" SelectedValue='<%# Bind("IM_CURRENCY_TYPE_2") %>'>
                        </asp:DropDownList>
                        <MyTextbox:mytext ID="ImPercentage2_TextBox" ExtId="ImPercentage2_TextBox" IsPercentage="Yes" runat="server"
                            Text='<%# Bind("IM_PERCENTAGE_2") %>' Width="5ex" CssClass="textBoxNormalAlignRight"
                            AllowUserKey="int_Integer" TabIndex="37"></MyTextbox:mytext>
                        %
                    </td>
                </tr>
                <tr>
                    <td>
                        Currency
                    </td>
                    <td>
                        <asp:DropDownList ID="ImCurrencyType3_DLL" ExtId="ImCurrencyType3_DLL" runat="server"
                            DataSourceID="Currency_SqlDS" DataTextField="DESCRIPTION" DataValueField="ID"
                            TabIndex="38" SelectedValue='<%# Bind("IM_CURRENCY_TYPE_3") %>'>
                        </asp:DropDownList>
                        <MyTextbox:mytext ID="ImPercentage3_TextBox" ExtId="ImPercentage3_TextBox" IsPercentage="Yes" runat="server"
                            Text='<%# Bind("IM_PERCENTAGE_3") %>' Width="5ex" CssClass="textBoxNormalAlignRight"
                            AllowUserKey="int_Integer" TabIndex="39"></MyTextbox:mytext>
                        %
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 20px; background-color: White;">
                    </td>
                </tr>
                <tr>
                    <td>
                        Gross Margin
                    </td>
                    <td>
                        <MyTextbox:mytext ID="GrossMargin_TextBox" ExtId="GrossMargin_TextBox" runat="server"
                            Text='<%# Bind("GROSS_MARGIN", "{0:#,##0.00}") %>' Width="20ex" CssClass="textBoxReadOnlyAlignRight"></MyTextbox:mytext>
                        Baht
                    </td>
                    <td colspan="2">
                        <MyTextbox:mytext ID="CalGrossMarginPercent_TextBox" ExtId="CalGrossMarginPercent_TextBox" IsPercentage="Yes"
                            runat="server" Width="6ex" CssClass="textBoxReadOnlyAlignRight"
                            Text='<%# Eval("GROSS_PERCENT", "{0:#,##0.00}") %>'></MyTextbox:mytext>
                        %Gross Margin
                    </td>
                </tr>
                <tr>
                    <td>
                        SG&amp;A
                    </td>
                    <td>
                        <MyTextbox:mytext ID="SGA_TextBox" runat="server" ExtId="SGA_TextBox" IsNumeric="Yes" IsRequired="Yes" Text='<%# Bind("SG_AND_A", "{0:#,##0.00}") %>'
                            Width="20ex" CssClass="textBoxNormalAlignRight" AllowUserKey="num_Numeric" AutoCurrencyFormatOnKeyUp="true" TabIndex="41"></MyTextbox:mytext>
                        Baht
                    </td>
                    <td colspan="2">
                    </td>
                </tr>
                <tr>
                    <td>
                        Net Margin
                    </td>
                    <td>
                        <MyTextbox:mytext ID="NetMargin_TextBox" ExtId="NetMargin_TextBox" runat="server" Text='<%# Bind("NET_MARGIN", "{0:#,##0.00}") %>'
                            Width="20ex" CssClass="textBoxReadOnlyAlignRight"></MyTextbox:mytext>
                        Baht
                    </td>
                    <td colspan="2">
                        <MyTextbox:mytext ID="CalNetMarginPercent_TextBox" ExtId="CalNetMarginPercent_TextBox" IsPercentage="Yes"
                            runat="server" Width="6ex" CssClass="textBoxReadOnlyAlignRight"
                            Text='<%# Eval("NET_PERCENT", "{0:#,##0.00}") %>'></MyTextbox:mytext>
                        %Net Margin
                    </td>
                </tr>
                <tr>
                    <td>
                        Pay Interest(All Bank)
                    </td>
                    <td>
                        <MyTextbox:mytext ID="PayInterest_TextBox" ExtId="PayInterest_TextBox" IsNumeric="Yes" IsRequired="Yes" runat="server"
                            Text='<%# Bind("PAY_INTEREST", "{0:#,##0.00}") %>' Width="20ex" CssClass="textBoxNormalAlignRight"
                            AllowUserKey="num_Numeric" AutoCurrencyFormatOnKeyUp="true" TabIndex="42"></MyTextbox:mytext>
                        Baht
                    </td>
                    <td colspan="2">
                        Remark
                    </td>
                </tr>
                <tr>
                    <td>
                        Pay Principal(All Bank)
                    </td>
                    <td>
                        <MyTextbox:mytext ID="PayPrincipal_TextBox" ExtId="PayPrincipal_TextBox" IsNumeric="Yes" IsRequired="Yes" runat="server"
                            Text='<%# Bind("PAY_PRINCIPAL", "{0:#,##0.00}") %>' Width="20ex" CssClass="textBoxNormalAlignRight"
                            AllowUserKey="num_Numeric" AutoCurrencyFormatOnKeyUp="true" TabIndex="43"></MyTextbox:mytext>
                        Baht
                    </td>
                    <td colspan="2" rowspan="2">
                        <asp:TextBox ID="Remark_TextBox" ExtId="Remark_TextBox" runat="server" TextMode="MultiLine"
                            Width="99%" CssClass="textBoxNormal" Text='<%# Bind("REMARK") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        DSCR
                    </td>
                    <td>
                        <MyTextbox:mytext ID="CalDSCR_TextBox" ExtId="CalDSCR_TextBox" IsNumeric="Yes" runat="server" Width="5ex"
                            CssClass="textBoxReadOnlyAlignRight"
                            Text='<%# Eval("DSCR", "{0:#,##0.00}") %>'></MyTextbox:mytext>
                        Times
                    </td>
                </tr>
                <tr>
                    <td>
                        Update By
                    </td>
                    <td>
                        <asp:TextBox ID="UpdateBy_TextBox" ExtId="UpdateBy_TextBox" runat="server" Width="10ex"
                            CssClass="textBoxReadOnlyAlignRight"
                            Text='<%# Eval("UPDATE_BY") %>'></asp:TextBox>
                        <asp:TextBox ID="UpdateName_TextBox" ExtId="UpdateName_TextBox" runat="server" Width="35ex"
                            CssClass="textBoxReadOnly"
                            Text='<%# Eval("UPDATE_NAME") %>'></asp:TextBox>
                    </td>
                    <td>
                        Update Date
                    </td>
                    <td>
                        <asp:TextBox ID="UpdateDate_TextBox" ExtId="UpdateDate_TextBox" runat="server" Width="20ex"
                            CssClass="textBoxReadOnly"
                            Text='<%# Eval("UPDATE_DATE") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <asp:LinkButton ID="UpdateButton" ExtId="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" ExtId="UpdateCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" />
                    </td>
                </tr>
            </table>
        </EditItemTemplate>
        <InsertItemTemplate>
            <table width="100%" border="1" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 20%">
                        CIF
                    </td>
                    <td>
                        <MyTextbox:mytext ID="CIF_TextBox" ExtId="CIF_TextBox" IsInteger="Yes" runat="server" Text='<%# Bind("CIF") %>'
                            Width="20ex" CssClass="textBoxReadOnlyAlignRight" AllowUserKey="int_Integer"></MyTextbox:mytext>
                        <asp:Label ID="Message_Label" ExtId="Message_Label" runat="server" Text="(ยังไม่เคยบันทึกข้อมูล)"
                            Font-Bold="True" ForeColor="Red"></asp:Label>
                    </td>
                    <td>
                        Total Limit
                    </td>
                    <td>
                        <MyTextbox:mytext ID="TotalLimit_TextBox" ExtId="TotalLimit_TextBox" IsNumeric="Yes" IsRequired="Yes" runat="server" Text='<%# Bind("TOTAL_LIMIT", "{0:#,##0.00}") %>'
                            Width="20ex" CssClass="textBoxNormalAlignRight" AllowUserKey="num_Numeric" AutoCurrencyFormatOnKeyUp="true" TabIndex="11"></MyTextbox:mytext>
                        Baht
                    </td>
                </tr>
                <tr>
                    <td>
                        Name(Name of Exporter)
                    </td>
                    <td>
                        <asp:TextBox ID="Name_TextBox" ExtId="Name_TextBox" runat="server" Text='<%# Eval("Name") %>'
                            Width="45ex" CssClass="textBoxReadOnly"></asp:TextBox>
                    </td>
                    <td>
                        Total OS(<asp:Label ID="OS_ASOF_Label" ExtId="OS_ASOF_Label" runat="server" Text='<%# Eval("OS_AsOf", "{0:dd/MM/yy}") %>'></asp:Label>)
                    </td>
                    <td>
                        <MyTextbox:mytext ID="TotalOS_TextBox" ExtId="TotalOS_TextBox" runat="server" Text='<%# Bind("TOTAL_OS", "{0:#,##0.00}") %>'
                            Width="20ex" CssClass="textBoxReadOnlyAlignRight"></MyTextbox:mytext>
                        Baht
                    </td>
                </tr>
                <tr>
                    <td>
                        Goods(Type of Export)
                    </td>
                    <td>
                        <asp:TextBox ID="Business_TextBox" ExtId="Business_TextBox" runat="server" Text='<%# Eval("Business_1") %>'
                            Width="45ex" CssClass="textBoxReadOnly"></asp:TextBox>
                    </td>
                    <td>
                        Group Exposure
                    </td>
                    <td>
                        <MyTextbox:mytext ID="GroupExpo_TextBox" ExtId="GroupExpo_TextBox" IsNumeric="Yes" IsRequired="Yes" runat="server" Text='<%# Bind("GROUP_EXPOSURE", "{0:#,##0.00}") %>'
                            Width="20ex" CssClass="textBoxNormalAlignRight" AllowUserKey="num_Numeric" AutoCurrencyFormatOnKeyUp="true" TabIndex="12"></MyTextbox:mytext>
                        Baht
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <table width="100%" border="1" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width: 20%">
                                    Export to<br />
                                    (Country Exported to)
                                </td>
                                <td>
                                    <asp:DropDownList ID="ExportTo1_DDL" ExtId="ExportTo1_DDL" IsRequired="Yes" runat="server" DataSourceID="Country_SqlDS"
                                        DataTextField="DESCRIPTION" DataValueField="ID" TabIndex="13" 
                                        SelectedValue='<%# Bind("EXPORT_TO_1") %>'>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ExportTo2_DDL" ExtId="ExportTo2_DDL" runat="server" DataSourceID="Country_SqlDS"
                                        DataTextField="DESCRIPTION" DataValueField="ID" TabIndex="14" 
                                        SelectedValue='<%# Bind("EXPORT_TO_2") %>'>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ExportTo3_DDL" ExtId="ExportTo3_DDL" runat="server" DataSourceID="Country_SqlDS"
                                        DataTextField="DESCRIPTION" DataValueField="ID" TabIndex="15" 
                                        SelectedValue='<%# Bind("EXPORT_TO_3") %>'>
                                    </asp:DropDownList>
                                </td>
                                <td colspan="4">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 20px; background-color: White;">
                    </td>
                </tr>
                <tr>
                    <td>
                        Revenue
                    </td>
                    <td>
                        <MyTextbox:mytext ID="Revenue_TextBox" ExtId="Revenue_TextBox" IsNumeric="Yes" IsRequired="Yes" runat="server" Text='<%# Bind("REVENUE", "{0:#,##0.00}") %>'
                            Width="20ex" CssClass="textBoxNormalAlignRight" AllowUserKey="num_Numeric" AutoCurrencyFormatOnKeyUp="true" TabIndex="21"></MyTextbox:mytext>
                        Baht/YEAR
                    </td>
                    <td colspan="2" rowspan="2">
                    </td>
                </tr>
                <tr>
                    <td>
                        Revenue Local
                    </td>
                    <td>
                        <table width="100%" border="1" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width: 30%" colspan="2">
                                    <MyTextbox:mytext ID="RevenueLocal_TextBox" ExtId="RevenueLocal_TextBox" IsPercentage="Yes" IsRequired="Yes" runat="server"
                                        Text='<%# Bind("REVENUE_LOCAL") %>' Width="5ex" CssClass="textBoxNormalAlignRight"
                                         AllowUserKey="int_Integer" TabIndex="22"></MyTextbox:mytext>
                                    %
                                </td>
                                <td style="width: 40%">
                                    Revenue Export
                                </td>
                                <td style="width: 30%">
                                    <MyTextbox:mytext ID="RevenueExport_TextBox" ExtId="RevenueExport_TextBox" IsPercentage="Yes" IsRequired="Yes" runat="server"
                                        Text='<%# Bind("REVENUE_EXPORT") %>' Width="5ex" CssClass="textBoxNormalAlignRight"
                                        AllowUserKey="int_Integer" TabIndex="23"></MyTextbox:mytext>
                                    %
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        Currency
                    </td>
                    <td>
                        <asp:DropDownList ID="ExCurrencyType1_DLL" ExtId="ExCurrencyType1_DLL" runat="server"
                            DataSourceID="Currency_SqlDS" DataTextField="DESCRIPTION" DataValueField="ID"
                            TabIndex="24" SelectedValue='<%# Bind("EX_CURRENCY_TYPE_1") %>'>
                        </asp:DropDownList>
                        <MyTextbox:mytext ID="ExPercentage1_TextBox" ExtId="ExPercentage1_TextBox" IsPercentage="Yes" runat="server"
                            Text='<%# Bind("EX_PERCENTAGE_1") %>' Width="5ex" CssClass="textBoxNormalAlignRight"
                            AllowUserKey="int_Integer" TabIndex="25"></MyTextbox:mytext>
                        %
                    </td>
                    <td rowspan="3" colspan="2">
                        (Currency of Export)
                    </td>
                </tr>
                <tr>
                    <td>
                        Currency
                    </td>
                    <td>
                        <asp:DropDownList ID="ExCurrencyType2_DLL" ExtId="ExCurrencyType2_DLL" runat="server"
                            DataSourceID="Currency_SqlDS" DataTextField="DESCRIPTION" DataValueField="ID"
                            TabIndex="26" SelectedValue='<%# Bind("EX_CURRENCY_TYPE_2") %>'>
                        </asp:DropDownList>
                        <MyTextbox:mytext ID="ExPercentage2_TextBox" ExtId="ExPercentage2_TextBox" IsPercentage="Yes" runat="server"
                            Text='<%# Bind("EX_PERCENTAGE_2") %>' Width="5ex" CssClass="textBoxNormalAlignRight"
                            AllowUserKey="int_Integer" TabIndex="27"></MyTextbox:mytext>
                        %
                    </td>
                </tr>
                <tr>
                    <td>
                        Currency
                    </td>
                    <td>
                        <asp:DropDownList ID="ExCurrencyType3_DLL" ExtId="ExCurrencyType3_DLL" runat="server"
                            DataSourceID="Currency_SqlDS" DataTextField="DESCRIPTION" DataValueField="ID"
                            TabIndex="28" SelectedValue='<%# Bind("EX_CURRENCY_TYPE_3") %>'>
                        </asp:DropDownList>
                        <MyTextbox:mytext ID="ExPercentage3_TextBox" ExtId="ExPercentage3_TextBox" IsPercentage="Yes" runat="server"
                            Text='<%# Bind("EX_PERCENTAGE_3") %>' Width="5ex" CssClass="textBoxNormalAlignRight"
                            AllowUserKey="int_Integer" TabIndex="29"></MyTextbox:mytext>
                        %
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 20px; background-color: White;">
                    </td>
                </tr>
                <tr>
                    <td>
                        COGS
                    </td>
                    <td>
                        <MyTextbox:mytext ID="COGS_TextBox" ExtId="COGS_TextBox" IsNumeric="Yes" IsRequired="Yes" runat="server" Text='<%# Bind("COGS", "{0:#,##0.00}") %>'
                            Width="20ex" CssClass="textBoxNormalAlignRight" AllowUserKey="num_Numeric" AutoCurrencyFormatOnKeyUp="true" TabIndex="31"></MyTextbox:mytext>
                        Baht/YEAR
                    </td>
                    <td colspan="2">
                    </td>
                </tr>
                <tr>
                    <td>
                        COGS Local
                    </td>
                    <td>
                        <table width="100%" border="1" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width: 30%" colspan="2">
                                    <MyTextbox:mytext ID="COGSLocal_TextBox" ExtId="COGSLocal_TextBox" IsPercentage="Yes" IsRequired="Yes" runat="server" Text='<%# Bind("COGS_LOCAL") %>'
                                        Width="5ex" CssClass="textBoxNormalAlignRight" AllowUserKey="int_Integer" TabIndex="32"></MyTextbox:mytext>
                                    %
                                </td>
                                <td style="width: 40%">
                                    COGS Import
                                </td>
                                <td style="width: 30%">
                                    <MyTextbox:mytext ID="COGSImport_TextBox" ExtId="COGSImport_TextBox" IsPercentage="Yes" IsRequired="Yes" runat="server" Text='<%# Bind("COGS_IMPORT") %>'
                                        Width="5ex" CssClass="textBoxNormalAlignRight" AllowUserKey="int_Integer" TabIndex="33"></MyTextbox:mytext>
                                    %
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td colspan="2">
                        (% of imports to raw materials)
                    </td>
                </tr>
                <tr>
                    <td>
                        Currency
                    </td>
                    <td>
                        <asp:DropDownList ID="ImCurrencyType1_DLL" ExtId="ImCurrencyType1_DLL" runat="server"
                            DataSourceID="Currency_SqlDS" DataTextField="DESCRIPTION" DataValueField="ID"
                            TabIndex="34" SelectedValue='<%# Bind("IM_CURRENCY_TYPE_1") %>'>
                        </asp:DropDownList>
                        <MyTextbox:mytext ID="ImPercentage1_TextBox" ExtId="ImPercentage1_TextBox" IsPercentage="Yes" runat="server"
                            Text='<%# Bind("IM_PERCENTAGE_1") %>' Width="5ex" CssClass="textBoxNormalAlignRight"
                            AllowUserKey="int_Integer" TabIndex="35"></MyTextbox:mytext>
                        %
                    </td>
                    <td colspan="2" rowspan="3">
                        (Currency of Import)
                    </td>
                </tr>
                <tr>
                    <td>
                        Currency
                    </td>
                    <td>
                        <asp:DropDownList ID="ImCurrencyType2_DLL" ExtId="ImCurrencyType2_DLL" runat="server"
                            DataSourceID="Currency_SqlDS" DataTextField="DESCRIPTION" DataValueField="ID"
                            TabIndex="36" SelectedValue='<%# Bind("IM_CURRENCY_TYPE_2") %>'>
                        </asp:DropDownList>
                        <MyTextbox:mytext ID="ImPercentage2_TextBox" ExtId="ImPercentage2_TextBox" IsPercentage="Yes" runat="server"
                            Text='<%# Bind("IM_PERCENTAGE_2") %>' Width="5ex" CssClass="textBoxNormalAlignRight"
                            AllowUserKey="int_Integer" TabIndex="37"></MyTextbox:mytext>
                        %
                    </td>
                </tr>
                <tr>
                    <td>
                        Currency
                    </td>
                    <td>
                        <asp:DropDownList ID="ImCurrencyType3_DLL" ExtId="ImCurrencyType3_DLL" runat="server"
                            DataSourceID="Currency_SqlDS" DataTextField="DESCRIPTION" DataValueField="ID"
                            TabIndex="38" SelectedValue='<%# Bind("IM_CURRENCY_TYPE_3") %>'>
                        </asp:DropDownList>
                        <MyTextbox:mytext ID="ImPercentage3_TextBox" ExtId="ImPercentage3_TextBox" IsPercentage="Yes" runat="server"
                            Text='<%# Bind("IM_PERCENTAGE_3") %>' Width="5ex" CssClass="textBoxNormalAlignRight"
                            AllowUserKey="int_Integer" TabIndex="39"></MyTextbox:mytext>
                        %
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 20px; background-color: White;">
                    </td>
                </tr>
                <tr>
                    <td>
                        Gross Margin
                    </td>
                    <td>
                        <MyTextbox:mytext ID="GrossMargin_TextBox" ExtId="GrossMargin_TextBox" runat="server"
                            Text='<%# Bind("GROSS_MARGIN", "{0:#,##0.00}") %>' Width="20ex" CssClass="textBoxReadOnlyAlignRight"></MyTextbox:mytext>
                        Baht
                    </td>
                    <td colspan="2">
                        <MyTextbox:mytext ID="CalGrossMarginPercent_TextBox" ExtId="CalGrossMarginPercent_TextBox" IsPercentage="Yes"
                            runat="server" Width="6ex" CssClass="textBoxReadOnlyAlignRight"></MyTextbox:mytext>
                        %Gross Margin
                    </td>
                </tr>
                <tr>
                    <td>
                        SG&amp;A
                    </td>
                    <td>
                        <MyTextbox:mytext ID="SGA_TextBox" runat="server" ExtId="SGA_TextBox" IsNumeric="Yes" IsRequired="Yes" Text='<%# Bind("SG_AND_A", "{0:#,##0.00}") %>'
                            Width="20ex" CssClass="textBoxNormalAlignRight" AllowUserKey="num_Numeric" AutoCurrencyFormatOnKeyUp="true" TabIndex="41"></MyTextbox:mytext>
                        Baht
                    </td>
                    <td colspan="2">
                    </td>
                </tr>
                <tr>
                    <td>
                        Net Margin
                    </td>
                    <td>
                        <MyTextbox:mytext ID="NetMargin_TextBox" ExtId="NetMargin_TextBox" runat="server" Text='<%# Bind("NET_MARGIN", "{0:#,##0.00}") %>'
                            Width="20ex" CssClass="textBoxReadOnlyAlignRight"></MyTextbox:mytext>
                        Baht
                    </td>
                    <td colspan="2">
                        <MyTextbox:mytext ID="CalNetMarginPercent_TextBox" ExtId="CalNetMarginPercent_TextBox" IsPercentage="Yes"
                            runat="server" Width="6ex" CssClass="textBoxReadOnlyAlignRight"></MyTextbox:mytext>
                        %Net Margin
                    </td>
                </tr>
                <tr>
                    <td>
                        Pay Interest(All Bank)
                    </td>
                    <td>
                        <MyTextbox:mytext ID="PayInterest_TextBox" ExtId="PayInterest_TextBox" IsNumeric="Yes" IsRequired="Yes" runat="server"
                            Text='<%# Bind("PAY_INTEREST", "{0:#,##0.00}") %>' Width="20ex" CssClass="textBoxNormalAlignRight"
                            AllowUserKey="num_Numeric" AutoCurrencyFormatOnKeyUp="true" TabIndex="42"></MyTextbox:mytext>
                        Baht
                    </td>
                    <td colspan="2">
                        Remark
                    </td>
                </tr>
                <tr>
                    <td>
                        Pay Principal(All Bank)
                    </td>
                    <td>
                        <MyTextbox:mytext ID="PayPrincipal_TextBox" ExtId="PayPrincipal_TextBox" IsNumeric="Yes" IsRequired="Yes" runat="server"
                            Text='<%# Bind("PAY_PRINCIPAL", "{0:#,##0.00}") %>' Width="20ex" CssClass="textBoxNormalAlignRight"
                            AllowUserKey="num_Numeric" AutoCurrencyFormatOnKeyUp="true" TabIndex="43"></MyTextbox:mytext>
                        Baht
                    </td>
                    <td colspan="2" rowspan="2">
                        <asp:TextBox ID="Remark_TextBox" ExtId="Remark_TextBox" runat="server" TextMode="MultiLine"
                            Width="99%" CssClass="textBoxNormal" Text='<%# Bind("REMARK") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        DSCR
                    </td>
                    <td>
                        <MyTextbox:mytext ID="CalDSCR_TextBox" ExtId="CalDSCR_TextBox" IsNumeric="Yes" runat="server" Width="5ex"
                            CssClass="textBoxReadOnlyAlignRight"></MyTextbox:mytext>
                        Times
                    </td>
                </tr>
                <tr>
                    <td>
                        Update By
                    </td>
                    <td>
                        <asp:TextBox ID="UpdateBy_TextBox" ExtId="UpdateBy_TextBox" runat="server" Width="10ex"
                            CssClass="textBoxReadOnlyAlignRight"></asp:TextBox>
                        <asp:TextBox ID="UpdateName_TextBox" ExtId="UpdateName_TextBox" runat="server" Width="35ex"
                            CssClass="textBoxReadOnly"></asp:TextBox>
                    </td>
                    <td>
                        Update Date
                    </td>
                    <td>
                        <asp:TextBox ID="UpdateDate_TextBox" ExtId="UpdateDate_TextBox" runat="server" Width="20ex"
                            CssClass="textBoxReadOnly"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <asp:LinkButton ID="InsertButton" ExtId="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" ExtId="InsertCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" />
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            <table width="100%" border="1" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 20%">
                        CIF
                    </td>
                    <td>
                        <MyTextbox:mytext ID="CIF_TextBox" ExtId="CIF_TextBox" IsInteger="Yes" runat="server" Text='<%# Bind("CIF") %>'
                            Width="20ex" CssClass="textBoxReadOnlyAlignRight" AllowUserKey="int_Integer"></MyTextbox:mytext>
                    </td>
                    <td>
                        Total Limit
                    </td>
                    <td>
                        <MyTextbox:mytext ID="TotalLimit_TextBox" ExtId="TotalLimit_TextBox" IsNumeric="Yes" runat="server" Text='<%# Bind("TOTAL_LIMIT", "{0:#,##0.00}") %>'
                            Width="20ex" CssClass="textBoxReadOnlyAlignRight" AllowUserKey="num_Numeric" AutoCurrencyFormatOnKeyUp="true" TabIndex="11"></MyTextbox:mytext>
                        Baht
                    </td>
                </tr>
                <tr>
                    <td>
                        Name(Name of Exporter)
                    </td>
                    <td>
                        <asp:TextBox ID="Name_TextBox" ExtId="Name_TextBox" runat="server" Text='<%# Eval("Name") %>'
                            Width="45ex" CssClass="textBoxReadOnly"></asp:TextBox>
                    </td>
                    <td>
                        Total OS(<asp:Label ID="OS_ASOF_Label" ExtId="OS_ASOF_Label" runat="server" Text='<%# Eval("OS_AsOf", "{0:dd/MM/yy}") %>'></asp:Label>)
                    </td>
                    <td>
                        <MyTextbox:mytext ID="TotalOS_TextBox" ExtId="TotalOS_TextBox" runat="server" Text='<%# Bind("TOTAL_OS", "{0:#,##0.00}") %>'
                            Width="20ex" CssClass="textBoxReadOnlyAlignRight"></MyTextbox:mytext>
                        Baht
                    </td>
                </tr>
                <tr>
                    <td>
                        Goods(Type of Export)
                    </td>
                    <td>
                        <asp:TextBox ID="Business_TextBox" ExtId="Business_TextBox" runat="server" Text='<%# Eval("Business_1") %>'
                            Width="45ex" CssClass="textBoxReadOnly"></asp:TextBox>
                    </td>
                    <td>
                        Group Exposure
                    </td>
                    <td>
                        <MyTextbox:mytext ID="GroupExpo_TextBox" ExtId="GroupExpo_TextBox" IsNumeric="Yes" runat="server" Text='<%# Bind("GROUP_EXPOSURE", "{0:#,##0.00}") %>'
                            Width="20ex" CssClass="textBoxReadOnlyAlignRight" AllowUserKey="num_Numeric" AutoCurrencyFormatOnKeyUp="true" TabIndex="12"></MyTextbox:mytext>
                        Baht
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <table width="100%" border="1" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width: 20%">
                                    Export to<br />
                                    (Country Exported to)
                                </td>
                                <td>
                                    <asp:DropDownList ID="ExportTo1_DDL" ExtId="ExportTo1_DDL" runat="server" DataSourceID="Country_SqlDS"
                                        DataTextField="DESCRIPTION" DataValueField="ID" TabIndex="13" 
                                        SelectedValue='<%# Bind("EXPORT_TO_1") %>' Enabled="false">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ExportTo2_DDL" ExtId="ExportTo2_DDL" runat="server" DataSourceID="Country_SqlDS"
                                        DataTextField="DESCRIPTION" DataValueField="ID" TabIndex="14" 
                                        SelectedValue='<%# Bind("EXPORT_TO_2") %>' Enabled="false">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ExportTo3_DDL" ExtId="ExportTo3_DDL" runat="server" DataSourceID="Country_SqlDS"
                                        DataTextField="DESCRIPTION" DataValueField="ID" TabIndex="15" 
                                        SelectedValue='<%# Bind("EXPORT_TO_3") %>' Enabled="false">
                                    </asp:DropDownList>
                                </td>
                                <td colspan="4">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 20px; background-color: White;">
                    </td>
                </tr>
                <tr>
                    <td>
                        Revenue
                    </td>
                    <td>
                        <MyTextbox:mytext ID="Revenue_TextBox" ExtId="Revenue_TextBox" IsNumeric="Yes" runat="server" Text='<%# Bind("REVENUE", "{0:#,##0.00}") %>'
                            Width="20ex" CssClass="textBoxReadOnlyAlignRight" AllowUserKey="num_Numeric" AutoCurrencyFormatOnKeyUp="true" TabIndex="21"></MyTextbox:mytext>
                        Baht/YEAR
                    </td>
                    <td colspan="2" rowspan="2">
                    </td>
                </tr>
                <tr>
                    <td>
                        Revenue Local
                    </td>
                    <td>
                        <table width="100%" border="1" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width: 30%" colspan="2">
                                    <MyTextbox:mytext ID="RevenueLocal_TextBox" ExtId="RevenueLocal_TextBox" IsPercentage="Yes" runat="server"
                                        Text='<%# Bind("REVENUE_LOCAL") %>' Width="5ex" CssClass="textBoxReadOnlyAlignRight"
                                         AllowUserKey="int_Integer" TabIndex="22"></MyTextbox:mytext>
                                    %
                                </td>
                                <td style="width: 40%">
                                    Revenue Export
                                </td>
                                <td style="width: 30%">
                                    <MyTextbox:mytext ID="RevenueExport_TextBox" ExtId="RevenueExport_TextBox" IsPercentage="Yes" runat="server"
                                        Text='<%# Bind("REVENUE_EXPORT") %>' Width="5ex" CssClass="textBoxReadOnlyAlignRight"
                                        AllowUserKey="int_Integer" TabIndex="23"></MyTextbox:mytext>
                                    %
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        Currency
                    </td>
                    <td>
                        <asp:DropDownList ID="ExCurrencyType1_DLL" ExtId="ExCurrencyType1_DLL" runat="server"
                            DataSourceID="Currency_SqlDS" DataTextField="DESCRIPTION" DataValueField="ID"
                            TabIndex="24" SelectedValue='<%# Bind("EX_CURRENCY_TYPE_1") %>' Enabled="false">
                        </asp:DropDownList>
                        <MyTextbox:mytext ID="ExPercentage1_TextBox" ExtId="ExPercentage1_TextBox" IsPercentage="Yes" runat="server"
                            Text='<%# Bind("EX_PERCENTAGE_1") %>' Width="5ex" CssClass="textBoxReadOnlyAlignRight"
                            AllowUserKey="int_Integer" TabIndex="25"></MyTextbox:mytext>
                        %
                    </td>
                    <td rowspan="3" colspan="2">
                        (Currency of Export)
                    </td>
                </tr>
                <tr>
                    <td>
                        Currency
                    </td>
                    <td>
                        <asp:DropDownList ID="ExCurrencyType2_DLL" ExtId="ExCurrencyType2_DLL" runat="server"
                            DataSourceID="Currency_SqlDS" DataTextField="DESCRIPTION" DataValueField="ID"
                            TabIndex="26" SelectedValue='<%# Bind("EX_CURRENCY_TYPE_2") %>' Enabled="false">
                        </asp:DropDownList>
                        <MyTextbox:mytext ID="ExPercentage2_TextBox" ExtId="ExPercentage2_TextBox" IsPercentage="Yes" runat="server"
                            Text='<%# Bind("EX_PERCENTAGE_2") %>' Width="5ex" CssClass="textBoxReadOnlyAlignRight"
                            AllowUserKey="int_Integer" TabIndex="27"></MyTextbox:mytext>
                        %
                    </td>
                </tr>
                <tr>
                    <td>
                        Currency
                    </td>
                    <td>
                        <asp:DropDownList ID="ExCurrencyType3_DLL" ExtId="ExCurrencyType3_DLL" runat="server"
                            DataSourceID="Currency_SqlDS" DataTextField="DESCRIPTION" DataValueField="ID"
                            TabIndex="28" SelectedValue='<%# Bind("EX_CURRENCY_TYPE_3") %>' Enabled="false">
                        </asp:DropDownList>
                        <MyTextbox:mytext ID="ExPercentage3_TextBox" ExtId="ExPercentage3_TextBox" IsPercentage="Yes" runat="server"
                            Text='<%# Bind("EX_PERCENTAGE_3") %>' Width="5ex" CssClass="textBoxReadOnlyAlignRight"
                            AllowUserKey="int_Integer" TabIndex="29"></MyTextbox:mytext>
                        %
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 20px; background-color: White;">
                    </td>
                </tr>
                <tr>
                    <td>
                        COGS
                    </td>
                    <td>
                        <MyTextbox:mytext ID="COGS_TextBox" ExtId="COGS_TextBox" IsNumeric="Yes" runat="server" Text='<%# Bind("COGS", "{0:#,##0.00}") %>'
                            Width="20ex" CssClass="textBoxReadOnlyAlignRight" AllowUserKey="num_Numeric" AutoCurrencyFormatOnKeyUp="true" TabIndex="31"></MyTextbox:mytext>
                        Baht/YEAR
                    </td>
                    <td colspan="2">
                    </td>
                </tr>
                <tr>
                    <td>
                        COGS Local
                    </td>
                    <td>
                        <table width="100%" border="1" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width: 30%" colspan="2">
                                    <MyTextbox:mytext ID="COGSLocal_TextBox" ExtId="COGSLocal_TextBox" IsPercentage="Yes" runat="server" Text='<%# Bind("COGS_LOCAL") %>'
                                        Width="5ex" CssClass="textBoxReadOnlyAlignRight" AllowUserKey="int_Integer" TabIndex="32"></MyTextbox:mytext>
                                    %
                                </td>
                                <td style="width: 40%">
                                    COGS Import
                                </td>
                                <td style="width: 30%">
                                    <MyTextbox:mytext ID="COGSImport_TextBox" ExtId="COGSImport_TextBox" IsPercentage="Yes" runat="server" Text='<%# Bind("COGS_IMPORT") %>'
                                        Width="5ex" CssClass="textBoxReadOnlyAlignRight" AllowUserKey="int_Integer" TabIndex="33"></MyTextbox:mytext>
                                    %
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td colspan="2">
                        (% of imports to raw materials)
                    </td>
                </tr>
                <tr>
                    <td>
                        Currency
                    </td>
                    <td>
                        <asp:DropDownList ID="ImCurrencyType1_DLL" ExtId="ImCurrencyType1_DLL" runat="server"
                            DataSourceID="Currency_SqlDS" DataTextField="DESCRIPTION" DataValueField="ID"
                            TabIndex="34" SelectedValue='<%# Bind("IM_CURRENCY_TYPE_1") %>' Enabled="false">
                        </asp:DropDownList>
                        <MyTextbox:mytext ID="ImPercentage1_TextBox" ExtId="ImPercentage1_TextBox" IsPercentage="Yes" runat="server"
                            Text='<%# Bind("IM_PERCENTAGE_1") %>' Width="5ex" CssClass="textBoxReadOnlyAlignRight"
                            AllowUserKey="int_Integer" TabIndex="35"></MyTextbox:mytext>
                        %
                    </td>
                    <td colspan="2" rowspan="3">
                        (Currency of Import)
                    </td>
                </tr>
                <tr>
                    <td>
                        Currency
                    </td>
                    <td>
                        <asp:DropDownList ID="ImCurrencyType2_DLL" ExtId="ImCurrencyType2_DLL" runat="server"
                            DataSourceID="Currency_SqlDS" DataTextField="DESCRIPTION" DataValueField="ID"
                            TabIndex="36" SelectedValue='<%# Bind("IM_CURRENCY_TYPE_2") %>' Enabled="false">
                        </asp:DropDownList>
                        <MyTextbox:mytext ID="ImPercentage2_TextBox" ExtId="ImPercentage2_TextBox" IsPercentage="Yes" runat="server"
                            Text='<%# Bind("IM_PERCENTAGE_2") %>' Width="5ex" CssClass="textBoxReadOnlyAlignRight"
                            AllowUserKey="int_Integer" TabIndex="37"></MyTextbox:mytext>
                        %
                    </td>
                </tr>
                <tr>
                    <td>
                        Currency
                    </td>
                    <td>
                        <asp:DropDownList ID="ImCurrencyType3_DLL" ExtId="ImCurrencyType3_DLL" runat="server"
                            DataSourceID="Currency_SqlDS" DataTextField="DESCRIPTION" DataValueField="ID"
                            TabIndex="38" SelectedValue='<%# Bind("IM_CURRENCY_TYPE_3") %>' Enabled="false">
                        </asp:DropDownList>
                        <MyTextbox:mytext ID="ImPercentage3_TextBox" ExtId="ImPercentage3_TextBox" IsPercentage="Yes" runat="server"
                            Text='<%# Bind("IM_PERCENTAGE_3") %>' Width="5ex" CssClass="textBoxReadOnlyAlignRight"
                            AllowUserKey="int_Integer" TabIndex="39"></MyTextbox:mytext>
                        %
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 20px; background-color: White;">
                    </td>
                </tr>
                <tr>
                    <td>
                        Gross Margin
                    </td>
                    <td>
                        <MyTextbox:mytext ID="GrossMargin_TextBox" ExtId="GrossMargin_TextBox" runat="server"
                            Text='<%# Bind("GROSS_MARGIN", "{0:#,##0.00}") %>' Width="20ex" CssClass="textBoxReadOnlyAlignRight"></MyTextbox:mytext>
                        Baht
                    </td>
                    <td colspan="2">
                        <MyTextbox:mytext ID="CalGrossMarginPercent_TextBox" ExtId="CalGrossMarginPercent_TextBox" IsPercentage="Yes"
                            runat="server" Width="6ex" CssClass="textBoxReadOnlyAlignRight"
                            Text='<%# Eval("GROSS_PERCENT", "{0:#,##0.00}") %>'></MyTextbox:mytext>
                        %Gross Margin
                    </td>
                </tr>
                <tr>
                    <td>
                        SG&amp;A
                    </td>
                    <td>
                        <MyTextbox:mytext ID="SGA_TextBox" runat="server" ExtId="SGA_TextBox" IsNumeric="Yes" Text='<%# Bind("SG_AND_A", "{0:#,##0.00}") %>'
                            Width="20ex" CssClass="textBoxReadOnlyAlignRight" AllowUserKey="num_Numeric" AutoCurrencyFormatOnKeyUp="true" TabIndex="41"></MyTextbox:mytext>
                        Baht
                    </td>
                    <td colspan="2">
                    </td>
                </tr>
                <tr>
                    <td>
                        Net Margin
                    </td>
                    <td>
                        <MyTextbox:mytext ID="NetMargin_TextBox" ExtId="NetMargin_TextBox" runat="server" Text='<%# Bind("NET_MARGIN", "{0:#,##0.00}") %>'
                            Width="20ex" CssClass="textBoxReadOnlyAlignRight"></MyTextbox:mytext>
                        Baht
                    </td>
                    <td colspan="2">
                        <MyTextbox:mytext ID="CalNetMarginPercent_TextBox" ExtId="CalNetMarginPercent_TextBox" IsPercentage="Yes"
                            runat="server" Width="6ex" CssClass="textBoxReadOnlyAlignRight"
                            Text='<%# Eval("NET_PERCENT", "{0:#,##0.00}") %>'></MyTextbox:mytext>
                        %Net Margin
                    </td>
                </tr>
                <tr>
                    <td>
                        Pay Interest(All Bank)
                    </td>
                    <td>
                        <MyTextbox:mytext ID="PayInterest_TextBox" ExtId="PayInterest_TextBox" IsNumeric="Yes" runat="server"
                            Text='<%# Bind("PAY_INTEREST", "{0:#,##0.00}") %>' Width="20ex" CssClass="textBoxReadOnlyAlignRight"
                            AllowUserKey="num_Numeric" AutoCurrencyFormatOnKeyUp="true" TabIndex="42"></MyTextbox:mytext>
                        Baht
                    </td>
                    <td colspan="2">
                        Remark
                    </td>
                </tr>
                <tr>
                    <td>
                        Pay Principal(All Bank)
                    </td>
                    <td>
                        <MyTextbox:mytext ID="PayPrincipal_TextBox" ExtId="PayPrincipal_TextBox" IsNumeric="Yes" runat="server"
                            Text='<%# Bind("PAY_PRINCIPAL", "{0:#,##0.00}") %>' Width="20ex" CssClass="textBoxReadOnlyAlignRight"
                            AllowUserKey="num_Numeric" AutoCurrencyFormatOnKeyUp="true" TabIndex="43"></MyTextbox:mytext>
                        Baht
                    </td>
                    <td colspan="2" rowspan="2">
                        <asp:TextBox ID="Remark_TextBox" ExtId="Remark_TextBox" runat="server" TextMode="MultiLine"
                            Width="99%" CssClass="textBoxReadOnly" Text='<%# Eval("REMARK") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        DSCR
                    </td>
                    <td>
                        <MyTextbox:mytext ID="CalDSCR_TextBox" ExtId="CalDSCR_TextBox" IsNumeric="Yes" runat="server" Width="5ex"
                            CssClass="textBoxReadOnlyAlignRight"
                            Text='<%# Eval("DSCR", "{0:#,##0.00}") %>'></MyTextbox:mytext>
                        Times
                    </td>
                </tr>
                <tr>
                    <td>
                        Update By
                    </td>
                    <td>
                        <asp:TextBox ID="UpdateBy_TextBox" ExtId="UpdateBy_TextBox" runat="server" Width="10ex"
                            CssClass="textBoxReadOnlyAlignRight"
                            Text='<%# Eval("UPDATE_BY") %>'></asp:TextBox>
                        <asp:TextBox ID="UpdateName_TextBox" ExtId="UpdateName_TextBox" runat="server" Width="35ex"
                            CssClass="textBoxReadOnly"
                            Text='<%# Eval("UPDATE_NAME") %>'></asp:TextBox>
                    </td>
                    <td>
                        Update Date
                    </td>
                    <td>
                        <asp:TextBox ID="UpdateDate_TextBox" ExtId="UpdateDate_TextBox" runat="server" Width="20ex"
                            CssClass="textBoxReadOnly"
                            Text='<%# Eval("UPDATE_DATE") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <asp:LinkButton ID="EditButton" ExtId="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" ExtId="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete" />
                        <%--&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="New" />--%>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    </asp:FormView>
    <asp:SqlDataSource ID="Exporter_SqlDS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
        SelectCommand="P_GET_EXPORTER_DETAIL_BY_CIF" 
        SelectCommandType="StoredProcedure" InsertCommand="P_INSERT_EXPORTER_DETAIL" 
        InsertCommandType="StoredProcedure" 
        UpdateCommand="P_UPDATE_EXPORTER_DETAIL" 
        UpdateCommandType="StoredProcedure" 
        DeleteCommand="P_DELETE_EXPORTER_DETAIL_BY_CIF" 
        DeleteCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="CIF" QueryStringField="cif" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="CIF" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="CIF" Type="Int32" />
            <asp:Parameter Name="TOTAL_LIMIT" Type="Decimal" />
            <asp:Parameter Name="TOTAL_OS" Type="Decimal" />
            <asp:Parameter Name="GROUP_EXPOSURE" Type="Decimal" />
            <asp:Parameter Name="REVENUE" Type="Decimal" />
            <asp:Parameter Name="REVENUE_EXPORT" Type="Decimal" />
            <asp:Parameter Name="REVENUE_LOCAL" Type="Decimal" />
            <asp:Parameter Name="COGS" Type="Decimal" />
            <asp:Parameter Name="COGS_IMPORT" Type="Decimal" />
            <asp:Parameter Name="COGS_LOCAL" Type="Decimal" />
            <asp:Parameter Name="GROSS_MARGIN" Type="Decimal" />
            <asp:Parameter Name="SG_AND_A" Type="Decimal" />
            <asp:Parameter Name="NET_MARGIN" Type="Decimal" />
            <asp:Parameter Name="PAY_INTEREST" Type="Decimal" />
            <asp:Parameter Name="PAY_PRINCIPAL" Type="Decimal" />
            <asp:Parameter Name="UPDATE_BY" Type="String" />
            <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
            <asp:Parameter Name="EXPORT_TO_1" Type="Int32" />
            <asp:Parameter Name="EX_CURRENCY_TYPE_1" Type="Int32" />
            <asp:Parameter Name="EX_PERCENTAGE_1" Type="Decimal" />
            <asp:Parameter Name="EXPORT_TO_2" Type="Int32" />
            <asp:Parameter Name="EX_CURRENCY_TYPE_2" Type="Int32" />
            <asp:Parameter Name="EX_PERCENTAGE_2" Type="Decimal" />
            <asp:Parameter Name="EXPORT_TO_3" Type="Int32" />
            <asp:Parameter Name="EX_CURRENCY_TYPE_3" Type="Int32" />
            <asp:Parameter Name="EX_PERCENTAGE_3" Type="Decimal" />
            <asp:Parameter Name="IM_CURRENCY_TYPE_1" Type="Int32" />
            <asp:Parameter Name="IM_PERCENTAGE_1" Type="Decimal" />
            <asp:Parameter Name="IM_CURRENCY_TYPE_2" Type="Int32" />
            <asp:Parameter Name="IM_PERCENTAGE_2" Type="Decimal" />
            <asp:Parameter Name="IM_CURRENCY_TYPE_3" Type="Int32" />
            <asp:Parameter Name="IM_PERCENTAGE_3" Type="Decimal" />
            <asp:Parameter Name="REMARK" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="CIF" Type="Int32" />
            <asp:Parameter Name="TOTAL_LIMIT" Type="Decimal" />
            <asp:Parameter Name="TOTAL_OS" Type="Decimal" />
            <asp:Parameter Name="GROUP_EXPOSURE" Type="Decimal" />
            <asp:Parameter Name="REVENUE" Type="Decimal" />
            <asp:Parameter Name="REVENUE_EXPORT" Type="Decimal" />
            <asp:Parameter Name="REVENUE_LOCAL" Type="Decimal" />
            <asp:Parameter Name="COGS" Type="Decimal" />
            <asp:Parameter Name="COGS_IMPORT" Type="Decimal" />
            <asp:Parameter Name="COGS_LOCAL" Type="Decimal" />
            <asp:Parameter Name="GROSS_MARGIN" Type="Decimal" />
            <asp:Parameter Name="SG_AND_A" Type="Decimal" />
            <asp:Parameter Name="NET_MARGIN" Type="Decimal" />
            <asp:Parameter Name="PAY_INTEREST" Type="Decimal" />
            <asp:Parameter Name="PAY_PRINCIPAL" Type="Decimal" />
            <asp:Parameter Name="UPDATE_BY" Type="String" />
            <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
            <asp:Parameter Name="EXPORT_TO_1" Type="Int32" />
            <asp:Parameter Name="EX_CURRENCY_TYPE_1" Type="Int32" />
            <asp:Parameter Name="EX_PERCENTAGE_1" Type="Decimal" />
            <asp:Parameter Name="EXPORT_TO_2" Type="Int32" />
            <asp:Parameter Name="EX_CURRENCY_TYPE_2" Type="Int32" />
            <asp:Parameter Name="EX_PERCENTAGE_2" Type="Decimal" />
            <asp:Parameter Name="EXPORT_TO_3" Type="Int32" />
            <asp:Parameter Name="EX_CURRENCY_TYPE_3" Type="Int32" />
            <asp:Parameter Name="EX_PERCENTAGE_3" Type="Decimal" />
            <asp:Parameter Name="IM_CURRENCY_TYPE_1" Type="Int32" />
            <asp:Parameter Name="IM_PERCENTAGE_1" Type="Decimal" />
            <asp:Parameter Name="IM_CURRENCY_TYPE_2" Type="Int32" />
            <asp:Parameter Name="IM_PERCENTAGE_2" Type="Decimal" />
            <asp:Parameter Name="IM_CURRENCY_TYPE_3" Type="Int32" />
            <asp:Parameter Name="IM_PERCENTAGE_3" Type="Decimal" />
            <asp:Parameter Name="REMARK" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Country_SqlDS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
        SelectCommand="SELECT ID, DESCRIPTION FROM EXPORTER_LOOKUP WHERE (LOOKUP_TYPE = 2) AND (ISNULL(DEL_FLAG, 0) &lt;&gt; 1) ORDER BY PRIORITY">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Currency_SqlDS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
        SelectCommand="SELECT     ID, DESCRIPTION
FROM         EXPORTER_LOOKUP
WHERE     (LOOKUP_TYPE = 3) AND (ISNULL(DEL_FLAG, 0) &lt;&gt; 1)
ORDER BY PRIORITY"></asp:SqlDataSource>
</asp:Content>

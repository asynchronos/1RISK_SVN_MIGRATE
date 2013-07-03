<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="RiskRatingProgress.aspx.vb" Inherits="aspx_follow_RiskRatingProgress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Filter -->
    <link rel="stylesheet" type="text/css" href="../../js/ext-4.2.0.663/examples/ux/grid/css/GridFilters.css" />
    <link rel="stylesheet" type="text/css" href="../../js/ext-4.2.0.663/examples/ux/grid/css/RangeMenu.css" />
    <!-- GC -->
    <script src="../../js/ext-4.2.0.663/examples/ux/ajax/DataSimlet.js" type="text/javascript"></script>
    <script src="../../js/ext-4.2.0.663/examples/ux/ajax/SimXhr.js" type="text/javascript"></script>
    <script src="../../js/ext-4.2.0.663/examples/ux/ajax/JsonSimlet.js" type="text/javascript"></script>
    <script src="../../js/ext-4.2.0.663/examples/ux/ajax/Simlet.js" type="text/javascript"></script>
    <script src="../../js/ext-4.2.0.663/examples/ux/ajax/SimManager.js" type="text/javascript"></script>
    <script src="../../js/ext-4.2.0.663/examples/ux/grid/menu/RangeMenu.js" type="text/javascript"></script>
    <script src="../../js/ext-4.2.0.663/examples/ux/grid/menu/ListMenu.js" type="text/javascript"></script>
    <script src="../../js/ext-4.2.0.663/examples/ux/grid/filter/Filter.js" type="text/javascript"></script>
    <script src="../../js/ext-4.2.0.663/examples/ux/grid/filter/BooleanFilter.js" type="text/javascript"></script>
    <script src="../../js/ext-4.2.0.663/examples/ux/grid/filter/DateFilter.js" type="text/javascript"></script>
    <script src="../../js/ext-4.2.0.663/examples/ux/grid/filter/DateTimeFilter.js" type="text/javascript"></script>
    <script src="../../js/ext-4.2.0.663/examples/ux/grid/filter/ListFilter.js" type="text/javascript"></script>
    <script src="../../js/ext-4.2.0.663/examples/ux/grid/filter/NumericFilter.js" type="text/javascript"></script>
    <script src="../../js/ext-4.2.0.663/examples/ux/grid/filter/StringFilter.js" type="text/javascript"></script>
    <script src="../../js/ext-4.2.0.663/examples/ux/grid/FiltersFeature.js" type="text/javascript" ></script>
    <script src="RiskRatingProgress.js" type="text/javascript"></script>

    <script>
        Ext.onReady(function () {
            Ext.QuickTips.init();

            function formatDate(value) {
                return value ? Ext.Date.dateFormat(value, 'd M Y') : '';
            }

            // create the Data Store
            var statusStore = Ext.create('Ext.data.JsonStore', {
                // destroy the store if the grid is destroyed
                //autoDestroy: true,
                //autoLoad: true,
                model: IssuesStatusModel,
                proxy: {
                    type: 'ajax',
                    // load remote data using HTTP
                    url: appPath + 'webservice/RRPService.svc/GetStatusMasterAllJson',
                    reader: {
                        type: 'json',
                        idProperty: 'UPDATE_STATUS_KEY'
                    }
                }
            });

            var statusArray = [];
            statusStore.load({
                // store loading is asynchronous, use a load listener or callback to handle results
                callback: function (records, operation, success) {
                    var record = records[0];
                    var msgVar;
                    var iconVar;

                    if (success) {
                        if (undefined !== record.getId()) {
                            msgVar = 'Status list was loaded, Data available for processing';
                            iconVar = Ext.Msg.INFO;

                            //statusArray = records;

                            statusStore.each(function (record) {
                                var recordArray = [
                                    record.get("UPDATE_STATUS_DESC"),
                                    record.get("UPDATE_STATUS_DESC")
                                ];
                                statusArray.push(recordArray);
                            });
                        } else {
                            msgVar = 'Service load but no response.';
                            iconVar = Ext.Msg.ERROR;
                        }
                    } else {
                        msgVar = 'Service Fail<br/>';
                        iconVar = Ext.Msg.ERROR;
                    }

                    /*
                    Ext.Msg.show({
                    title: 'Employee List Progress',
                    msg: msgVar,
                    modal: true,
                    icon: iconVar,
                    buttons: Ext.Msg.OK
                    });
                    */
                }
            });

            var gridProxy = {
                type: 'ajax',
                // load remote data using HTTP
                url: appPath + 'webservice/RRPService.svc/GetIssuesAllJson',
                reader: {
                    type: 'json',
                    idProperty: 'IDEN_KEY'
                },
                model: 'IssuesModel'
                //extraParams: { 'idenKey': 1 }
            };

            var issuesStore = Ext.create('Ext.data.JsonStore', {
                // destroy the store if the grid is destroyed
                //autoDestroy: true,
                //autoLoad: true,
                model: IssuesModel,
                proxy: gridProxy
            });

            // configure whether filter query is encoded or not (initially)
            var encode = false;
            // configure whether filtering is performed locally or remotely (initially)
            var local = true;

            var filters = {
                ftype: 'filters',   // defaults to false (remote filtering)
                autoReload: false,
                // encode and local configuration options defined previously for easier reuse
                encode: encode, // json encode the filter query
                local: local,

                // Filters are most naturally placed in the column definition, but can also be
                // added here.
                filters: [{
                    type: 'numeric',
                    dataIndex: 'IDEN_KEY'
                }, {
                    type: 'string',
                    dataIndex: 'MANAGER_NAME'
                }, {
                    type: 'string',
                    dataIndex: 'HEAD_NAME'
                }, {
                    type: 'string',
                    dataIndex: 'CM_NAME'
                }]
            };

            var cellEditing = Ext.create('Ext.grid.plugin.CellEditing', {
                clicksToEdit: 1
            });
            // create the grid and specify what field you want
            // to use for the editor at each header.
            var grid = Ext.create('Ext.grid.Panel', {
                store: issuesStore,
                selModel: {
                    selType: 'cellmodel'
                },
                renderTo: 'editor-grid',
                width: 1300,
                height: 400,
                title: 'Rating Issues Follow',
                frame: true,
                //        tbar: [{
                //            text: 'Add Plant',
                //            handler: function () {
                //                // Create a model instance
                //                var r = Ext.create('Plant', {
                //                    common: 'New Plant 1',
                //                    light: 'Mostly Shady',
                //                    price: 0,
                //                    availDate: Ext.Date.clearTime(new Date()),
                //                    indoor: false
                //                });
                //                store.insert(0, r);
                //                cellEditing.startEditByPosition({ row: 0, column: 0 });
                //            }
                //        }],
                plugins: [cellEditing],
                features: [filters],

                columns: [{
                    header: 'ID',
                    dataIndex: 'IDEN_KEY',
                    locked: true,
                    width: 20,
                    sortable: false,
                    //            filter: {
                    //                type: 'numeric'
                    //                // specify disabled to disable the filter menu
                    //                //, disabled: true
                    //            },
                    flex: 1
                }, {
                    header: 'CIF',
                    dataIndex: 'CIF',
                    locked: true,
                    width: 70,
                    sortable: false,
                    filter: {
                        type: 'numeric'
                        // specify disabled to disable the filter menu
                        //, disabled: true
                    }
                }, {
                    header: 'NAME',
                    dataIndex: 'NAME',
                    locked: true,
                    width: 180,
                    sortable: false,
                    filter: {
                        type: 'string'
                        // specify disabled to disable the filter menu
                        //, disabled: true
                    }
                }, {
                    header: 'REVIEW_OFFICER_ID',
                    dataIndex: 'REVIEW_OFFICER_ID',
                    hidden: true,
                    width: 50
                }, {
                    header: 'REVIEW_OFFICER_NAME',
                    dataIndex: 'REVIEW_OFFICER_NAME',
                    hidden: true,
                    width: 50
                }, {
                    header: 'INCORRECT_ISSUES',
                    dataIndex: 'INCORRECT_ISSUES',
                    width: 300,
                    editor: {
                        allowBlank: true
                    },
                    filter: {
                        type: 'string'
                        // specify disabled to disable the filter menu
                        //, disabled: true
                    }
                }, {
                    header: 'PROGRESS',
                    dataIndex: 'PROGRESS',
                    locked: true,
                    width: 250,
                    editor: {
                        allowBlank: true
                    },
                    filter: {
                        type: 'string'
                        // specify disabled to disable the filter menu
                        //, disabled: true
                    }
                }, {
                    header: 'REVIEWED_DATE',
                    dataIndex: 'REVIEWED_DATE',
                    width: 95,
                    renderer: Ext.util.Format.dateRenderer('d/m/Y H:i:s'),
                    filter: {
                        type: 'date'
                    }
                    //                    editor: {
                    //                        xtype: 'datefield',
                    //                        format: 'd/m/Y',
                    //                        minValue: '01/01/2013',
                    //                        disabledDays: [0, 6],
                    //                        disabledDaysText: 'Plants are not available on the weekends'
                    //                    }
                }, {
                    header: 'DUE_DATE',
                    dataIndex: 'DUE_DATE',
                    width: 95,
                    renderer: Ext.util.Format.dateRenderer('d/m/Y H:i:s'),
                    filter: {
                        type: 'date'
                    }
                    //                    editor: {
                    //                        xtype: 'datefield',
                    //                        format: 'd/m/Y',
                    //                        minValue: '01/01/2013',
                    //                        disabledDays: [0, 6],
                    //                        disabledDaysText: 'Plants are not available on the weekends'
                    //                    }
                }, {
                    header: 'MANAGER_ID',
                    dataIndex: 'MANAGER_ID',
                    width: 50
                }, {
                    header: 'MANAGER_NAME',
                    dataIndex: 'MANAGER_NAME',
                    width: 50
                }, {
                    header: 'HEAD_ID',
                    dataIndex: 'HEAD_ID',
                    width: 50
                }, {
                    header: 'HEAD_NAME',
                    dataIndex: 'HEAD_NAME',
                    width: 50
                }, {
                    header: 'CM_ID',
                    dataIndex: 'CM_ID',
                    width: 50
                }, {
                    header: 'CM_NAME',
                    dataIndex: 'CM_NAME',
                    width: 50
                }, {
                    header: 'RM',
                    dataIndex: 'RM',
                    hidden: true,
                    width: 50
                }, {
                    header: 'RM_NAME',
                    dataIndex: 'RM_NAME',
                    hidden: true,
                    width: 50
                }, {
                    header: 'UPDATE_STATUS_DESC',
                    dataIndex: 'UPDATE_STATUS_DESC',
                    width: 190,
                    locked: true,
                    filter: {
                        type: 'list',
                        options: statusArray
                    },
                    editor: new Ext.form.field.ComboBox({
                        typeAhead: true,
                        triggerAction: 'all',
                        selectOnTab: true,
                        store: statusStore,
                        lazyRender: true,
                        listClass: 'x-combo-list-small',
                        displayField: 'UPDATE_STATUS_DESC',
                        valueField: 'UPDATE_STATUS_DESC',
                        getSelectedFieldValues: function (nameIn, nameOut) {
                            try {
                                var index = this.getStore().find(nameIn, this.getValue());
                                return this.getStore().getAt(index).get(nameOut);
                            }
                            catch (err) {
                                return 'error';
                            }
                        },
                        listeners: {
                            change: function (thisCombo, newValue, oldValue, eOpts) {
                                grid.getSelectionModel().getLastSelected().data.UPDATE_STATUS_KEY = thisCombo.getSelectedFieldValues('UPDATE_STATUS_DESC', 'UPDATE_STATUS_KEY');
                                //grid.getSelectionModel().getLastSelected().data.UPDATE_STATUS_DESC = thisCombo.getSelectedFieldValues('UPDATE_STATUS_KEY', 'UPDATE_STATUS_DESC');
                            }
                        }
                    })
                }, {
                    header: 'UPDATE_USER',
                    dataIndex: 'UPDATE_USER',
                    locked: true,
                    width: 80
                }, {
                    header: 'UPDATE_DATE',
                    dataIndex: 'UPDATE_DATE',
                    width: 95,
                    locked: true,
                    renderer: Ext.util.Format.dateRenderer('d/m/Y H:i:s'),
                    filter: {
                        type: 'date'
                    }
                    //                    ,
                    //                    editor: {
                    //                        xtype: 'datefield',
                    //                        format: 'd/m/Y',
                    //                        minValue: '01/01/2013',
                    //                        disabledDays: [0, 6],
                    //                        disabledDaysText: 'Plants are not available on the weekends'
                    //                    }
                }, {
                    header: 'CREATE_DATE',
                    dataIndex: 'CREATE_DATE',
                    width: 95,
                    renderer: Ext.util.Format.dateRenderer('d/m/Y H:i:s')
                    //                    ,
                    //                    editor: {
                    //                        xtype: 'datefield',
                    //                        format: 'd/m/Y',
                    //                        minValue: '01/01/2013',
                    //                        disabledDays: [0, 6],
                    //                        disabledDaysText: 'Plants are not available on the weekends'
                    //                    }
                }, {
                    header: 'ETL_DATE',
                    dataIndex: 'ETL_DATE',
                    width: 95,
                    renderer: Ext.util.Format.dateRenderer('d/m/Y H:i:s')
                    //                    ,
                    //                    editor: {
                    //                        xtype: 'datefield',
                    //                        format: 'd/m/Y',
                    //                        minValue: '01/01/2013',
                    //                        disabledDays: [0, 6],
                    //                        disabledDaysText: 'Plants are not available on the weekends'
                    //                    }
                }, {
                    header: 'ETL_SOURCE_FILE',
                    dataIndex: 'ETL_SOURCE_FILE',
                    width: 100
                }, {
                    header: 'ATTACH_FILE_PATH',
                    dataIndex: 'ATTACH_FILE_PATH',
                    hidden: true,
                    width: 100
                }, {
                    header: 'ATTACH_FILE_NAME',
                    dataIndex: 'ATTACH_FILE_NAME',
                    //locked: true,
                    width: 120,
                    editor: {
                        allowBlank: true
                    }
                }, {
                    xtype: 'checkcolumn',
                    header: 'Delete?',
                    dataIndex: 'DEL_FLAG',
                    width: 50,
                    mode: 'local',
                    filter: {
                        type: 'boolean',
                        dataIndex: 'DEL_FLAG'
                    }
                }, {
                    xtype: 'actioncolumn',
                    header: 'Save?',
                    width: 40,
                    locked: true,
                    items: [{
                        icon: '../../images/qmv_bb_save.gif',
                        handler: function (grid, rowIndex, colindex) {
                            var issueModel = grid.getStore().getAt(rowIndex);
                            issueModel.set('UPDATE_USER', empId);

                            var writer = new Ext.data.writer.Json();
                            var issue = writer.getRecordData(issueModel);

                            var updateStore = Ext.create('Ext.data.JsonStore', {
                                // destroy the store if the grid is destroyed
                                autoDestroy: true,
                                model: ServiceResultModel,
                                proxy: {
                                    type: 'ajax',
                                    // load remote data using HTTP
                                    url: appPath + 'webservice/RRPService.svc/UpdateIssuesJson',
                                    reader: {
                                        type: 'json',
                                        idProperty: 'IsSuccess'
                                    },
                                    model: 'ServiceResultModel',
                                    extraParams: { 'model': Ext.JSON.encode(issue) }
                                }
                            });

                            // manually trigger the data store load
                            updateStore.load({
                                // store loading is asynchronous, use a load listener or callback to handle results
                                callback: function (records, operation, success) {
                                    var record = records[0];
                                    var msgVar;
                                    var iconVar;

                                    if (success) {
                                        if (undefined !== record.getId() && record.get('IsSuccess')) {
                                            msgVar = 'Update Success';
                                            iconVar = Ext.Msg.INFO;
                                            statusStore.getUpdatedRecords();

                                            //complete edit
                                            var result = Ext.decode(record.get('Message'));
                                            var savedRecord = grid.getStore().findRecord('IDEN_KEY', result.IDEN_KEY);
                                            savedRecord.set('UPDATE_DATE', result.UPDATE_DATE);
                                            savedRecord.commit();
                                        } else {
                                            msgVar = 'Update Fail<br/>' + record.get('Message');
                                            iconVar = Ext.Msg.ERROR;
                                        }
                                    } else {
                                        msgVar = 'Service Fail<br/>';
                                        iconVar = Ext.Msg.ERROR;
                                    }

                                    Ext.Msg.show({
                                        title: 'Update Status',
                                        msg: msgVar,
                                        modal: true,
                                        icon: iconVar,
                                        buttons: Ext.Msg.OK
                                    });

                                }
                            });
                            //alert(grid.getStore().getAt(rowIndex).getChanges());
                            //alert(grid.getStore().getAt(rowIndex).get('NAME'));
                        }
                    }]
                }]
            });

            // manually trigger the data store load
            issuesStore.load({
                // store loading is asynchronous, use a load listener or callback to handle results
                callback: function (records, operation, success) {
                    var record = records[0];
                    var msgVar;
                    var iconVar;

                    if (success) {
                        if (undefined !== record.getId()) {
                            msgVar = 'Grid was loaded, Data available for processing';
                            iconVar = Ext.Msg.INFO;
                        } else {
                            msgVar = 'Service load but no response.';
                            iconVar = Ext.Msg.ERROR;
                        }
                    } else {
                        msgVar = 'Service Fail<br/>';
                        iconVar = Ext.Msg.ERROR;
                    }

                    Ext.Msg.show({
                        title: 'Rating Progress',
                        msg: msgVar,
                        modal: true,
                        icon: iconVar,
                        buttons: Ext.Msg.OK
                    });
                }
            });

            // create the Data Store
            var empListStore = Ext.create('Ext.data.JsonStore', {
                // destroy the store if the grid is destroyed
                //autoDestroy: true,
                model: EmpListModel,
                proxy: {
                    type: 'ajax',
                    // load remote data using HTTP
                    url: appPath + 'webservice/RRPService.svc/GetEMPListJson',
                    reader: {
                        type: 'json',
                        idProperty: 'EMP_ID'
                    },
                    model: EmpListModel
                }
            });


            // Create the combo box, attached to the states data store
            var empListCombo = Ext.create('Ext.form.ComboBox', {
                fieldLabel: 'Employee',
                store: empListStore,
                displayField: 'EMP_NAME',
                valueField: 'EMP_ID',
                renderTo: 'EmpList-ComboBox',
                width: 350,
                listeners: {
                    change: function (thisCombo, newValue, oldValue, eOpts) {
                        if (newValue == 'All') {
                            grid.getStore().getProxy().url = appPath + 'webservice/RRPService.svc/GetIssuesAllJson';
                            grid.getStore().getProxy().extraParams = null;
                            grid.getStore().load();
                        } else {
                            grid.getStore().getProxy().url = appPath + 'webservice/RRPService.svc/GetIssuesByEMPIDJson';
                            grid.getStore().getProxy().extraParams = { 'empId': newValue };
                            grid.getStore().load();
                        }
                    }
                }
            });

            empListStore.load({
                // store loading is asynchronous, use a load listener or callback to handle results
                callback: function (records, operation, success) {
                    var record = records[0];
                    var msgVar;
                    var iconVar;

                    if (success) {
                        if (undefined !== record.getId()) {
                            msgVar = 'Employee list was loaded, Data available for processing';
                            iconVar = Ext.Msg.INFO;
                        } else {
                            msgVar = 'Service load but no response.';
                            iconVar = Ext.Msg.ERROR;
                        }
                    } else {
                        msgVar = 'Service Fail<br/>';
                        iconVar = Ext.Msg.ERROR;
                    }

                    /*
                    Ext.Msg.show({
                    title: 'Employee List Progress',
                    msg: msgVar,
                    modal: true,
                    icon: iconVar,
                    buttons: Ext.Msg.OK
                    });
                    */
                }
            });

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"
        EnableScriptLocalization="True">
        <Services>
            <asp:ServiceReference Path="~/webservice/RRPService.svc" />
        </Services>
    </asp:ScriptManager>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div id="EmpList-ComboBox"></div>
    <div id="editor-grid" />
</asp:Content>

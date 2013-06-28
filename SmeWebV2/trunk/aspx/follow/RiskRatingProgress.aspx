<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="RiskRatingProgress.aspx.vb" Inherits="aspx_follow_RiskRatingProgress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--
    <script src="../../js/ext-4.2.0.663/ext-all.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../js/ext-4.2.0.663/resources/css/ext-all.css" />
    --%>

    <%--<script type="text/javascript">
//        var url = '/SmeWebV2/webservice/TestService.svc/players';
//        url = '/SmeWebV2/webservice/RRPService.svc/GetIssuesAllJson';
//        url = "/SmeWebV2/webservice/RRPService.svc/GetIssuesByEMPID";
//        url = '/SmeWebV2/webservice/RRPService.svc/GetIssuesByKeyJson';
//        url = '/SmeWebV2/webservice/RRPService.svc/UpdateStatusMasterJson';

//        var idenKeyVar = 1;
//        var dataIn = '{' + '"idenKey":' + idenKeyVar + '}';
//        dataIn = { 'idenKey': 1 };

//        var rrpModel = {
//            UPDATE_STATUS_KEY: 1,
//            UPDATE_STATUS_DESC: 'Pending ที่ CM',
//            ORDERING: 1,
//            CREATE_DATE: '2013-06-10 12:00:00.000',
//            UPDATE_DATE: '2013-06-17 10:17:30.740',
//            CREATE_BY: '249888',
//            UPDATE_BY: '249888',
//            DEL_FLAG: false
//        };
//        dataIn = { "model": JSON.stringify(rrpModel) };

//        alert("rrpModel.DEL_FLAG:" + rrpModel.DEL_FLAG);

//        $.ajax({
//            url: url,
//            type: 'GET',
//            contentType: 'application/json; charset=utf-8',
//            data: dataIn,
//            dataType: 'json',
//            success: function (data) {
//                alert('Success:');
//                alert('Total count:' + data.length);
//                for (i = 0; i < 5; i++) {
//                    alert('Customer:' + data[i].NAME);
//                }
//            },
//            error: function (error, textStatus, errorThrown) {
//                alert('Error: ' + error);
//                alert('JQuery error status:' + error.status);
//                alert('JQuery error statusText:' + error.statusText);
//            }
//        });

        Ext.onReady(function () {
            var myparams = { 'idenKey': 1 };
            // Create store 
            var myStore = new Ext.data.JsonStore({
                // Load data at once
                //  autoLoad: true,
                // Override default http proxy settings
                proxy: new Ext.data.HttpProxy({
                    // Call web service method using GET syntax
                    url: '/SmeWebV2/webservice/RRPService.svc/GetIssuesByKeyJson',
                    // Ask for Json response
                    headers: this.header || { 'Content-Type': 'application/json;charset=utf-8' },

                    listeners: {
                        exception: function (dp, type, action, options, response, arg) {
                            // Error handling   
                        }
                    },
                    method: 'POST'

                }),
                // Root variable 
                root: 'd',
                // Record identifier
                id: 'IDEN_KEY',
                // Fields declaration
                fields: ['IDEN_KEY', 'CIF']
            });

            //            myStore.load({
            //                params: Ext.encode(myparams)

            //            });

            var issuesProxy = new Ext.data.proxy.Ajax({
                url: '/SmeWebV2/webservice/RRPService.svc/GetIssuesByKeyJson',
                headers: { 'Content-Type': 'application/json;charset=utf-8' },
                listeners: {
                    exception: function (thisProxy, responseObj, operation, eventOpts) {
                        if (responseObj.responseText != undefined) {
                            // responseText was returned, decode it
                            responseObjDecode = Ext.decode(responseObj.responseText, true);
                            if (responseObjDecode != null && responseObjDecode.msg != undefined) {
                                // message was returned
                                Ext.Msg.alert('Error', responseObjDecode.msg);
                            }
                            else {
                                // responseText was decoded, but no message sent
                                Ext.Msg.alert('Error', 'Unknown error: The server did not send any information about the error.<br />ResponseText:' + responseObj.responseText);
                            }
                        }
                        else {
                            // no responseText sent
                            Ext.Msg.alert('Error', 'Unknown error: Unable to understand the response from the server');
                        }
                    }
                },
                method: 'GET'
            });

            Ext.define('IssuesModel', {
                extend: 'Ext.data.Model',
                fields: [
                    { name: 'IDEN_KEY', type: 'int' },
                    { name: 'CIF', type: 'int' },
                    { name: 'NAME', type: 'string' },
                    { name: 'REVIEW_OFFICER_ID', type: 'string' },
                    { name: 'REVIEW_OFFICER_NAME', type: 'string' },
                    { name: 'REVIEWED_DATE', type: 'date', dateFormat: 'Y-m-dTH:i:s' },
                    { name: 'DUE_DATE', type: 'date', dateFormat: 'Y-m-dTH:i:s' },
                    { name: 'INCORRECT_ISSUES', type: 'string' },
                    { name: 'PROGRESS', type: 'string' },
                    { name: 'MANAGER_ID', type: 'string' },
                    { name: 'MANAGER_NAME', type: 'string' },
                    { name: 'HEAD_ID', type: 'string' },
                    { name: 'HEAD_NAME', type: 'string' },
                    { name: 'CM_ID', type: 'string' },
                    { name: 'CM_NAME', type: 'string' },
                    { name: 'RM', type: 'string' },
                    { name: 'RM_NAME', type: 'string' },
                    { name: 'UPDATE_STATUS_KEY', type: 'int' },
                    { name: 'UPDATE_STATUS_DESC', type: 'string' },
                    { name: 'UPDATE_USER', type: 'string' },
                    { name: 'UPDATE_DATE', type: 'date', dateFormat: 'Y-m-dTH:i:s' },
                    { name: 'CREATE_DATE', type: 'date', dateFormat: 'Y-m-dTH:i:s' },
                    { name: 'ETL_DATE', type: 'date', dateFormat: 'Y-m-dTH:i:s' },
                    { name: 'ETL_SOURCE_FILE', type: 'string' },
                    { name: 'ATTACH_FILE_PATH', type: 'string' },
                    { name: 'ATTACH_FILE_NAME', type: 'string' },
                    { name: 'DEL_FLAG', type: 'boolean' }
                ],

                getReviewedDate: function () {
                    return this.REVIEWED_DATE;
                },

                parseDate: function (v, record) {
                    console.log(v); //show 1347465600000 
                    console.log(Ext.Date.format(new Date(v), 'Y-m-d')); //show 2012-09-13
                    return Ext.Date.format(new Date(v), 'Y-m-d');
                }
            });

            var isseusStore = new Ext.data.JsonStore({
                storeId: 'isseusStore',
                // Load data at once
                //  autoLoad: true,
                // Override default http proxy settings
                proxy: {
                    type: 'ajax',
                    url: '/SmeWebV2/webservice/RRPService.svc/GetIssuesByKeyJson',
                    reader: {
                        type: 'json',
                        //root: 'images',
                        idProperty: 'IDEN_KEY'
                    }
                },
                model: 'IssuesModel'
            });

            isseusStore.load({
                params: myparams
            });

            Ext.create('Ext.grid.Panel', {
                title: 'Rating Issues Follow',
                store: Ext.data.StoreManager.lookup('isseusStore'),
                columns: [
                    { text: 'ID',
                        dataIndex: 'IDEN_KEY',
                        locked   : true,
                        width    : 20,
                        sortable: false
                    },
                    { text: 'CIF', dataIndex: 'CIF',
                        locked: true,
                        width: 70,
                        sortable: false
                    },
                    { text: 'NAME', dataIndex: 'NAME',
                        locked: true,
                        width: 250,
                        sortable: false
                    },
                    { text: 'REVIEW_OFFICER_ID', dataIndex: 'REVIEW_OFFICER_ID' },
                    { text: 'REVIEW_OFFICER_NAME', dataIndex: 'REVIEW_OFFICER_NAME' },
                    { text: 'REVIEWED_DATE', dataIndex: 'REVIEWED_DATE', renderer: Ext.util.Format.dateRenderer('d/m/Y H:i:s') },
                    { text: 'DUE_DATE', dataIndex: 'DUE_DATE', renderer: Ext.util.Format.dateRenderer('d/m/Y H:i:s') },
                    { text: 'INCORRECT_ISSUES', dataIndex: 'INCORRECT_ISSUES' },
                    { text: 'PROGRESS', dataIndex: 'PROGRESS' },
                    { text: 'MANAGER_ID', dataIndex: 'MANAGER_ID' },
                    { text: 'MANAGER_NAME', dataIndex: 'MANAGER_NAME' },
                    { text: 'HEAD_ID', dataIndex: 'HEAD_ID' },
                    { text: 'HEAD_NAME', dataIndex: 'HEAD_NAME' },
                    { text: 'CM_ID', dataIndex: 'CM_ID' },
                    { text: 'CM_NAME', dataIndex: 'CM_NAME' },
                    { text: 'RM', dataIndex: 'RM' },
                    { text: 'RM_NAME', dataIndex: 'RM_NAME' },
                    { text: 'UPDATE_STATUS_KEY', dataIndex: 'UPDATE_STATUS_KEY' },
                    { text: 'UPDATE_STATUS_DESC', dataIndex: 'UPDATE_STATUS_DESC' },
                    { text: 'UPDATE_USER', dataIndex: 'UPDATE_USER' },
                    { text: 'UPDATE_DATE', dataIndex: 'UPDATE_DATE', renderer: Ext.util.Format.dateRenderer('d/m/Y H:i:s') },
                    { text: 'CREATE_DATE', dataIndex: 'CREATE_DATE', renderer: Ext.util.Format.dateRenderer('d/m/Y H:i:s') },
                    { text: 'ETL_DATE', dataIndex: 'ETL_DATE', renderer: Ext.util.Format.dateRenderer('d/m/Y H:i:s') },
                    { text: 'ETL_SOURCE_FILE', dataIndex: 'ETL_SOURCE_FILE' },
                    { text: 'ATTACH_FILE_PATH', dataIndex: 'ATTACH_FILE_PATH' },
                    { text: 'ATTACH_FILE_NAME', dataIndex: 'ATTACH_FILE_NAME' },
                    { text: 'DEL_FLAG', dataIndex: 'DEL_FLAG' }
                ],
                height: 400,
                width: 800,
                renderTo: Ext.getBody()
            });

        });
    </script>--%>

    <!-- Shared -->
    <%--<link rel="stylesheet" type="text/css" href="../../js/ext-4.2.0.663/examples/shared/example.css">--%>
    <!-- Filter -->
    <link rel="stylesheet" type="text/css" href="../../js/ext-4.2.0.663/examples/ux/grid/css/GridFilters.css">
    <link rel="stylesheet" type="text/css" href="../../js/ext-4.2.0.663/examples/ux/grid/css/RangeMenu.css">
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
    <script src=RiskRatingProgress.js type="text/javascript"></script>

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
                model: IssuesStatusModel,
                proxy: {
                    type: 'ajax',
                    // load remote data using HTTP
                    url: '/SmeWebV2/webservice/RRPService.svc/GetStatusMasterAllJson',
                    reader: {
                        type: 'json',
                        idProperty: 'UPDATE_STATUS_KEY'
                    },
                    model: 'IssuesStatusModel'
                },
                sorters: [{
                    property: 'ORDERING',
                    direction: 'ASC'
                }]
            });

            var gridProxy = {
                type: 'ajax',
                // load remote data using HTTP
                url: '/SmeWebV2/webservice/RRPService.svc/GetIssuesAllJson',
                reader: {
                    type: 'json',
                    idProperty: 'IDEN_KEY'
                },
                model: 'IssuesModel'
                //extraParams: { 'idenKey': 1 }
            };

            var store = Ext.create('Ext.data.JsonStore', {
                // destroy the store if the grid is destroyed
                //autoDestroy: true,
                //autoLoad: true,
                model: IssuesModel,
                proxy: gridProxy,
                sorters: [{
                    property: 'IDEN_KEY',
                    direction: 'ASC'
                }]
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
                store: store,
                selModel: {
                    selType: 'cellmodel'
                },
                renderTo: 'editor-grid',
                width: 1200,
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
                    width: 200,
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
                    header: 'INCORRECT_ISSUES',
                    dataIndex: 'INCORRECT_ISSUES',
                    filter: {
                        type: 'string'
                    },
                    width: 300
                }, {
                    header: 'PROGRESS',
                    dataIndex: 'PROGRESS',
                    filter: {
                        type: 'string'
                    },
                    width: 300
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
                    width: 200,
                    locked: true,
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
                    width: 50
                }, {
                    header: 'UPDATE_DATE',
                    dataIndex: 'UPDATE_DATE',
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
                    locked: true,
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
                            var writer = new Ext.data.writer.Json();
                            var issue = writer.getRecordData(issueModel);

                            var updateStore = Ext.create('Ext.data.JsonStore', {
                                // destroy the store if the grid is destroyed
                                autoDestroy: true,
                                model: ServiceResultModel,
                                proxy: {
                                    type: 'ajax',
                                    // load remote data using HTTP
                                    url: '/SmeWebV2/webservice/RRPService.svc/UpdateIssuesJson',
                                    reader: {
                                        type: 'json',
                                        idProperty: 'IDEN_KEY'
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
                                        if (record.get('IsSuccess')) {
                                            msgVar = 'Update Success';
                                            iconVar = Ext.Msg.INFO;
                                            statusStore.getUpdatedRecords();

                                            //complete edit
                                            var result = Ext.decode(record.get('Message'));
                                            grid.getStore().findRecord('IDEN_KEY', result.IDEN_KEY).commit();
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
            store.load({
                // store loading is asynchronous, use a load listener or callback to handle results
                callback: function () {
                    Ext.Msg.show({
                        title: 'Rating Progress',
                        msg: 'Grid was loaded, Data available for processing',
                        modal: false,
                        icon: Ext.Msg.INFO,
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
                    url: '/SmeWebV2/webservice/RRPService.svc/GetEMPListJson',
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
                            store.getProxy().url = '/SmeWebV2/webservice/RRPService.svc/GetIssuesAllJson';
                            store.getProxy().extraParams = null;
                            store.load();
                        } else {
                            store.getProxy().url = '/SmeWebV2/webservice/RRPService.svc/GetIssuesByEMPIDJson';
                            store.getProxy().extraParams = { 'empId': newValue };
                            store.load();
                        }
                    }
                }
            });

            empListStore.load({
                // store loading is asynchronous, use a load listener or callback to handle results
                callback: function () {
                    //
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

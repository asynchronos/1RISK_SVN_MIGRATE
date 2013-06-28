Ext.Loader.setConfig({
    enabled: true
});
Ext.Loader.setPath('Ext.ux', '../ux');

Ext.require([
    'Ext.selection.CellModel',
    'Ext.grid.*',
    'Ext.data.*',
    'Ext.ux.grid.FiltersFeature',
    'Ext.toolbar.Paging',
    'Ext.util.*',
    'Ext.state.*',
    'Ext.form.*',
    'Ext.ux.CheckColumn'
]);

if (window.location.search.indexOf('scopecss') !== -1) {
    // We are using ext-all-scoped.css, so all rendered ExtJS Components must have a
    // reset wrapper round them to provide localized CSS resetting.
    Ext.scopeResetCSS = true;
};

Ext.define('ServiceResultModel', {
    extend: 'Ext.data.Model',
    fields: [
        { name: 'IsSuccess', type: 'boolean' },
        { name: 'Message', type: 'string' }
    ]
});

Ext.define('EmpListModel', {
    extend: 'Ext.data.Model',
    fields: [
        { name: 'EMP_ID', type: 'string' },
        { name: 'EMP_NAME', type: 'string' }
    ]
});

Ext.define('IssuesModel', {
    extend: 'Ext.data.Model',
    fields: [
        { name: 'IDEN_KEY', type: 'int' },
        { name: 'CIF', type: 'int' },
        { name: 'NAME', type: 'string' },
        { name: 'REVIEW_OFFICER_ID', type: 'string' },
        { name: 'REVIEW_OFFICER_NAME', type: 'string' },
        { name: 'REVIEWED_DATE', type: 'date', dateReadFormat: 'Y-m-dTH:i:s', dateWriteFormat: 'Y-m-d H:i:s' },
        { name: 'DUE_DATE', type: 'date', dateReadFormat: 'Y-m-dTH:i:s', dateWriteFormat: 'Y-m-d H:i:s' },
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
        { name: 'UPDATE_DATE', type: 'date', dateReadFormat: 'Y-m-dTH:i:s', dateWriteFormat: 'Y-m-d H:i:s' },
        { name: 'CREATE_DATE', type: 'date', dateReadFormat: 'Y-m-dTH:i:s', dateWriteFormat: 'Y-m-d H:i:s' },
        { name: 'ETL_DATE', type: 'date', dateReadFormat: 'Y-m-dTH:i:s', dateWriteFormat: 'Y-m-d H:i:s' },
        { name: 'ETL_SOURCE_FILE', type: 'string' },
        { name: 'ATTACH_FILE_PATH', type: 'string' },
        { name: 'ATTACH_FILE_NAME', type: 'string' },
        { name: 'DEL_FLAG', type: 'boolean' }
    ]
});

Ext.define('IssuesStatusModel', {
    extend: 'Ext.data.Model',
    fields: [
        { name: 'UPDATE_STATUS_KEY', type: 'int' },
        { name: 'UPDATE_STATUS_DESC', type: 'string' },
        { name: 'ORDERING', type: 'int' },
        { name: 'CREATE_DATE', type: 'date', dateReadFormat: 'Y-m-dTH:i:s', dateWriteFormat: 'Y-m-d H:i:s' },
        { name: 'UPDATE_DATE', type: 'date', dateReadFormat: 'Y-m-dTH:i:s', dateWriteFormat: 'Y-m-d H:i:s' },
        { name: 'CREATE_BY', type: 'string' },
        { name: 'UPDATE_BY', type: 'string' },
        { name: 'DEL_FLAG', type: 'boolean' }
    ]
});

//Ext.define('RiskRatingProgress', {
//    extend: 'Ext.grid.Panel',

//    requires: [
//        'Ext.selection.CellModel',
//        'Ext.grid.*',
//        'Ext.data.*',
//        'Ext.util.*',
//        'Ext.form.*',
//        'IssuesModel'
//    ],
//    xtype: 'cell-editing',

//    title: 'Rating Issues Follow',
//    frame: true,

//    initComponent: function () {
//        this.cellEditing = new Ext.grid.plugin.CellEditing({
//            clicksToEdit: 1
//        });

//        Ext.apply(this, {
//            width: 680,
//            height: 350,
//            plugins: [this.cellEditing],
//            store: new Ext.data.JsonStore({
//                // destroy the store if the grid is destroyed
//                autoDestroy: true,
//                model: IssuesModel,
//                proxy: {
//                    type: 'ajax',
//                    // load remote data using HTTP
//                    url: '/SmeWebV2/webservice/RRPService.svc/GetIssuesByKeyJson',
//                    reader: {
//                        type: 'json',
//                        idProperty: 'IDEN_KEY'
//                    }
//                },
//                sorters: [{
//                    property: 'IDEN_KEY',
//                    direction: 'ASC'
//                }]
//            }),
//            columns: [{
//                header: 'ID',
//                dataIndex: 'IDEN_KEY',
//                locked: true,
//                width: 20,
//                sortable: false,
//                flex: 1
//            }, {
//                header: 'CIF',
//                dataIndex: 'CIF',
//                locked: true,
//                width: 70,
//                sortable: false
//            }, {
//                header: 'NAME',
//                dataIndex: 'NAME',
//                locked: true,
//                width: 250,
//                sortable: false
//            }, {
//                header: 'REVIEW_OFFICER_ID',
//                dataIndex: 'REVIEW_OFFICER_ID',
//                width: 50
//            }, {
//                header: 'REVIEW_OFFICER_NAME',
//                dataIndex: 'REVIEW_OFFICER_NAME',
//                width: 50
//            }, {
//                header: 'REVIEWED_DATE',
//                dataIndex: 'REVIEWED_DATE',
//                width: 95,
//                renderer: Ext.util.Format.dateRenderer('d/m/Y H:i:s'),
//                editor: {
//                    xtype: 'datefield',
//                    format: 'd/m/Y',
//                    minValue: '01/01/2013',
//                    disabledDays: [0, 6],
//                    disabledDaysText: 'Plants are not available on the weekends'
//                }
//            }, {
//                header: 'DUE_DATE',
//                dataIndex: 'DUE_DATE',
//                width: 95,
//                renderer: Ext.util.Format.dateRenderer('d/m/Y H:i:s'),
//                editor: {
//                    xtype: 'datefield',
//                    format: 'd/m/Y',
//                    minValue: '01/01/2013',
//                    disabledDays: [0, 6],
//                    disabledDaysText: 'Plants are not available on the weekends'
//                }
//            }, {
//                header: 'INCORRECT_ISSUES',
//                dataIndex: 'INCORRECT_ISSUES',
//                width: 300
//            }, {
//                header: 'PROGRESS',
//                dataIndex: 'PROGRESS',
//                width: 300
//            }, {
//                header: 'MANAGER_ID',
//                dataIndex: 'MANAGER_ID',
//                width: 50
//            }, {
//                header: 'MANAGER_NAME',
//                dataIndex: 'MANAGER_NAME',
//                width: 50
//            }, {
//                header: 'HEAD_ID',
//                dataIndex: 'HEAD_ID',
//                width: 50
//            }, {
//                header: 'HEAD_NAME',
//                dataIndex: 'HEAD_NAME',
//                width: 50
//            }, {
//                header: 'CM_ID',
//                dataIndex: 'CM_ID',
//                width: 50
//            }, {
//                header: 'CM_NAME',
//                dataIndex: 'CM_NAME',
//                width: 50
//            }, {
//                header: 'RM',
//                dataIndex: 'RM',
//                width: 50
//            }, {
//                header: 'RM_NAME',
//                dataIndex: 'RM_NAME',
//                width: 50
//            }, {
//                header: 'UPDATE_STATUS_DESC',
//                dataIndex: 'UPDATE_STATUS_DESC',
//                width: 130,
//                editor: new Ext.form.field.ComboBox({
//                    typeAhead: true,
//                    triggerAction: 'all',
//                    selectOnTab: true,
//                    store: [
//                        ['1', 'Shade'],
//                        ['2 Shady', 'Mostly Shady'],
//                        ['3', 'Sun or Shade'],
//                        ['4', 'Mostly Sunny'],
//                        ['5', 'Sunny']
//                    ],
//                    lazyRender: true,
//                    listClass: 'x-combo-list-small'
//                })
//            }, {
//                header: 'UPDATE_USER',
//                dataIndex: 'UPDATE_USER',
//                width: 50
//            }, {
//                header: 'UPDATE_DATE',
//                dataIndex: 'UPDATE_DATE',
//                width: 95,
//                renderer: Ext.util.Format.dateRenderer('d/m/Y H:i:s'),
//                editor: {
//                    xtype: 'datefield',
//                    format: 'd/m/Y',
//                    minValue: '01/01/2013',
//                    disabledDays: [0, 6],
//                    disabledDaysText: 'Plants are not available on the weekends'
//                }
//            }, {
//                header: 'CREATE_DATE',
//                dataIndex: 'CREATE_DATE',
//                width: 95,
//                renderer: Ext.util.Format.dateRenderer('d/m/Y H:i:s'),
//                editor: {
//                    xtype: 'datefield',
//                    format: 'd/m/Y',
//                    minValue: '01/01/2013',
//                    disabledDays: [0, 6],
//                    disabledDaysText: 'Plants are not available on the weekends'
//                }
//            }, {
//                header: 'ETL_DATE',
//                dataIndex: 'ETL_DATE',
//                width: 95,
//                renderer: Ext.util.Format.dateRenderer('d/m/Y H:i:s'),
//                editor: {
//                    xtype: 'datefield',
//                    format: 'd/m/Y',
//                    minValue: '01/01/2013',
//                    disabledDays: [0, 6],
//                    disabledDaysText: 'Plants are not available on the weekends'
//                }
//            }, {
//                header: 'ETL_SOURCE_FILE',
//                dataIndex: 'ETL_SOURCE_FILE',
//                width: 50
//            }, {
//                header: 'ATTACH_FILE_PATH',
//                dataIndex: 'ATTACH_FILE_PATH',
//                width: 50
//            }, {
//                header: 'ATTACH_FILE_NAME',
//                dataIndex: 'ATTACH_FILE_NAME',
//                width: 50
//            }, {
//                xtype: 'checkcolumn',
//                header: 'Delete?',
//                dataIndex: 'DEL_FLAG',
//                width: 90,
//                stopSelection: false
//            }, {
//                header: 'Light',
//                dataIndex: 'light',
//                width: 130,
//                editor: new Ext.form.field.ComboBox({
//                    typeAhead: true,
//                    triggerAction: 'all',
//                    selectOnTab: true,
//                    store: [
//                        ['Shade', 'Shade'],
//                        ['Mostly Shady', 'Mostly Shady'],
//                        ['Sun or Shade', 'Sun or Shade'],
//                        ['Mostly Sunny', 'Mostly Sunny'],
//                        ['Sunny', 'Sunny']
//                    ],
//                    lazyRender: true,
//                    listClass: 'x-combo-list-small'
//                })
//            }],
//            selModel: {
//                selType: 'cellmodel'
//            }
////            ,
////            tbar: [{
////                text: 'Add Plant',
////                scope: this,
////                handler: this.onAddClick
////            }]
//        });

//        this.callParent();

//        this.on('afterlayout', this.loadStore, this, {
//            delay: 1,
//            single: true
//        })
//    },

//    renderTo: Ext.getBody(),

//    loadStore: function () {
//        this.getStore().load({
//            // store loading is asynchronous, use a load listener or callback to handle results
//            callback: this.onStoreLoad
//        });
//    },

//    onStoreLoad: function () {
//        Ext.Msg.show({
//            title: 'Store Load Callback',
//            msg: 'store was loaded, data available for processing',
//            icon: Ext.Msg.INFO,
//            buttons: Ext.Msg.OK
//        });
//    },

//    onAddClick: function () {
//        // Create a model instance
//        var rec = new KitchenSink.model.grid.Plant({
//            common: 'New Plant 1',
//            light: 'Mostly Shady',
//            price: 0,
//            availDate: Ext.Date.clearTime(new Date()),
//            indoor: false
//        });

//        this.getStore().insert(0, rec);
//        this.cellEditing.startEditByPosition({
//            row: 0,
//            column: 0
//        });
//    },

//    onRemoveClick: function (grid, rowIndex) {
//        this.getStore().removeAt(rowIndex);
//    }
//})
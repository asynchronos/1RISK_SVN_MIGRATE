
// initial  variable
    var NewLoadWhenUpdate = true ; // ตัวแปรกำหนดให้โหลดข้อมูลใหม่หลังจาก update ข้อมูลเสร็จ 
    var jsonString;
    var errorMsgUpdate = 'ไม่สามารถบันทึกข้อมูลขณะนี้';
    var errorMsgShow = ' ไม่สามารถแสดงข้อมูลในขณะนี้ได้ ';
    var errorMsgConnect = 'ไม่สามารถติดต่อ SERVER ';
    // ส่วนนี้ไม่ต้องประกาศ เนื่องจากดึง จาก page method ทำให้ต้องสร้างใหม่เวลาที่ดึงข้อมูลจาก grid
    // var grid = ''; var arrayRedShirt; //var redshirtstore;
    var pnl; 
    var form;
    var toolbar1; var lblSearch; var txtSearch; var cbSearch;var BtnAdd;  // tool bar
    var actionform;
    var hdIDEN;
    var txtCIF;         var txtNAME;              var txtNAME_ENG;
    var txtLIMIT;     var txtOS_CASH;      var txtOS_NONE_CASH;
    var txtRemark;
 
    var dtCONTRACT_DATE;     var  dtAPPROVE_DATE;     
    var dtSIGNING_DATE;            var  dtCONDITION_DATE;

    var cbTypeOfHelp;              var helpStore;       var helpStoreData;
    var cbTypeOfCust;               var custStore;
    var cbLevel;                            var levelStore;
    var cbTypeOfBusiness ;    var businessStore;
    var cbTypeOfZone;             var zoneStore;
    
    var cbTypeOfApproval;
    var cbCM;        var cbHead;          var empStore;  
    
    var txtTYPE_OF_APPROVAL;
    var txtAFFECT_TYPE;            var txtCUSTOMER_TYPE;
    var  txtCM;
    var txtCM_HEAD;                       var txtCM_GROUP;
     var txtREMARK;                        var txtEMP_ID;
     var txtOtherBusiness;
     var txtLocation;
    
    var windows;
    var btnFormAdd; // ปุ่ม add ใน form
    var btnFormUpdate; // ปุ่ม update ใน form
    var btnFormClear;
    var xg = Ext.grid;  // สร้าง row number


    Ext.onReady(function() {

        if (EMP_ID == '') {
            alert('Time out expired \n  Please login again.');
            window.close();
        }
        // กำหนด
        if (window.screen) {
            self.moveTo(0, 0);
            self.focus();
            self.resizeTo(screen.availWidth, screen.availHeight);
        }
        createRedShirtStore();
        createHelpStore();  // กำหนดให้สร้าง help store หลังจากทำเสร็จ
        // ไม่ใช้ code ส่วนนี้เนื่องจาก ไปกำหนดให้ทำงานหลังจาก function แต่ละอันเสร็จแทน รอให้ call back ทำงานฃ
        // เนื่องจากแต่ละฟังชั่นไม่รอการทำงานจาก callback 
        //createHelpStore();
        //createEmpStore();
        //createCusTypeStore();
        //createLevelStore();
        // หลังจาก load store เสร็จแล้วให้สร้าง form ด้วย
        Ext.QuickTips.init();
    });

    function createToolBarButton() {
        toolbar1 = new Ext.Toolbar();
        lblSearch = new Ext.form.Label({ text: ' Search from ', enableKeyEvents: true });
        txtSearch = new Ext.form.TextField({ id: 'txtSearch', enableKeyEvents: true });
//                         txtSearch.on({
//                            'keyup' : {
//                                   fn: function(){
//                                           var fname = cbSearch.getValue();
//                                           var fvalue = txtSearch.getValue();
//                                                         //alert(cbSearch.getValue());
//                                                         if (fname  != '' && fvalue.length > 1) {
//                                                             showCustomerSearch(fname, fvalue);
//                                                         }  //  if (cbSearch.getValue() != '' && txtSearch.getValue() != '') {
//                                             },
//                                 scope: this,
//                                 delay: 100
//                            }
//                    });
        BtnSearch = new Ext.Button({ id: 'BtnSearch', text: ' Search ', iconCls: 'grid', scale: 'small' });
        BtnSearch.addListener('click', function() {
            if (cbSearch.getValue() != '' && txtSearch.getValue() != '') {
                var fname = cbSearch.getValue();
                var fvalue = txtSearch.getValue();
                showCustomerSearch(fname,fvalue);
            }  //  if (cbSearch.getValue() != '' && txtSearch.getValue() != '') {
        });      //BtnSearch.addListener
            cbSearch = new Ext.form.ComboBox({
            store: new Ext.data.ArrayStore({
                    fields: ['field', 'fieldname'],
                    data: [
                                     ['CIF', 'CIF'],
                                     ['NAME', 'NAME']
                                ]
            }),
            valueField: 'field',
            displayField: 'fieldname',
            mode: 'local',
            width: 100,
            triggerAction: 'all',
            emptyText: ' Please select..'
        });

        BtnAdd = new Ext.Button({ id: 'BtnAdd', text: 'Add customer', iconCls: 'add', scale: 'small' });
        BtnAdd.addListener('click', function() {
                showFormUpdate(); 
        }); 
        toolbar1.add(lblSearch);
        toolbar1.add(cbSearch);
        toolbar1.add(txtSearch);
        toolbar1.add(BtnSearch);
     //  toolbar1.add(BtnAdd);

    } //  function create toolbar button
    function showCustomerSearch(fname, fvalue) {
        //Ext.Msg.alert(fname, fvalue);
        redshirtstore.load({waitMsg:'Loading'});
        redshirtstore.filter(fname, fvalue);
    } //showEmpSearch

    function formatLIMIT(v, record) {
       return !record.LIMIT ? '' : Ext.util.Format.number(record.LIMIT, '0,000');
    }
    function formatOS_CASH(v, record) {
        return !record.OS_CASH ? '' : Ext.util.Format.number(record.OS_CASH, '0,000');
    }
    function formatOS_NONE_CASH(v, record) {
        return !record.OS_NONE_CASH ? '' : Ext.util.Format.number(record.OS_NONE_CASH, '0,000');
    }

    function createRedShirtStore() {
        PageMethods.showRedShirtListByEMP(EMP_ID, OnSucceeded);
                    //setTimeout("$('#divLoading').removeClass('Loading').html('')", 3000);
        function OnSucceeded(result) {
        
        
                    // alert(result);
                           var re = /\n/g;
                           result = result.replace(re, '\\n');  // กำหนดให้ตัด string ตัวเว้นบรรทัด
                            re = /\r/g;
                            result = result.replace(re, '\\r');
                            //alert(result);    
                            //arrayRedShirt = eval('(' + result + ')');
                            arrayRedShirt = Ext.decode('(' + result + ')');
                            //alert(obj.rows);
                            // alert(obj.data);

                            redshirtstore = new Ext.data.JsonStore({
                                // store configs
                                //autoDestroy: true,
                                storeId: 'myStore',
                                // reader configs
                                root: 'data',
                                proxy: new Ext.data.PagingMemoryProxy(arrayRedShirt),
                                fields: [{ name: 'IDEN' },
                                                { name: 'CIF' },
                                                { name: 'NAME' },
                                                { name: 'NAME_ENG' },
                                                { name: 'LIMIT', convert: formatLIMIT },
                                                { name: 'OS_CASH', convert: formatOS_CASH },
                                                { name: 'OS_NONE_CASH', convert: formatOS_NONE_CASH },
                                                { name: 'TYPE_OF_BUSINESS' },
                                                { name: 'BUSINESS_TYPE_DESC' },
                                                { name: 'OTHER_BUSINESS' },
                                                { name: 'AFFECTED_ZONE' },
                                                { name: 'ZONE_DESC' },
                                                { name: 'LOCATION'},
                                                { name: 'CONTRACT_DATE' }, // CONTACT_DATE
                                                { name: 'TYPE_OF_HELP' },
                                                { name: 'HELP_TYPE_DESC' },
                                                { name: 'APPROVE_DATE' },
                                                { name: 'TYPE_OF_APPROVAL' },
                                                { name: 'APPROVE_TYPE_DESC' },
                                                { name: 'SIGNING_DATE' },
                                                { name: 'CONDITION_DATE' },
                                                { name: 'CUSTOMER_TYPE' },
                                                { name: 'CUS_TYPE_DESC' },
                                                { name: 'REMARK' },
                                                { name: 'CM_ID' },
                                                { name: 'CM_NAME' },
                                                { name: 'HEAD_ID' },
                                                { name: 'HEAD_NAME' },
                                                { name: 'LEVEL_ID' },
                                                { name: 'LEVEL_NAME' }
                                        ]
                                     });
                                     // redshirtstore.loadData(arrayRedShirt);
                                   createGrid();
                  }  //   function OnSucceeded(result) {
    }
    
    function createGrid() {
    try {
               createToolBarButton();  //  ต้องสร้างใหม่เพราะ มีการ destroy ตอน update ## ยังหาวิธีไม่ได้
               grid = new Ext.grid.GridPanel({
                store: redshirtstore,
                tbar: toolbar1,
                columns: [                                      //  columนี้ อ้างอิงจาก ฟิวต้องตรงกันกับ data
                     new xg.RowNumberer(),
                    { header: "IDEN", dataIndex: 'IDEN', hidden: true },   // ส่วนนี้ซ๋อน
                    {header: "CIF", dataIndex: 'CIF', width: 80, dataIndex: 'CIF', sortable: true },  // ส่วนนี้แสดง
                    {header: "Name (Th)", dataIndex: 'NAME', width: 150, sortable: true },
                    { header: "Name (Eng)", dataIndex: 'NAME_ENG', width: 150, sortable: true  },
                    { header: "CM_ID", dataIndex: 'CM_ID', hidden: true, sortable: true },
                    { header: "CM_NAME", dataIndex: 'CM_NAME',width: 150, hidden: false, sortable: true },
                    { header: "Limit <br>(OS+Available Undrown)", width: 80, dataIndex: 'LIMIT', sortable: true },
                    { header: "TYPE_OF_BUSINESS", dataIndex: 'TYPE_OF_BUSINESS', hidden: true },
                    { header: "Type of <br> Buesiness", dataIndex: 'BUSINESS_TYPE_DESC', width: 200, sortable: true },
                    { header: "AFFECTED_ZONE", dataIndex: 'AFFECTED_ZONE', hidden: true },
                    { header: "OS <br> Cash", width: 100, dataIndex: 'OS_CASH' },
                    { header: "OS <br> None Cash", width: 100, dataIndex: 'OS_NONE_CASH' },
                    { header: "Contact  Date <br> of help request(*)", width: 80, dataIndex: 'CONTRACT_DATE' },
                    { header: "Type of help <br> (Request)", width: 150, dataIndex: 'HELP_TYPE_DESC' },
                    { header: "Type of customer ", width: 150, dataIndex: 'CUS_TYPE_DESC' },
                    { header: "Approve date", width: 80, dataIndex: 'APPROVE_DATE' },
                    { header: "Type of approval", width: 150, dataIndex: 'APPROVE_TYPE_DESC'},
                    { header: "Contract <br> signing date", width: 80,dataIndex: 'SIGNING_DATE' },
                    { header: "New  <br> condition date", width: 80, dataIndex: 'CONDITION_DATE' },
                    { header: "HEAD_ID", dataIndex: 'HEAD_ID', hidden: true, sortable: true },
                    { header: "HEAD_NAME", dataIndex: 'HEAD_NAME', hidden: true, sortable: true },
                    { header: "LEVEL_ID", dataIndex: 'LEVEL_ID', hidden: true, sortable: true },
                    { header: "LEVEL_NAME", dataIndex: 'LEVEL_NAME', hidden: true, sortable: true }
      
                 ],
                layout: 'fit',
                title: 'RED SHIRT IMPACT (update by user '+ EMP_ID +')',
                height: screen.availHeight ,
                autoheight: true, //you must specify height or autoHeight
                stripeRows: true, //Alternate Row color
                forceFit: true,
                loadMask: true
                ,  bbar: new Ext.PagingToolbar({
                    pageSize: 500,
                    store: redshirtstore,
                    displayInfo: true,
                    plugins: new Ext.ux.ProgressBarPager()
                })
            });
       }   // try
      catch (err) {
          Ext.Msg.alert('', err);
       }     
          //  grid.on('rowDblclick', function() {
            grid.on('rowClick', function() {
                showFormUpdate();
            });

//            redshirtstore.on('load',function(){
//            // Do something
//                            // หลังจาก โหลดข้อมูลให้แสดงผล Loading..
//                            Ext.MessageBox.show({
//                                title: 'Please wait',
//                                msg: 'Loading items...',
//                                progressText: 'Initializing...',
//                                width: 300,
//                                progress: true,
//                                closable: false,
//                                animEl: 'grid'
//                            });

//                            // this hideous block creates the bogus progress
//                            var f = function(v) {
//                                return function() {
//                                    if (v == 12) {
//                                        Ext.MessageBox.hide();
//                                        //   Ext.example.msg('Done', 'Your fake items were loaded!');
//                                    } else {
//                                        var i = v / 11;
//                                        Ext.MessageBox.updateProgress(i, Math.round(100 * i) + '% completed');
//                                    }
//                                };
//                            };
//                            for (var i = 1; i < 13; i++) {
//                                setTimeout(f(i), i * 100);
//                            }
//                        });
            redshirtstore.load();

            pnl = new Ext.Viewport({
               id: 'panel',
                frame: true,
                layout: 'fit',
                items: grid,
                region:'center',
                margins:'5 5 5 0'
            });
            //redshirtstore.load({ params: { start: 0, limit: 20} });
        } // function createGrid() {


    //  msg function 
    var msg = function(title, msg, icon) {
        Ext.Msg.show({
            title: title,
            msg: msg,
            minWidth: 200,
            //modal: true,
            icon: icon,
            buttons: Ext.Msg.OK
        });
    };



// สร้าง combo box
    function createHelpStore() {
        PageMethods.showTypeOfHelp(OnSucceededshowTypeOfHelp, OnFailedshowTypeOfHelp);
    }
    function OnSucceededshowTypeOfHelp(result) {
      var obj = eval('(' + result + ')');
         helpStoreData = obj;
       //  alert('1'+ helpStoreData);
        helpStore = new Ext.data.JsonStore({
           storeId: 'helpStoreID',
             root: 'data',
            fields: [{ name: 'ID' }, { name: 'HELP_TYPE' }]
        });
            helpStore.loadData(helpStoreData);
            createEmpStore();
       
     }  //   function OnSucceeded(result) {
    
    
    function OnFailedshowTypeOfHelp(error) {
        msg(error, errMsgShow);
    }
   

     // สร้าง combo box
     function createEmpStore() {
         PageMethods.showEmployee(OnSucceededshowEMP, OnFailedshowEMP);
     }
     function OnSucceededshowEMP(result) {
         var obj = eval('(' + result + ')');
         //alert(obj);
         empStore = new Ext.data.JsonStore({
             storeId: 'empStoreID',
             root: 'data',
             fields: [{ name: 'EMP_ID' }, { name: 'EMP_NAME'}]
         });
         empStore.loadData(obj);
         createCusTypeStore(); // กำหนดให้ load cusstore ต่อ
     }  //   function OnSucceeded(result) {
     function OnFailedshowEMP(error) {
         msg(error, errMsgShow);
     }


     // สร้าง combo box
     function createCusTypeStore() {
         PageMethods.showTypeOfCustomer(OnSucceededshowTypeOfCust, OnFailedshowTypeOfCust);
     }
     function OnSucceededshowTypeOfCust(result) {
         var obj = eval('(' + result + ')');
         //alert(obj);
          custStore = new Ext.data.JsonStore({
             storeId: 'custStoreID',
             root: 'data',
             fields: [{ name: 'ID' },
                           { name: 'BEFORE' },
                           { name: 'AFTER' },
                           { name: 'DESCRIPTION' },
                           { name: 'CUST_TYPE' },
                           { name: 'GROUPTYPE' }
                           ]
         });
           custStore.loadData(obj);
           createLevelStore(); 
     }  //   function OnSucceeded(result) {
     function OnFailedshowTypeOfCust(error) {
         msg(error, errMsgShow);
     }
  // สร้าง createLevelStore
                 function createLevelStore() {
                     PageMethods.showLEVEL(OnSucceededshowLEVEL, OnFailedshowLEVEL);
                 }
                 function OnSucceededshowLEVEL(result) {
                     var obj = eval('(' + result + ')');
                     //alert(obj);
                     levelStore = new Ext.data.JsonStore({
                         storeId: 'levelStoreID',
                         root: 'data',
                         fields: [{ name: 'LEVEL_ID' }, { name: 'LEVEL_NAME'}]
                     });
                     levelStore.loadData(obj);
                     createBussinessTypeStore();
                 }  //   function OnSucceeded(result) {
                 function OnFailedshowLEVEL(error) {
                     msg(error, errMsgShow);
                 }
  //  จบ สร้าง createLevelStore
     
  // สร้าง combo box BusinessType
             function createBussinessTypeStore() {
                 PageMethods.showTypeOfBusiness(OnSucceededshowTypeOfBusiness, OnFailedshowTypeOfBusiness);
             }
             function OnSucceededshowTypeOfBusiness(result) {
                 var obj = eval('(' + result + ')');
                 //alert(obj);
                 businessStore = new Ext.data.JsonStore({
                     storeId: 'businessStoreID',
                     root: 'data',
                     fields: [ 
                                     { name: 'ID' },
                                     { name: 'CODE' },
                                     { name: 'DESCRIPTION' }
                                  ]
                 });
                 businessStore.loadData(obj);
                 createZoneStore();
             }  //   function OnSucceeded(result) {
             function OnFailedshowTypeOfBusiness(error) {
                 msg(error, errMsgShow);
             }
// จบสร้าง combo box BusinessType

// สร้าง combo box ZoneType
             function createZoneStore() {
                 PageMethods.showTypeOfZone(OnSucceededShowTypeOfZone, OnFailedShowTypeOfZone);
             }
             function OnSucceededShowTypeOfZone(result) {
                 var obj = eval('(' + result + ')');
                 //alert(obj);
                  zoneStore = new Ext.data.JsonStore({
                     storeId: 'zoneStoreID',
                     root: 'data',
                     fields: [
                                     { name: 'ID' },
                                     { name: 'CODE' },
                                     { name: 'DESCRIPTION' }
                                  ]
                 });
                 zoneStore.loadData(obj);
                 // หลังจากสร้าง store ครบแล้วทำการ สร้าง form
                 createForm();
                 createWindows();
             }  //   function OnSucceeded(result) {
             function OnFailedShowTypeOfZone(error) {
                 msg(error, errMsgShow);
             }   
// จบ  zoneType

// form  customer data
     function createForm() {

                 hdIDEN = new Ext.form.Hidden({ fieldLabel: "IDEN" });

                 txtCIF = new Ext.form.TextField({ fieldLabel: "CIF", allowBlank: false, name: "CIF", maxLength: 12, width: 100 });
                 txtNAME = new Ext.form.TextField({ fieldLabel: "Name (Th)", allowBlank: false, name: "NAME", maxLength: 50, width: 300 });
                txtNAME_ENG = new Ext.form.TextField({ fieldLabel: "Name (En)", allowBlank: false, name: "NAME_ENG", maxLength: 50, width: 300 });
            
             //   txtACCOUNT = new Ext.form.NumberField({ fieldLabel: "ACCOUNT", name: "ACCOUNT",allowBlank: true, minLength: 1, maxLength: 20, width: 100});   // ไม่ใช้ตอนนี้
                txtLIMIT = new Ext.form.TextField({ fieldLabel: "Limit", allowBlank: true, name: "LIMIT", maxLength: 20, width: 100,
                    listeners: { change:
                                                         function(object) {
                                                             var newValue = object.getValue();
                                                             newValue = Ext.util.Format.number(newValue, '0,000');
                                                             object.setValue(newValue);
                                                         }
                    }
                });
                txtOS_CASH = new Ext.form.TextField({ fieldLabel: "OS Cash", allowBlank: true, name: "OS_CASH", maxLength: 20, width: 100,
                    listeners: { change:
                                                         function(object) {
                                                             var newValue = object.getValue();
                                                             newValue = Ext.util.Format.number(newValue, '0,000');
                                                             object.setValue(newValue);
                                                         }
                    }
                });
                txtOS_NONE_CASH = new Ext.form.TextField({ fieldLabel: "OS Non Cash", allowBlank: true, name: "OS_NONE_CASH", maxLength: 20, width: 100,
                    listeners: { change:
                                                         function(object) {
                                                             var newValue = object.getValue();
                                                             newValue = Ext.util.Format.number(newValue, '0,000');
                                                             object.setValue(newValue);
                                                         }
                    }
                });
                txtOtherBusiness = new Ext.form.TextField({ fieldLabel: "Others business",  allowBlank: true, name: "OTHER_BUSINESS", maxLength: 100, width: 200 });
                 txtLocation = new Ext.form.TextField({ fieldLabel: "Location ", allowBlank: true, name: "LOCATION", maxLength: 100, width: 200 });
           
                 txtREMARK = new Ext.form.TextArea ({ fieldLabel: "Remark", allowBlank: true, name: "REMARK", maxLength: 255, width: 320 });
      
                dtCONTRACT_DATE = new Ext.form.DateField({ fieldLabel: "Contact date", format: 'd/m/Y', allowBlank: true});
                dtAPPROVE_DATE = new Ext.form.DateField({ fieldLabel: "Approve date", format: 'd/m/Y', allowBlank: true, name: "APPROVE_DATE" });
                dtSIGNING_DATE = new Ext.form.DateField({ fieldLabel: "Signing date", format: 'd/m/Y', allowBlank: true, name: "SIGNING_DATE" });
                dtCONDITION_DATE = new Ext.form.DateField({ fieldLabel: "New Condition date", format: 'd/m/Y', allowBlank: true, name: "CONDITION_DATE" });

                  cbTypeOfHelp = new Ext.form.ComboBox({typeAhead: true,  triggerAction: 'all',   lazyRender: true,  mode: 'local',width:320,
                    store:  helpStore, valueField: 'ID', displayField: 'HELP_TYPE', fieldLabel:'Type of help' });

                    cbTypeOfApproval = new Ext.form.ComboBox({ typeAhead: true, triggerAction: 'all', lazyRender: true, mode: 'local', width: 320, 
                    store: helpStore,  valueField: 'ID', displayField: 'HELP_TYPE', fieldLabel: 'Type of approval' });

                    // Custom rendering Template
                    var custTpl = new Ext.XTemplate(
                        '<tpl for="."><div class="search-item  G{GROUPTYPE}">',
                          '<b><span >{ID} :  {BEFORE}</span></b>',
                          '<br>{AFTER}',
                          '<br><b>{DESCRIPTION}</b>',
                          '</div></tpl>'
                        );
                    cbTypeOfCust = new Ext.form.ComboBox({ typeAhead: true, triggerAction: 'all', lazyRender: true, mode: 'local', width: 320,
                    store: custStore, valueField: 'ID', displayField: 'CUST_TYPE', fieldLabel: 'Type of customer', tpl: custTpl,  itemSelector: 'div.search-item'});

                    cbTypeOfBusiness = new Ext.form.ComboBox({ typeAhead: true, triggerAction: 'all', lazyRender: true, mode: 'local', width: 320,
                        store: businessStore, valueField: 'ID', displayField: 'DESCRIPTION', fieldLabel: 'Type of Business'
                    });
                
                    cbTypeOfZone = new Ext.form.ComboBox({ typeAhead: true, triggerAction: 'all', lazyRender: true, mode: 'local', width: 320,
                        store: zoneStore , valueField: 'ID', displayField: 'DESCRIPTION', fieldLabel: 'Type of Zone'
                    });

                    cbCM = new Ext.form.ComboBox({ typeAhead: true, triggerAction: 'all', lazyRender: true, mode: 'local', width: 320, 
                    store: empStore, valueField: 'EMP_ID', displayField: 'EMP_NAME', fieldLabel: 'CM'});

                    cbHead = new Ext.form.ComboBox({ typeAhead: true, triggerAction: 'all', lazyRender: true, mode: 'local', width: 320,
                        store: empStore, valueField: 'EMP_ID', displayField: 'EMP_NAME', fieldLabel: 'CM  Head'});

                    cbLevel  = new Ext.form.ComboBox({ typeAhead: true, triggerAction: 'all', lazyRender: true, mode: 'local', width: 320,
                    store: levelStore, valueField: 'LEVEL_ID', displayField: 'LEVEL_NAME', fieldLabel: 'CM Group'});
                  
              // การแสดงผลแบ่งเป็นฝั่งซ้ายและขวา จากบนลงล่าง
                form = new Ext.FormPanel({
                    id: 'formCustomer',
                    frame: true,
                    layout: 'column', 
                    title: 'Customer  Information ',
                    items:
                     [{  
                         columnWidth: .6,
                         layout: 'form',
                        items:
                                   [txtCIF, txtNAME, txtNAME_ENG,
                                    cbTypeOfBusiness,cbTypeOfZone, 
                                    cbTypeOfHelp , cbTypeOfCust,
                                    cbTypeOfApproval,txtREMARK,
                                    cbCM ,cbHead , cbLevel]
                     }, {
                         columnWidth: .4,
                         layout: 'form',
                         border: false,
                         items:
                                  [txtLIMIT, txtOS_CASH, txtOS_NONE_CASH,
                                  txtOtherBusiness,txtLocation,
                                  dtCONTRACT_DATE,
                                  dtAPPROVE_DATE,
                                  dtSIGNING_DATE, 
                                  dtCONDITION_DATE]
                     }]
                });


                form.addButton({ id: 'btnFormUpate', text: 'Update', handler: function() {
                    if (form.getForm().isValid()) {
                        saveData();   // ทำการ update
                    } else {
                         Ext.Msg.alert('ไม่สามารถบันทึกข้อมูล', 'กรุณากรอกข้อมูลให้ครบถ้วน', 1);
                    }
                }
                });
                   form.addButton({ id: 'btnFormClear', text: 'Cancel', handler: function() { windows.hide(); } });
  
        }    // createForm

        function saveData() {
        
            var IDEN = hdIDEN.getValue();
            //alert(IDEN);
            var CIF = txtCIF.getValue();
            var NAME = txtNAME.getValue();
            var NAME_ENG = txtNAME_ENG.getValue();
            var LIMIT = txtLIMIT.getValue();
            //var ACCOUNT = txtACCOUNT.getValue();
            var TYPE_OF_BUSINESS = cbTypeOfBusiness.getValue();
            var OTHER_BUSINESS = txtOtherBusiness.getValue();
            var TYPE_OF_ZONE = cbTypeOfZone.getValue();
            var LOCATION = txtLocation.getValue();
            var TYPE_OF_HELP = cbTypeOfHelp.getValue();
            var TYPE_OF_APPROVAL = cbTypeOfApproval .getValue();
            var CUSTOMER_TYPE = cbTypeOfCust.getValue();
            var CM = cbCM.getValue(); 
            var CM_HEAD = ' ';  // กำหนดให้เป็นค่าว่างไปก่อน เพราะตอนนี้ดึงค่าจาก fcontrollinline full
            var CM_GROUP = ' ';
            var REMARK = txtREMARK.getValue();
            var CONTRACT_DATE = dtCONTRACT_DATE.getValue();
            var APPROVE_DATE = dtAPPROVE_DATE.getValue();
            var SINGNING_DATE = dtSIGNING_DATE.getValue();
            var CONDITION_DATE = dtCONDITION_DATE.getValue();

            if (CIF == '') {
                Ext.Msg.alert('ไม่สามารถบันทึกข้อมูล', 'กรุณากรอก CIF', 0, 0);
                return;
            }
            if (NAME  == '') {
                Ext.Msg.alert('ไม่สามารถบันทึกข้อมูล', 'กรุณากรอก NAME', 0, 0);
                return;
            }
            if (NAME_ENG == '') {
                Ext.Msg.alert('ไม่สามารถบันทึกข้อมูล', 'กรุณากรอก NAME (en) ', 0, 0);
                return;
            }
//             if (OS  == '') {
//                 OS = ' ';
//            }
//            if (ACCOUNT == '') {
//                ACCOUNT = ' ';
//            }
//            if (LIMIT  == '') {
//                LIMIT = ' ';
//            }

            if (TYPE_OF_HELP == '') {
                TYPE_OF_HELP = 0;
            }
            if (TYPE_OF_APPROVAL  == '') {
                TYPE_OF_APPROVAL = 0;
            }
            if (CUSTOMER_TYPE == '') {
                CUSTOMER_TYPE = 0;
            }
            if (TYPE_OF_BUSINESS == '') {
                TYPE_OF_BUSINESS = 0;
            }
            if ( TYPE_OF_ZONE  == '') {
                TYPE_OF_ZONE = 0;
            }
            if (CONTRACT_DATE) {
                CONTRACT_DATE = CONTRACT_DATE.format('dd/MM/yyyy');
            }
            if (APPROVE_DATE) {
                APPROVE_DATE = APPROVE_DATE.format('dd/MM/yyyy');
            }
            if (SINGNING_DATE) {
                SINGNING_DATE = SINGNING_DATE.format('dd/MM/yyyy');
            }
            if (CONDITION_DATE) {
                CONDITION_DATE = CONDITION_DATE.format('dd/MM/yyyy');
            }
            

            Ext.Msg.wait;
            PageMethods.updateCustomer(
                        IDEN, CIF,LIMIT,
                        TYPE_OF_BUSINESS, OTHER_BUSINESS,
                        TYPE_OF_ZONE,LOCATION,
                        CONTRACT_DATE, TYPE_OF_HELP, 
                        APPROVE_DATE, TYPE_OF_APPROVAL, 
                        SINGNING_DATE, CONDITION_DATE, CUSTOMER_TYPE, 
                        CM, CM_HEAD, CM_GROUP, 
                        REMARK, EMP_ID
                       ,SuccessUpdate
                     , FailUpdate
                 );
        
        }
            function SuccessUpdate(result) {
                if (result == '1') {
                  // Ext.Msg.alert('แสดงผลการบันทึก', 'บันทึกข้อมูลเรียบร้อยแล้ว', 1);
                    Ext.MessageBox.alert('แสดงผลการบันทึก', 'บันทึกข้อมูลเรียบร้อยแล้ว', 1);
                    
                    windows.hide();  // windows นี้สร้างเอง กำหนดให้ซ่อน
                    if (NewLoadWhenUpdate == true) {
                          grid.destroy();
                        createRedShirtStore();
                    }
                }
            }
            function FailUpdate(error) {
                msg(errorMsgUpdate,errorMsgConnect,2);
            }
    

    function createWindows() {
        windows = new Ext.Window({
            width: 900,
            height: 500,
            frame: true,
            modal: true,
            minWidth: 500,
            minHeight: 500,
            layout: 'fit',
            plain: true,
            bodyStyle: 'padding:2px;',
            closeAction: 'destroy',
            items: form
         });
    } // function Create window


    // Show form update
    function showFormUpdate() {
    
  try {
                actionform = 'update'; // set  สถานะให้เป็นการ update
                // windows.show();
                // windows.setTitle('Update Employee');   

                var record = grid.getSelectionModel().getSelected();
                //msg(record.get('IDEN'));
                hdIDEN.setValue(record.get('IDEN'));
                txtCIF.setValue(record.get('CIF'));
                txtNAME.setValue(record.get('NAME'));
                txtNAME_ENG.setValue(record.get('NAME_ENG'));
               
                txtLIMIT.setValue(record.get('LIMIT'));
               
               // txtACCOUNT.setValue(record.get('ACCOUNT'));
                txtOS_CASH.setValue(record.get('OS_CASH'));
                txtOS_NONE_CASH.setValue(record.get('OS_NONE_CASH'));
                txtOtherBusiness.setValue(record.get('OTHER_BUSINESS'));
                txtLocation.setValue(record.get('LOCATION'));
                txtREMARK.setValue(record.get('REMARK'));
                
                dtAPPROVE_DATE.setValue(record.get('APPROVE_DATE'));
                dtCONDITION_DATE.setValue(record.get('CONDITION_DATE'));
                dtCONTRACT_DATE.setValue(record.get('CONTRACT_DATE'));
                dtSIGNING_DATE.setValue(record.get('SIGNING_DATE'));

                cbTypeOfHelp.setValue(record.get('TYPE_OF_HELP'));
                cbTypeOfCust.setValue(record.get('CUSTOMER_TYPE'));
                cbTypeOfApproval.setValue(record.get('TYPE_OF_APPROVAL'));
                cbTypeOfBusiness.setValue(record.get('TYPE_OF_BUSINESS'));
                cbTypeOfZone.setValue(record.get('AFFECTED_ZONE'));
                
               // alert(record.get('CM_ID'));
                cbCM.setValue(record.get('CM_ID'));
                cbHead.setValue(record.get('HEAD_ID'));
                cbLevel.setValue(record.get('LEVEL_ID'));
                //        txtEMPSURNAME.setValue(record.get('EMP_SURNAME'));
                //        dtDATEOFBIRTH.setValue(record.get('DATEOFBIRTH'));
                //        dtDATEOFSTART.setValue(record.get('DATEOFSTART'));
                //cbROLE.selectByValue(record.get('ROLE'));
                  windows.show();  
    }
       catch (err) {
           alert(err);
           Ext.Msg.alert('ไม่สามารถแสดงผล', 'กำลังเริ่มแสดงข้อมูลใหม่');
           window.location.reload(); 
        }     
   
    } //// showUpdate

       
    function searchData() {
        alert(redshirtstore.getCount());
    }

 
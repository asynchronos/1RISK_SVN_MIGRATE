if (window.screen) {
    self.moveTo(0, 0);
    self.focus();
    self.resizeTo(screen.availWidth, screen.availHeight);
}
var rowPerPage = 50;
var pmProxy;
var store;
var pagingBar;
var grid;
var selectAuth;
var pnl;
Ext.onReady(function() {

    selectAuth = 'm';
    CreateGrid();
    store.load({
        params: {
            start: 0,
            limit: rowPerPage
        }
    });
});  // Ext.onReady

function updateWait(ID, chk) {
    // alert('id=' + id + ',chk=' + chk);
    if (chk) {
        ACTION = 'add';
    } else {
        ACTION = 'del';
    }
    PageMethods.updateStatusNoUpload(ID, ACTION, OnSucceededUpdate, OnFailedUpdate);
}

function OnSucceededUpdate(msg) {
    if (msg == '1') {
        //  alert(' บันทึกข้อมูลเรียบร้อย ');  
        Ext.example.msg('สถานะการบันทึก', 'บันทึกข้อมูลเรียบร้อย');
    } else {
        Ext.example.msg('สถานะการบันทึก', 'เกิดความผิดพลาดในการบันทึกข้อมูล');
    }
}
function OnFailedUpdate(error) {
    Ext.example.msg('สถานะการบันทึก', 'ไม่สามารถติดต่อ server ในขณะนี้');
}

function openwin(id) {
    url = '../uploadfile/UploadFile.aspx?annals_id=' + id
    //   mywindow = window.open(url, "mywindow", "location=1,status=1,scrollbars=1,width=900,height=500");
    //  mywindow.moveTo(0, 0);
    //   mywindow.focus();
    var smeGroupWin;
    if (!smeGroupWin) {
        smeGroupWin = new Ext.Window({
            id: 'smeGroupWindow',
            title: 'อัพโหลดเอกสาร C/A',
            layout: 'fit',
            width: 800,
            height: 550,
            modal:true,
            autoDestroy: true,
            closable: true,
            plain: true,
            items: new Ext.ux.IFrameComponent({
                id: 'smeGroupIframe',
                url: url,
                myId: 'smeGroupIframe'
            })
        });
    }
    smeGroupWin.show(this);

}


function filterCust(auth) {
    // กรณีที่เปลี่ยน filter  ที่ไม่ใช่ pagenumber ต้องสร้าง proxy ,store , grid ใหม่
    selectAuth = auth
    grid.destroy();
    CreateGrid();
    store.load({
        params: {
            start: 0,
            limit: rowPerPage
        }
    });

}
function CreateGrid() {
    // lets make an object of pagemethod proxy first
    // lets make an object of pagemethod proxy first


    pmProxy = new Ext.data.PageMethodProxy({
        pageMethod: 'searchNoUpload',
        extraParams: {
            selectAuth: selectAuth
        }
    });
    // create the Data Store
    store = new Ext.data.JsonStore({
        root: 'data',
        totalProperty: 'RowCount',
        idProperty: 'ReportID',
        fields: [
                              'ID', 'CIF', 'CUSTOMER', 'EMPLOYEE', 'APPTYPE', 'PROCESS', 'APPDATE', 'FILE2', 'FILE14', 'WAITING'
                   ],
        proxy: pmProxy
    });

    // create paging bar
    pagingBar = new Ext.PagingToolbar({
        pageSize: rowPerPage,
        store: store,
        emptyMsg: "No topics to display",
        displayInfo: true,
        plugins: new Ext.ux.ProgressBarPager()
    });

    function createCheckBox(val) {
        //alert(val);
        if (val == '1') {
            return '<input type="checkbox" onclick="alert(this.checked)"  checked>';
        } else {
            return '<input type="checkbox"  onclick="alert(this.checked)"  >';
        }
    } // function create checkbox

    combo = new Ext.form.ComboBox({
        typeAhead: true,
        width: 200,
        renderTo: 'cbAuth',
        triggerAction: 'all',
        lazyRender: true,
        mode: 'local',
        emptyText: ' เลือกประเภทอำนาจ... ',
        store: new Ext.data.ArrayStore({
            id: 0,
            fields: [
                          'id', 'desc'
                  ],
            data: [['s', 'สินเชื่อในอำนาจบุคคล'], ['m', 'สินเชื่อในอำนาจคณะกรรมการ กสช. ']]
        }),
        valueField: 'id',
        displayField: 'desc',
        listeners: {
            'select': function() {
                filterCust(this.getValue());
            }
        }
    });


    lblSearch = new Ext.form.Label({ text: ' ค้นหาประเภทอำนาจ ', enableKeyEvents: true });
    toolbar1 = new Ext.Toolbar();
    toolbar1.add(lblSearch);
    toolbar1.add(combo);

    // create the grid
    grid = new Ext.grid.GridPanel({
        // el: 'grid-ca',
        renderTo: 'grid-ca',
        tbar: toolbar1,
        //  height: screen.availHeight - 200,
        title: 'รายการ C/A ที่ยังไม่มี FILE SCAN',
        store: store,
        layout: 'fit',
        stripeRows: true,
        loadMask: true,
        enableHdMenu: false,
        // grid columns
        columns: [
                                    { header: "รอเอกสาร", dataIndex: 'WAITING', width: 80,
                                        // renderer: function(value, metaData, record, rowIndex, colIndex, store) { // เรียงตามนี้นะ
                                        renderer: function(value, metaData, record) {
                                            var id = record.data['ID'];
                                            if (value == '1') {
                                                return '<input type="checkbox" onclick="updateWait(' + id + ',this.checked)"  checked>';
                                            } else {
                                                return '<input type="checkbox"  onclick="updateWait(' + id + ',this.checked)"  >';
                                            }
                                        }
                                     },
                                    { header: "เลขที่หนังสือ", id: 'ID', dataIndex: 'ID', width: 100,
                                        renderer: function(value) {
                                            return '<span class="link"  onclick="openwin(' + value + ')">' + value + '</span>';
                                        }
                                    },
                                    { header: "CIF", dataIndex: 'CIF', width: 100 },
                                    { header: "ลูกค้า", dataIndex: 'CUSTOMER', width: 200 },
                                    { header: "พนักงาน", dataIndex: 'EMPLOYEE', width: 200 },
                                    { header: "ประเภท", dataIndex: 'APPTYPE', width: 200 },
                                    { header: "ขั้นตอน", dataIndex: 'PROCESS', width: 200 },
                                    { header: "วันที่", dataIndex: 'APPDATE', width: 100 },
                                    { header: "ขาดเอกสาร", width: 200,
                                        renderer: function(value, metaData, record) {
                                            var str;
                                            var FILE2 = record.data['FILE2'];
                                            var FILE14 = record.data['FILE14'];
                                            if (FILE2 == '') {
                                                str = '<li> รายงานการวิเคราะห์ </li> ';
                                            }
                                            if (FILE14 == '') {
                                                str = '<li> CA อนุมัติครั้งนี้ </li>';
                                            }
                                            if (FILE2 == '' && FILE14 == '') {
                                                //str = '<li> รายงานการวิเคราะห์ </li> <li> CA อนุมัติครั้งนี้ </li>';
                                                str = '<li> รายงานการวิเคราะห์  และ CA อนุมัติครั้งนี้ </li>';
                                            }
                                            return str;
                                        }
                                    }
],
        // put paging bar on the bottom
        bbar: pagingBar
    });
    //grid.render();
    pnl = new Ext.Viewport({
        id: 'panel',
        frame: true,
        layout: 'fit',
        items: grid,
        region: 'center',
        margins: '5 5 5 0'
    });
}  // function CreateGrid
Ext.ns('Ext.ux');

Ext.ux.IFrameComponent = Ext.extend(Ext.BoxComponent, {
    onRender: function(ct, position) {
        this.el = ct.createChild({ tag: 'iframe', id: 'iframe-' + this.id, frameBorder: 0, src: this.url ,myId: this.myId});
    }
});


Ext.ux.IFramePanel = Ext.extend(Ext.Panel, {
    iframeId: this.iframId,
    url: this.url,

    getIframeId: function() {
        return this.iframeId;
    },

    getUrl: function() {
        return this.url;
    },

    changeUrl: function() {

    },

    reloadIframe: function() {

    }
});

Ext.onReady(function() {
    var win;
//    var button = Ext.get('butt');
    //get button by property iden=test
    var button = Ext.select('[iden=test]');

    button.on('click', function(e, t) {
        // create the window on the first click and reuse on subsequent clicks
        if (!win) {
            win = new Ext.Window({
                id: 'TestPanelWindow',
                title: 'Detail',
                layout: 'fit',
                width: 500,
                height: 300,
                closable: false,
                closeAction: 'hide',
                plain: true,

                items: new Ext.ux.IFrameComponent({
                    id: 'TestIframe',
                    url: './myTab2.html',
                    myId: 'ltvDetail'
                }),

                buttons: [{
                    text: 'Close',
                    handler: function() {
                        window.top.location.reload();
                        //win.hide();
                    }
                }]
            });
        }

        win.show(this);

        //change iframe src by use targetLink of button
        var iframe;
        if (iframe = Ext.select('iframe[myId=ltvDetail]').item(0))
            iframe.dom.src = Ext.fly(t.id).getAttributeNS(null, 'targetLink');
        
    });


    ////    var p = new Ext.ux.IFramePanel({
    ////        id: 'TestPanelIframe',
    ////        closable: true,
    ////        layout: 'fit',
    ////        title: 'My Panel',
    ////        collapsible: true,
    ////        renderTo: 'container',
    ////        items: [new Ext.ux.IFrameComponent({
    ////            id: 'TestIframe',
    ////            url: this.url,
    ////            myId: 'ltvDetail'
    ////        })], url: 'http://www.google.com'
    ////    });
    //    
    //    //    alert(p.getUrl());
});

function test() {
    alert('start');
    alert(Ext.select('iframe[myId=ltvDetail]').item(0).dom.src = 'http://www.google.com');
    alert('end');

//    var p = new Ext.ux.IFramePanel({
//        id: 'TestPanelIframe',
//        closable: true,
//        layout: 'fit',
//        title: 'My Panel',
//        collapsible: true,
//        renderTo: 'container',
//        items: [new Ext.ux.IFrameComponent({
//            id: 'TestIframe',
//            url: 'http://www.google.com',
//            myId: 'ltvDetail'
//        })]
//    });
}
//Ext.onReady(function() {
//    var p = new Ext.Panel({
//        id: 'TestPanelIframe',
//        closable: true,
//        layout: 'fit',
//        title: 'My Panel',
//        collapsible: true,
//        renderTo: 'container',
//        items: [new Ext.ux.IFrameComponent({
//            id: 'TestIframe',
//            url: 'http://www.google.com'
//        })]
//    });

//    alert(p.items.constructor);
//});
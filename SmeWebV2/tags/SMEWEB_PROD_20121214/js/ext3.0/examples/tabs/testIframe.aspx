<%@ Page Language="VB" AutoEventWireup="false" CodeFile="testIframe.aspx.vb" Inherits="testIframe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../resources/css/ext-all.css" />
    <script type="text/javascript" src="../../../common.js"></script>
    <script type="text/javascript" src="../../../js/jquery.js"></script>
    <script type="text/javascript" src="../../adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="../../ext-all.js"></script>
    
    <script type="text/javascript" >
        Ext.ns('Ext.ux');

        Ext.ux.IFrameComponent = Ext.extend(Ext.BoxComponent, {
            onRender: function(ct, position) {
                this.el = ct.createChild({ tag: 'iframe', id: 'iframe-' + this.id, frameBorder: 0, src: this.url, myId: this.myId });
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
                    iframe.dom.src = Ext.get(t.id).getAttributeNS(null, 'targetLink');

            });

        });
    </script>
    
    <link rel="stylesheet" type="text/css" href="../shared/examples.css" />
    
    <style type="text/css">
        .x-panel-body p {
            margin:10px;
        }
        #container {
            padding:10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input type="button" id="butt" value="test" iden="test" targetLink="http://leader1" onclick="test();" />
        </div>
    </form>
</body>
</html>

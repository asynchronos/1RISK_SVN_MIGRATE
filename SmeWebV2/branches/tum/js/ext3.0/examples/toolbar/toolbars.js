/*
 * Ext JS Library 3.0 RC1
 * Copyright(c) 2006-2009, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */


Ext.onReady(function(){
   
    var SamplePanel = Ext.extend(Ext.Panel, {
        width: 500,
        height:250,
        style: 'margin-top:15px',
        bodyStyle: 'padding:10px',
        renderTo: 'docbody',
        html: Ext.example.shortBogusMarkup,
        autoScroll: true
    });

    new SamplePanel({
        title: 'Standard',
        tbar: [{
            xtype:'splitbutton',
            text: 'Hideous',
            iconCls: 'add16',
            menu: [{text: 'Ribbons are hideous'}]
        },'-',{
            xtype:'splitbutton',
            text: 'Cut',
            iconCls: 'add16',
            menu: [{text: 'Hideousness'}]
        },{
            text: 'Copy',
            iconCls: 'add16'
        },{
            text: 'Paste',
            iconCls: 'add16',
            menu: [{text: 'Hideousness'}]
        },'-',{
            text: 'Format',
            iconCls: 'add16'
        }]
    });

    new SamplePanel({
        title: 'Multi columns',
        tbar: [{
            xtype: 'buttongroup',
            title: 'Clipboard',
            columns: 2,
            defaults: {
                scale: 'small'
            },
            items: [{
                xtype:'splitbutton',
                text: 'Hideous',
                iconCls: 'add16',
                menu: [{text: 'Ribbons are hideous'}]
            },{
                xtype:'splitbutton',
                text: 'Cut',
                iconCls: 'add16',
                menu: [{text: 'Hideousness'}]
            },{
                text: 'Copy',
                iconCls: 'add16'
            },{
                text: 'Paste',
                iconCls: 'add16',
                menu: [{text: 'Hideousness'}]
            },{
                text: 'Format',
                iconCls: 'add16'
            }]
        },{
            xtype: 'buttongroup',
            title: 'Other Bugus Actions',
            columns: 2,
            defaults: {
                scale: 'small'
            },
            items: [{
                xtype:'splitbutton',
                text: 'Hideous',
                iconCls: 'add16',
                menu: [{text: 'Ribbons are hideous'}]
            },{
                xtype:'splitbutton',
                text: 'Cut',
                iconCls: 'add16',
                menu: [{text: 'Hideousness'}]
            },{
                text: 'Copy',
                iconCls: 'add16'
            },{
                text: 'Paste',
                iconCls: 'add16',
                menu: [{text: 'Hideousness'}]
            },{
                text: 'Format',
                iconCls: 'add16'
            }]
        }]
    });



    new SamplePanel({
        title: 'Multi columns (No titles, double stack)',
        tbar: [{
            xtype: 'buttongroup',
            columns: 3,
            defaults: {
                scale: 'small'
            },
            items: [{
                xtype:'splitbutton',
                text: 'Hideous',
                iconCls: 'add16',
                menu: [{text: 'Ribbons are hideous'}]
            },{
                xtype:'splitbutton',
                text: 'Cut',
                iconCls: 'add16',
                menu: [{text: 'Hideousness'}]
            },{
                text: 'Copy',
                iconCls: 'add16'
            },{
                text: 'Paste',
                iconCls: 'add16',
                menu: [{text: 'Hideousness'}]
            },{
                text: 'Format',
                iconCls: 'add16'
            }]
        },{
            xtype: 'buttongroup',
            columns: 3,
            defaults: {
                scale: 'small'
            },
            items: [{
                xtype:'splitbutton',
                text: 'Hideous',
                iconCls: 'add16',
                menu: [{text: 'Ribbons are hideous'}]
            },{
                xtype:'splitbutton',
                text: 'Cut',
                iconCls: 'add16',
                menu: [{text: 'Hideousness'}]
            },{
                text: 'Copy',
                iconCls: 'add16'
            },{
                text: 'Paste',
                iconCls: 'add16',
                menu: [{text: 'Hideousness'}]
            },{
                text: 'Format',
                iconCls: 'add16'
            }]
        }]
    });

    new SamplePanel({
        title: 'Mix and match icon sizes to create a huge unusable toolbar',
        tbar: [{
            xtype: 'buttongroup',
            columns: 3,
            title: 'Clipboard',
            items: [{
                text: 'Paste',
                scale: 'large',
                rowspan: 3, iconCls: 'add',
                iconAlign: 'top',
                cls: 'x-btn-as-arrow'
            },{
                xtype:'splitbutton',
                text: 'Hideous',
                scale: 'large',
                rowspan: 3,
                iconCls: 'add',
                iconAlign: 'top',
                arrowAlign:'bottom',
                menu: [{text: 'Ribbons are hideous'}]
            },{
                xtype:'splitbutton', text: 'Cut', iconCls: 'add16', menu: [{text: 'Hideousness'}]
            },{
                text: 'Copy', iconCls: 'add16'
            },{
                text: 'Format', iconCls: 'add16'
            }]
        },{
            xtype: 'buttongroup',
            columns: 3,
            title: 'Other Actions',
            items: [{
                text: 'Paste',
                scale: 'large',
                rowspan: 3, iconCls: 'add',
                iconAlign: 'top',
                cls: 'x-btn-as-arrow'
            },{
                xtype:'splitbutton',
                text: 'Hideous',
                scale: 'large',
                rowspan: 3,
                iconCls: 'add',
                iconAlign: 'top',
                arrowAlign:'bottom',
                menu: [{text: 'Ribbons are hideous'}]
            },{
                xtype:'splitbutton', text: 'Cut', iconCls: 'add16', menu: [{text: 'Hideousness'}]
            },{
                text: 'Copy', iconCls: 'add16'
            },{
                text: 'Format', iconCls: 'add16'
            }]
        }]
    });

    new SamplePanel({
        title: 'Medium icons, arrows to the bottom',
        tbar: [{
            xtype: 'buttongroup',
            title: 'Clipboard',
            defaults: {
                scale: 'medium',
                iconAlign:'top'
            },
            items: [{
                xtype:'splitbutton',
                text: 'Hideous',
                iconCls: 'add24',
                arrowAlign:'bottom',
                menu: [{text: 'Ribbons are hideous'}]
            },{
                xtype:'splitbutton',
                text: 'Cut',
                iconCls: 'add24',
                arrowAlign:'bottom',
                menu: [{text: 'Hideousness'}]
            },{
                text: 'Copy',
                iconCls: 'add24',
                cls: 'x-btn-as-arrow'
            },{
                text: 'Paste',
                iconCls: 'add24',
                arrowAlign:'bottom',
                menu: [{text: 'Hideousness'}]
            },{
                text: 'Format<br/>Stuff',
                iconCls: 'add24'
            }]
        },{
            xtype: 'buttongroup',
            title: 'Other Bogus Actions',
            defaults: {
                scale: 'medium',
                iconAlign:'top'
            },
            items: [{
                xtype:'splitbutton',
                text: 'Hideous',
                iconCls: 'add24',
                arrowAlign:'bottom',
                menu: [{text: 'Ribbons are hideous'}]
            },{
                xtype:'splitbutton',
                text: 'Cut',
                iconCls: 'add24',
                arrowAlign:'bottom',
                menu: [{text: 'Hideousness'}]
            },{
                text: 'Copy',
                iconCls: 'add24',
                cls: 'x-btn-as-arrow'
            },{
                text: 'Paste',
                iconCls: 'add24',
                arrowAlign:'bottom',
                menu: [{text: 'Hideousness'}]
            },{
                text: 'Format',
                iconCls: 'add24',
                cls: 'x-btn-as-arrow'
            }]
        }]
    });


    new SamplePanel({
        title: 'Medium icons, text and arrows to the left',
        tbar: [{
            xtype:'buttongroup',
            items: [{
                text: 'Cut',
                iconCls: 'add24',
                scale: 'medium'
            },{
                text: 'Copy',
                iconCls: 'add24',
                scale: 'medium'
            },{
                text: 'Paste',
                iconCls: 'add24',
                scale: 'medium',
                menu: [{text: 'Hideousness'}]
            }]
        }, {
            xtype:'buttongroup',
            items: [{
                text: 'Format',
                iconCls: 'add24',
                scale: 'medium'
            }]
        }]
    });

    new SamplePanel({
        title: 'Small icons, text and arrows to the left',
        tbar: [{
            xtype:'buttongroup',
            items: [{
                text: 'Cut',
                iconCls: 'add16',
                scale: 'small'
            },{
                text: 'Copy',
                iconCls: 'add16',
                scale: 'small'
            },{
                text: 'Paste',
                iconCls: 'add16',
                scale: 'small',
                menu: [{text: 'Hideousness'}]
            }]
        }, {
            xtype:'buttongroup',
            items: [{
                text: 'Format',
                iconCls: 'add16',
                scale: 'small'
            }]
        }]
    });

});
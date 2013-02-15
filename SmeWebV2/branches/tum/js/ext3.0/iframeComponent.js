Ext.ns('Ext.ux');

Ext.ux.IFrameComponent = Ext.extend(Ext.BoxComponent, {
    onRender: function(ct, position) {
        this.el = ct.createChild({ tag: 'iframe', id: 'iframe-' + this.id, frameBorder: 0, src: this.url, myId: this.myId });
    },
    setSrc: function(src) {
        var iframe;
        if (iframe = Ext.fly('iframe-' + this.id))
            iframe.dom.src = src;
        alert(iframe.id);
    }
});
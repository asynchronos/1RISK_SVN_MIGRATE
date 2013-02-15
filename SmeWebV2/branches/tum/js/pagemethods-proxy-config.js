Ext.data.PageMethodProxy = function(config) {
    Ext.data.PageMethodProxy.superclass.constructor.call(this);
    Ext.apply(this, config);
};

Ext.data.PageMethodProxy.TRANS_ID = 1000;
Ext.data.PageMethodProxy.arr_trans = Array();

Ext.extend(Ext.data.PageMethodProxy, Ext.data.DataProxy, {
    load: function(params, reader, callback, scope, arg) {
        //   alert('load');
        if (this.fireEvent("beforeload", this, params) !== false) {

            var p = Ext.apply(params, this.extraParams);
           //  alert(Ext.encode(p));  // แสดง parameter
            var transId = ++Ext.data.PageMethodProxy.TRANS_ID;
            var trans = {
                id: transId,
                params: params,
                arg: arg,
                callback: callback,
                scope: scope,
                reader: reader
            };
            eval("PageMethods." + this.pageMethod + "(p.start,p.limit,p.selectAuth,this.handleResponse)");
            // eval("PageMethods." + this.pageMethod + "(0,10,this.handleResponse)");
            Ext.data.PageMethodProxy.arr_trans[Ext.data.PageMethodProxy.TRANS_ID] = trans;
        }
        else {
            callback.call(scope || this, null, arg, false);
        }


    },

    isLoading: function() {
        // alert('function is loading ');
        return this.trans ? true : false;
    },

    abort: function() {
        //  alert('function is abord ');
        if (this.isLoading()) {
            this.destroyTrans(this.trans);
        }
    },

    handleResponse: function(o) {
        // alert('function is handleResponse ');
        var trans = Ext.data.PageMethodProxy.arr_trans[Ext.data.PageMethodProxy.TRANS_ID];
        var result;
        try {
            // alert(o.toString()); 
            // แปลงให้เป็น obj เนื่องจากระบบส่งมาเป็น string json
            //result = eval('(' + o + ')');
            result = Ext.decode(o);
            //alert(result.data);
            //  result = trans.reader.readRecords(result.data);
            result = trans.reader.readRecords(result);
        } catch (e) {
            // alert(e)
            this.fireEvent("loadexception", this, o, trans.arg, e);
            trans.callback.call(trans.scope || window, null, trans.arg, false);
            return;
        }
        this.trans = false;
        trans.callback.call(trans.scope || window, result, trans.arg, true);
    }
});
Ext.data.PageMethodProxy = function(config){
	Ext.data.PageMethodProxy.superclass.constructor.call(this);
	Ext.apply(this, config);
};

Ext.data.PageMethodProxy.TRANS_ID = 1000;
Ext.data.PageMethodProxy.arr_trans = Array();

Ext.extend(Ext.data.PageMethodProxy, Ext.data.DataProxy, {
    load : function(params, reader, callback, scope, arg) {
        if(this.fireEvent("beforeload", this, params) !== false){

            var p = Ext.apply(params, this.extraParams);

            var transId = ++Ext.data.PageMethodProxy.TRANS_ID;
            var trans = {
                id : transId,
                params : params,
                arg : arg,
                callback : callback,
                scope : scope,
                reader : reader
            };

            eval("PageMethods." + this.pageMethod + "(p.start,p.limit,this.handleResponse)");

            Ext.data.PageMethodProxy.arr_trans[Ext.data.PageMethodProxy.TRANS_ID] = trans;
        }
        else{
            callback.call(scope||this, null, arg, false);
        }
        	        
	        
    },	
    
    isLoading : function(){
        return this.trans ? true : false;
    },
    
    abort : function(){
        if(this.isLoading()){
            this.destroyTrans(this.trans);
        }
    },
    
    handleResponse : function(o){
        var trans = Ext.data.PageMethodProxy.arr_trans[Ext.data.PageMethodProxy.TRANS_ID];
        var result;
        try {
            result = trans.reader.readRecords(o);
        }catch(e){
            this.fireEvent("loadexception", this, o, trans.arg, e);
            trans.callback.call(trans.scope||window, null, trans.arg, false);
            return;
        }
        this.trans = false;
        trans.callback.call(trans.scope||window, result, trans.arg, true);
    }
});
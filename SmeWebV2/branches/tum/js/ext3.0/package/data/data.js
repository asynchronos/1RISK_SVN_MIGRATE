/*
 * Ext JS Library 3.0 RC1
 * Copyright(c) 2006-2009, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */


Ext.data.SortTypes={none:function(s){return s;},stripTagsRE:/<\/?[^>]+>/gi,asText:function(s){return String(s).replace(this.stripTagsRE,"");},asUCText:function(s){return String(s).toUpperCase().replace(this.stripTagsRE,"");},asUCString:function(s){return String(s).toUpperCase();},asDate:function(s){if(!s){return 0;}
if(Ext.isDate(s)){return s.getTime();}
return Date.parse(String(s));},asFloat:function(s){var val=parseFloat(String(s).replace(/,/g,""));if(isNaN(val))val=0;return val;},asInt:function(s){var val=parseInt(String(s).replace(/,/g,""));if(isNaN(val))val=0;return val;}};

Ext.data.Record=function(data,id){this.id=(id||id===0)?id:Ext.data.Record.id(this);this.data=data;};Ext.data.Record.create=function(o){var f=Ext.extend(Ext.data.Record,{});var p=f.prototype;p.fields=new Ext.util.MixedCollection(false,function(field){return field.name;});for(var i=0,len=o.length;i<len;i++){p.fields.add(new Ext.data.Field(o[i]));}
f.getField=function(name){return p.fields.get(name);};return f;};Ext.data.Record.PREFIX='ext-record';Ext.data.Record.AUTO_ID=1;Ext.data.Record.EDIT='edit';Ext.data.Record.REJECT='reject';Ext.data.Record.COMMIT='commit';Ext.data.Record.id=function(rec){rec.phantom=true;return[Ext.data.Record.PREFIX,'-',Ext.data.Record.AUTO_ID++].join('');}
Ext.data.Record.prototype={dirty:false,editing:false,error:null,modified:null,phantom:false,join:function(store){this.store=store;},set:function(name,value){if(String(this.data[name])==String(value)){return;}
this.dirty=true;if(!this.modified){this.modified={};}
if(typeof this.modified[name]=='undefined'){this.modified[name]=this.data[name];}
this.data[name]=value;if(!this.editing){this.afterEdit();}},realize:function(data,id){if(!id){throw new Error("Second paramater to Record#realize must be provided");}
this.editing=true;this.phantom=false;this.id=id;this.fields.each(function(f){if(data[f.name]||data[f.mapping]){this.set(f.name,(f.mapping)?data[f.mapping]:data[f.name]);}},this);this.commit();this.editing=false;},afterEdit:function(){if(this.store){this.store.afterEdit(this);}},afterReject:function(){if(this.store){this.store.afterReject(this);}},afterCommit:function(){if(this.store){this.store.afterCommit(this);}},get:function(name){return this.data[name];},beginEdit:function(){this.editing=true;this.modified=this.modified||{};},cancelEdit:function(){this.editing=false;delete this.modified;},endEdit:function(){this.editing=false;if(this.dirty){this.afterEdit();}},reject:function(silent){var m=this.modified;for(var n in m){if(typeof m[n]!="function"){this.data[n]=m[n];}}
this.dirty=false;delete this.modified;this.editing=false;if(silent!==true){this.afterReject();}},commit:function(silent){this.dirty=false;delete this.modified;this.editing=false;if(silent!==true){this.afterCommit();}},getChanges:function(){var m=this.modified,cs={};for(var n in m){if(m.hasOwnProperty(n)){cs[n]=this.data[n];}}
return cs;},hasError:function(){return this.error!=null;},clearError:function(){this.error=null;},copy:function(newId){return new this.constructor(Ext.apply({},this.data),newId||this.id);},isModified:function(fieldName){return!!(this.modified&&this.modified.hasOwnProperty(fieldName));},isValid:function(){return this.fields.find(function(f){return(f.allowBlank==false&&Ext.isEmpty(this.data[f.name]))?true:false;},this)?false:true;},markDirty:function(){this.dirty=true;if(!this.modified){this.modified={};}
this.fields.each(function(f){this.modified[f.name]=this.data[f.name];},this);}};

Ext.StoreMgr=Ext.apply(new Ext.util.MixedCollection(),{register:function(){for(var i=0,s;s=arguments[i];i++){this.add(s);}},unregister:function(){for(var i=0,s;s=arguments[i];i++){this.remove(this.lookup(s));}},lookup:function(id){return typeof id=="object"?(id.events?id:Ext.create(id,'store')):this.get(id);},getKey:function(o){return o.storeId;}});

Ext.data.Store=function(config){this.data=new Ext.util.MixedCollection(false);this.data.getKey=function(o){return o.id;};this.baseParams={};this.paramNames={"start":"start","limit":"limit","sort":"sort","dir":"dir"};if(config&&config.data){this.inlineData=config.data;delete config.data;}
Ext.apply(this,config);if(this.url&&!this.proxy){this.proxy=new Ext.data.HttpProxy({url:this.url});}
if(this.reader){if(!this.recordType){this.recordType=this.reader.recordType;}
if(this.reader.onMetaChange){this.reader.onMetaChange=this.onMetaChange.createDelegate(this);}
if(this.writer){this.writer.meta=this.reader.meta;this.pruneModifiedRecords=true;}}
if(this.recordType){this.fields=this.recordType.prototype.fields;}
this.modified=[];this.addEvents('datachanged','metachange','add','remove','update','clear','beforeload','load','loadexception','beforesave','save','saveexception','beforedestroy','destroy','destroyexception','beforecreate','create','createexception','event');if(this.proxy){this.relayEvents(this.proxy,["loadexception"]);}
if(this.writer){this.relayEvents(this.proxy,["saveexception","createexception","destroyexception"]);this.on('add',this.createRecords.createDelegate(this));this.on('remove',this.destroyRecord.createDelegate(this));this.on('update',this.updateRecord.createDelegate(this));}
this.sortToggle={};if(this.sortField){this.setDefaultSort(this.sortField,this.sortDir);}else if(this.sortInfo){this.setDefaultSort(this.sortInfo.field,this.sortInfo.direction);}
Ext.data.Store.superclass.constructor.call(this);if(this.id){this.storeId=this.id;delete this.id;}
if(this.storeId){Ext.StoreMgr.register(this);}
if(this.inlineData){this.loadData(this.inlineData);delete this.inlineData;}else if(this.autoLoad){this.load.defer(10,this,[typeof this.autoLoad=='object'?this.autoLoad:undefined]);}};Ext.extend(Ext.data.Store,Ext.util.Observable,{writer:undefined,remoteSort:false,autoDestroy:false,pruneModifiedRecords:false,lastOptions:null,batchSave:false,removed:[],destroy:function(){if(this.storeId){Ext.StoreMgr.unregister(this);}
this.data=null;this.purgeListeners();},add:function(records){records=[].concat(records);if(records.length<1){return;}
for(var i=0,len=records.length;i<len;i++){records[i].join(this);}
var index=this.data.length;this.data.addAll(records);if(this.snapshot){this.snapshot.addAll(records);}
this.fireEvent("add",this,records,index);},addSorted:function(record){var index=this.findInsertIndex(record);this.insert(index,record);},remove:function(record){var index=this.data.indexOf(record);this.data.removeAt(index);if(this.pruneModifiedRecords){this.modified.remove(record);}
if(this.snapshot){this.snapshot.remove(record);}
this.fireEvent("remove",this,record,index);},removeAt:function(index){this.remove(this.getAt(index));},removeAll:function(){this.data.clear();if(this.snapshot){this.snapshot.clear();}
if(this.pruneModifiedRecords){this.modified=[];}
this.fireEvent("clear",this);},insert:function(index,records){records=[].concat(records);for(var i=0,len=records.length;i<len;i++){this.data.insert(index,records[i]);records[i].join(this);}
this.fireEvent("add",this,records,index);},indexOf:function(record){return this.data.indexOf(record);},indexOfId:function(id){return this.data.indexOfKey(id);},getById:function(id){return this.data.key(id);},getAt:function(index){return this.data.itemAt(index);},getRange:function(start,end){return this.data.getRange(start,end);},storeOptions:function(o){o=Ext.apply({},o);delete o.callback;delete o.scope;this.lastOptions=o;},load:function(options){options=options||{};this.storeOptions(options);if(this.sortInfo&&this.remoteSort){var pn=this.paramNames;options.params=options.params||{};options.params[pn["sort"]]=this.sortInfo.field;options.params[pn["dir"]]=this.sortInfo.direction;}
return this.execute('load',null,options);},updateRecord:function(store,record,action){if(action!=Ext.data.Record.EDIT||this.batchSave){return;}
if(!record.phantom||(record.phantom&&record.isValid)){this.save(record);}},createRecords:function(store,rs,index){if(this.batchSave==false){for(var i=0,len=rs.length;i<len;i++){if(rs[i].phantom&&rs[i].isValid()){rs[i].markDirty();this.execute('create',rs[i]);}}}
else{for(var i=0,len=rs.length;i<len;i++){if(rs[i].phantom&&rs[i].isValid()){rs[i].markDirty();this.modified.push(rs[i]);}}}},destroyRecord:function(store,record,index){if(this.modified.indexOf(record)!=-1){this.modified.remove(record);}
if(record.phantom===true){return;}
record.lastIndex=index;if(!this.batchSave){this.execute('destroy',record);}
else{this.removed.push(record);}},execute:function(action,rs,options){if(action!='load'&&!this.writer){throw new Error('Store attempted to execute the remote action "'+action+'" without a DataWriter installed.');}
options=options||{};if(this.fireEvent('before'+action,this,rs||options)){var p=Ext.apply(options.params||{},this.baseParams,{xaction:action});if(this.writer&&typeof(this.writer[action])=='function'){this.writer[action](p,rs);}
this.proxy.request(action,rs,p,this.reader,this.writer,this.createCallback(action,rs),this,options);return true;}
else{return false;}},save:function(rs){rs=rs||this.getModifiedRecords();if(!rs.length&&!rs instanceof Ext.data.Record&&!this.removed.length){return false;}
var action='save';if(this.removed.length){try{this.execute('destroy',this.removed);}
catch(e){throw e;}}
try{if(Ext.isArray(rs)){for(var i=rs.length-1;i>=0;i--){if(rs[i].phantom===true){var rec=rs.splice(i,1).shift();if(rec.isValid()){this.execute('create',rec);}}}}
else if(rs.phantom){if(!rs.isValid()){return false;}
action='create';}
if(Ext.isArray(rs)&&rs.length==1){rs=rs[0];}
if(rs instanceof Ext.data.Record||rs.length>0){this.execute(action,rs);return true;}
else{return true;}}
catch(e){throw e;}
return true;},createCallback:function(action,rs){return(action=='load')?this.loadRecords:function(data,response,success){if(success===true){switch(action){case'create':this.onCreateRecord(rs,data);break;case'destroy':this.onDestroyRecords(rs,data);break;case'save':this.onSaveRecords(rs,data);break;}
this.fireEvent(action,this,data,response);}
else{switch(action){case'destroy':if(rs instanceof Ext.data.Record){rs=[rs];}
for(var i=0,len=rs.length;i<len;i++){this.insert(rs[i].lastIndex,rs[i]);}
this.removed=[];break;}}
this.fireEvent('event',this,data,response);}},onCreateRecord:function(record,data){if(record.phantom&&data[this.reader.meta.idProperty]){record.realize(data,data[this.reader.meta.idProperty]);}},onSaveRecords:function(rs,data){if(!Ext.isArray(rs)){rs=[rs];}
for(var i=rs.length-1;i>=0;i--){rs[i].commit();}},onDestroyRecords:function(rs,data){this.removed=[];},reload:function(options){this.load(Ext.applyIf(options||{},this.lastOptions));},loadRecords:function(o,options,success){if(!o||success===false){if(success!==false){this.fireEvent("load",this,[],options);}
if(options.callback){options.callback.call(options.scope||this,[],options,false);}
return;}
var r=o.records,t=o.totalRecords||r.length;if(!options||options.add!==true){if(this.pruneModifiedRecords){this.modified=[];}
for(var i=0,len=r.length;i<len;i++){r[i].join(this);}
if(this.snapshot){this.data=this.snapshot;delete this.snapshot;}
this.data.clear();this.data.addAll(r);this.totalLength=t;this.applySort();this.fireEvent("datachanged",this);}else{this.totalLength=Math.max(t,this.data.length+r.length);this.add(r);}
this.fireEvent("load",this,r,options);if(options.callback){options.callback.call(options.scope||this,r,options,true);}},loadData:function(o,append){var r=this.reader.readRecords(o);this.loadRecords(r,{add:append},true);},getCount:function(){return this.data.length||0;},getTotalCount:function(){return this.totalLength||0;},getSortState:function(){return this.sortInfo;},applySort:function(){if(this.sortInfo&&!this.remoteSort){var s=this.sortInfo,f=s.field;this.sortData(f,s.direction);}},sortData:function(f,direction){direction=direction||'ASC';var st=this.fields.get(f).sortType;var fn=function(r1,r2){var v1=st(r1.data[f]),v2=st(r2.data[f]);return v1>v2?1:(v1<v2?-1:0);};this.data.sort(direction,fn);if(this.snapshot&&this.snapshot!=this.data){this.snapshot.sort(direction,fn);}},setDefaultSort:function(field,dir){dir=dir?dir.toUpperCase():"ASC";this.sortInfo={field:field,direction:dir};this.sortToggle[field]=dir;},sort:function(fieldName,dir){var f=this.fields.get(fieldName);if(!f){return false;}
if(!dir){if(this.sortInfo&&this.sortInfo.field==f.name){dir=(this.sortToggle[f.name]||"ASC").toggle("ASC","DESC");}else{dir=f.sortDir;}}
var st=(this.sortToggle)?this.sortToggle[f.name]:null;var si=(this.sortInfo)?this.sortInfo:null;this.sortToggle[f.name]=dir;this.sortInfo={field:f.name,direction:dir};if(!this.remoteSort){this.applySort();this.fireEvent("datachanged",this);}else{if(!this.load(this.lastOptions)){if(st){this.sortToggle[f.name]=st;}
if(si){this.sortInfo=si;}}}},each:function(fn,scope){this.data.each(fn,scope);},getModifiedRecords:function(){return this.modified;},createFilterFn:function(property,value,anyMatch,caseSensitive){if(Ext.isEmpty(value,false)){return false;}
value=this.data.createValueMatcher(value,anyMatch,caseSensitive);return function(r){return value.test(r.data[property]);};},sum:function(property,start,end){var rs=this.data.items,v=0;start=start||0;end=(end||end===0)?end:rs.length-1;for(var i=start;i<=end;i++){v+=(rs[i].data[property]||0);}
return v;},filter:function(property,value,anyMatch,caseSensitive){var fn=this.createFilterFn(property,value,anyMatch,caseSensitive);return fn?this.filterBy(fn):this.clearFilter();},filterBy:function(fn,scope){this.snapshot=this.snapshot||this.data;this.data=this.queryBy(fn,scope||this);this.fireEvent("datachanged",this);},query:function(property,value,anyMatch,caseSensitive){var fn=this.createFilterFn(property,value,anyMatch,caseSensitive);return fn?this.queryBy(fn):this.data.clone();},queryBy:function(fn,scope){var data=this.snapshot||this.data;return data.filterBy(fn,scope||this);},find:function(property,value,start,anyMatch,caseSensitive){var fn=this.createFilterFn(property,value,anyMatch,caseSensitive);return fn?this.data.findIndexBy(fn,null,start):-1;},findBy:function(fn,scope,start){return this.data.findIndexBy(fn,scope,start);},collect:function(dataIndex,allowNull,bypassFilter){var d=(bypassFilter===true&&this.snapshot)?this.snapshot.items:this.data.items;var v,sv,r=[],l={};for(var i=0,len=d.length;i<len;i++){v=d[i].data[dataIndex];sv=String(v);if((allowNull||!Ext.isEmpty(v))&&!l[sv]){l[sv]=true;r[r.length]=v;}}
return r;},clearFilter:function(suppressEvent){if(this.isFiltered()){this.data=this.snapshot;delete this.snapshot;if(suppressEvent!==true){this.fireEvent("datachanged",this);}}},isFiltered:function(){return this.snapshot&&this.snapshot!=this.data;},afterEdit:function(record){if(this.modified.indexOf(record)==-1){this.modified.push(record);}
this.fireEvent("update",this,record,Ext.data.Record.EDIT);},afterReject:function(record){this.modified.remove(record);this.fireEvent("update",this,record,Ext.data.Record.REJECT);},afterCommit:function(record){this.modified.remove(record);this.fireEvent("update",this,record,Ext.data.Record.COMMIT);},commitChanges:function(){var m=this.modified.slice(0);this.modified=[];for(var i=0,len=m.length;i<len;i++){m[i].commit();}},rejectChanges:function(){var m=this.modified.slice(0);this.modified=[];for(var i=0,len=m.length;i<len;i++){m[i].reject();}},onMetaChange:function(meta,rtype,o){this.recordType=rtype;this.fields=rtype.prototype.fields;delete this.snapshot;this.sortInfo=meta.sortInfo;this.modified=[];this.fireEvent('metachange',this,this.reader.meta);},findInsertIndex:function(record){this.suspendEvents();var data=this.data.clone();this.data.add(record);this.applySort();var index=this.data.indexOf(record);this.data=data;this.resumeEvents();return index;},setBaseParam:function(name,value){this.baseParams=this.baseParams||{};this.baseParams[name]=value;}});Ext.reg('store',Ext.data.Store);

Ext.data.DirectStore=function(c){Ext.data.DirectStore.superclass.constructor.call(this,Ext.apply(c,{proxy:(typeof(c.proxy)=='undefined')?new Ext.data.DirectProxy(Ext.copyTo({},c,'paramOrder,paramsAsHash,directFn,api')):c.proxy,reader:(typeof(c.reader)=='undefined'&&typeof(c.fields)=='object')?new Ext.data.JsonReader(Ext.copyTo({},c,'totalProperty,root,idProperty'),c.fields):c.reader}));};Ext.extend(Ext.data.DirectStore,Ext.data.Store);Ext.reg('directstore',Ext.data.DirectStore);

(function(){var BEFOREREQUEST="beforerequest",REQUESTCOMPLETE="requestcomplete",REQUESTEXCEPTION="requestexception",UNDEFINED=undefined,LOAD='load',POST='POST',GET='GET',WINDOW=window;Ext.data.Connection=function(config){Ext.apply(this,config);this.addEvents(BEFOREREQUEST,REQUESTCOMPLETE,REQUESTEXCEPTION);Ext.data.Connection.superclass.constructor.call(this);};function handleResponse(response){this.transId=false;var options=response.argument.options;response.argument=options?options.argument:null;this.fireEvent(REQUESTCOMPLETE,this,response,options);if(options.success)options.success.call(options.scope,response,options);if(options.callback)options.callback.call(options.scope,options,true,response);}
function handleFailure(response,e){this.transId=false;var options=response.argument.options;response.argument=options?options.argument:null;this.fireEvent(REQUESTEXCEPTION,this,response,options,e);if(options.failure)options.failure.call(options.scope,response,options);if(options.callback)options.callback.call(options.scope,options,false,response);}
function doFormUpload(o,ps,url){var id=Ext.id(),doc=document,frame=doc.createElement('iframe'),form=Ext.getDom(o.form),hiddens=[],hd;frame.id=frame.name=id;frame.className='x-hidden';frame.src=Ext.SSL_SECURE_URL;doc.body.appendChild(frame);if(Ext.isIE){doc.frames[id].name=id;}
form.target=id;form.method=POST;form.enctype=form.encoding='multipart/form-data';form.action=url||"";ps=Ext.urlDecode(ps,false);for(var k in ps){if(ps.hasOwnProperty(k)){hd=doc.createElement('input');hd.type='hidden';hd.value=ps[hd.name=k];form.appendChild(hd);hiddens.push(hd);}}
function cb(){var me=this,r={responseText:'',responseXML:null,argument:o.argument},doc,firstChild;try{doc=frame.contentWindow.document||frame.contentDocument||WINDOW.frames[id].document;if(doc){if(doc.body){if(/textarea/i.test((firstChild=doc.body.firstChild||{}).tagName)){r.responseText=firstChild.value;}else{r.responseText=doc.body.innerHTML;}}else{responseXML=doc.XMLDocument||doc;}}}
catch(e){}
Ext.EventManager.removeListener(frame,LOAD,cb,me);me.fireEvent(REQUESTCOMPLETE,me,r,o);Ext.callback(o.success,o.scope,[r,o]);Ext.callback(o.callback,o.scope,[o,true,r]);if(!me.debugUploads){setTimeout(function(){Ext.removeNode(frame);},100);}}
Ext.EventManager.on(frame,LOAD,cb,this);form.submit();Ext.each(hiddens,function(h){Ext.removeNode(h);});}
Ext.extend(Ext.data.Connection,Ext.util.Observable,{timeout:30000,autoAbort:false,disableCaching:true,disableCachingParam:'_dc',request:function(o){var me=this;if(me.fireEvent(BEFOREREQUEST,me,o)){if(o.el){if(!Ext.isEmpty(o.indicatorText)){me.indicatorText='<div class="loading-indicator">'+o.indicatorText+"</div>";}
if(me.indicatorText){Ext.getDom(o.el).innerHTML=me.indicatorText;}
o.success=(Ext.isFunction(o.success)?o.success:function(){}).createInterceptor(function(response){Ext.getDom(o.el).innerHTML=response.responseText;});}
var p=o.params,url=o.url||me.url,method,cb={success:handleResponse,failure:handleFailure,scope:me,argument:{options:o},timeout:o.timeout||me.timeout},form,serForm;if(Ext.isFunction(p)){p=p.call(o.scope||WINDOW,o);}
p=Ext.urlEncode(me.extraParams,typeof p=='object'?Ext.urlEncode(p):p);if(Ext.isFunction(url)){url=url.call(o.scope||WINDOW,o);}
if(form=Ext.getDom(o.form)){url=url||form.action;if(o.isUpload||/multipart\/form-data/i.test(form.getAttribute("enctype"))){return doFormUpload.call(me,o,p,url);}
serForm=Ext.lib.Ajax.serializeForm(form);p=p?(p+'&'+serForm):serForm;}
method=o.method||me.method||((p||o.xmlData||o.jsonData)?POST:GET);if(method==GET&&(me.disableCaching||o.disableCaching!==false)){var dcp=o.disableCachingParam||me.disableCachingParam;url+=(url.indexOf('?')!=-1?'&':'?')+dcp+'='+(new Date().getTime());}
o.headers=Ext.apply(o.headers||{},me.defaultHeaders||{});if(o.autoAbort===true||me.autoAbort){me.abort();}
if((method==GET||o.xmlData||o.jsonData)&&p){url+=(/\?/.test(url)?'&':'?')+p;p='';}
return me.transId=Ext.lib.Ajax.request(method,url,cb,p,o);}else{return o.callback?o.callback.apply(o.scope,[o,UNDEFINED,UNDEFINED]):null;}},isLoading:function(transId){return transId?Ext.lib.Ajax.isCallInProgress(transId):!!this.transId;},abort:function(transId){if(transId||this.isLoading()){Ext.lib.Ajax.abort(transId||this.transId);}}});})();Ext.Ajax=new Ext.data.Connection({autoAbort:false,serializeForm:function(form){return Ext.lib.Ajax.serializeForm(form);}});

Ext.data.Field=function(config){if(typeof config=="string"){config={name:config};}
Ext.apply(this,config);if(!this.type){this.type="auto";}
var st=Ext.data.SortTypes;if(typeof this.sortType=="string"){this.sortType=st[this.sortType];}
if(!this.sortType){switch(this.type){case"string":this.sortType=st.asUCString;break;case"date":this.sortType=st.asDate;break;default:this.sortType=st.none;}}
var stripRe=/[\$,%]/g;if(!this.convert){var cv,dateFormat=this.dateFormat;switch(this.type){case"":case"auto":case undefined:cv=function(v){return v;};break;case"string":cv=function(v){return(v===undefined||v===null)?'':String(v);};break;case"int":cv=function(v){return v!==undefined&&v!==null&&v!==''?parseInt(String(v).replace(stripRe,""),10):'';};break;case"float":cv=function(v){return v!==undefined&&v!==null&&v!==''?parseFloat(String(v).replace(stripRe,""),10):'';};break;case"bool":case"boolean":cv=function(v){return v===true||v==="true"||v==1;};break;case"date":cv=function(v){if(!v){return'';}
if(Ext.isDate(v)){return v;}
if(dateFormat){if(dateFormat=="timestamp"){return new Date(v*1000);}
if(dateFormat=="time"){return new Date(parseInt(v,10));}
return Date.parseDate(v,dateFormat);}
var parsed=Date.parse(v);return parsed?new Date(parsed):null;};break;}
this.convert=cv;}};Ext.data.Field.prototype={dateFormat:null,defaultValue:"",mapping:null,sortType:null,sortDir:"ASC",allowBlank:true};

Ext.data.DataReader=function(meta,recordType){this.meta=meta;this.recordType=Ext.isArray(recordType)?Ext.data.Record.create(recordType):recordType;};Ext.data.DataReader.prototype={};

Ext.data.DataProxy=function(){this.addEvents('beforeload','load','beforesave','save','beforedestroy','destroy','beforecreate','create');Ext.data.DataProxy.superclass.constructor.call(this);};Ext.extend(Ext.data.DataProxy,Ext.util.Observable,{request:function(action,rs,params,reader,writer,cb,scope,options){if(!this.api[action]){if(this.url){this.api[action]=this.url;}
else if(typeof(this[action])!='function'){throw new Error('No proxy url defined for api action "'+action+'"');}}
if(this.fireEvent("before"+action,this,params)!==false){this.doRequest.apply(this,arguments);}
else{cb.call(scope||this,null,arg,false);}},doRequest:function(action,rs,params,reader,writer,cb,scope,options){this[action](params,reader,cb,scope,options);}});

Ext.data.MemoryProxy=function(data){Ext.data.MemoryProxy.superclass.constructor.call(this);this.data=data;this.api={load:true};};Ext.extend(Ext.data.MemoryProxy,Ext.data.DataProxy,{doRequest:function(action,rs,params,reader,writer,cb,scope,arg){params=params||{};var result;try{result=reader.readRecords(this.data);}catch(e){this.fireEvent("loadexception",this,arg,null,e);cb.call(scope,null,arg,false);return;}
cb.call(scope,result,arg,true);}});

Ext.data.HttpProxy=function(conn){Ext.data.HttpProxy.superclass.constructor.call(this);this.conn=conn;this.api=conn.api||{load:undefined,save:undefined,create:undefined,destroy:undefined};Ext.copyTo(this,conn,'url,prettyUrls');this.useAjax=!conn||!conn.events;};Ext.extend(Ext.data.HttpProxy,Ext.data.DataProxy,{prettyUrls:false,getConnection:function(){return this.useAjax?Ext.Ajax:this.conn;},doRequest:function(action,rs,params,reader,writer,cb,scope,arg){var o={params:params||{},request:{callback:cb,scope:scope,arg:arg},reader:reader,callback:this.createCallback(action),scope:this};if(this.useAjax){this.conn.url=this.buildUrl(action,rs);Ext.applyIf(o,this.conn);this.activeRequest=Ext.Ajax.request(o);}else{this.conn.request(o);}},buildUrl:function(action,record){record=record||null;var url=(this.api[action])?this.api[action]:this.url;if(this.prettyUrls===true&&record instanceof Ext.data.Record&&!record.phantom){url+='/'+record.id}
return url;},createCallback:function(action){return(action=='load')?function(o,success,response){if(!success){this.fireEvent("loadexception",this,o,response);o.request.callback.call(o.request.scope,null,o.request.arg,false);return;}
var result;try{result=o.reader.read(response);}catch(e){this.fireEvent("loadexception",this,o,response,e);o.request.callback.call(o.request.scope,null,o.request.arg,false);return;}
this.fireEvent("load",this,o,o.request.arg);o.request.callback.call(o.request.scope,result,o.request.arg,true);}:function(o,success,response){var reader=o.reader;var res=reader.readResponse(response);if(!res[reader.meta.successProperty]===true){this.fireEvent(action+"exception",this,o,res);o.request.callback.call(o.request.scope,null,res,false);return;}
this.fireEvent(action,this,res[reader.meta.root],res,o.request.arg);o.request.callback.call(o.request.scope,res[reader.meta.root],res,true);}}});

Ext.data.ScriptTagProxy=function(config){Ext.data.ScriptTagProxy.superclass.constructor.call(this);Ext.apply(this,config);this.api=config.api||{load:undefined,save:undefined,create:undefined,destroy:undefined};this.head=document.getElementsByTagName("head")[0];};Ext.data.ScriptTagProxy.TRANS_ID=1000;Ext.extend(Ext.data.ScriptTagProxy,Ext.data.DataProxy,{timeout:30000,callbackParam:"callback",nocache:true,doRequest:function(action,rs,params,reader,writer,cb,scope,arg){var p=Ext.urlEncode(Ext.apply(params,this.extraParams));var url=this.api[action];url+=(url.indexOf("?")!=-1?"&":"?")+p;if(this.nocache){url+="&_dc="+(new Date().getTime());}
var transId=++Ext.data.ScriptTagProxy.TRANS_ID;var trans={id:transId,cb:"stcCallback"+transId,scriptId:"stcScript"+transId,params:params,arg:arg,url:url,callback:cb,scope:scope,reader:reader};window[trans.cb]=this.createCallback(action,trans);url+=String.format("&{0}={1}",this.callbackParam,trans.cb);if(this.autoAbort!==false){this.abort();}
trans.timeoutId=this.handleFailure.defer(this.timeout,this,[trans]);var script=document.createElement("script");script.setAttribute("src",url);script.setAttribute("type","text/javascript");script.setAttribute("id",trans.scriptId);this.head.appendChild(script);this.trans=trans;},createCallback:function(action,trans){var conn=this;return(action=='load')?function(res){conn.trans=false;conn.destroyTrans(trans,true);var result;try{result=trans.reader.readRecords(res);}catch(e){conn.fireEvent("loadexception",conn,res,trans.arg,e);trans.callback.call(trans.scope||window,null,trans.arg,false);return;}
conn.fireEvent("load",conn,res,trans.arg);trans.callback.call(trans.scope||window,result,trans.arg,true);}:function(res){var reader=trans.reader;if(!res[reader.meta.successProperty]===true){conn.fireEvent(action+"exception",conn,trans,res);trans.callback.call(trans.scope,null,res,false);return;}
conn.fireEvent(action,conn,res[reader.meta.root],res,trans.arg);trans.callback.call(trans.scope||window,res[reader.meta.root],res,true);}},isLoading:function(){return this.trans?true:false;},abort:function(){if(this.isLoading()){this.destroyTrans(this.trans);}},destroyTrans:function(trans,isLoaded){this.head.removeChild(document.getElementById(trans.scriptId));clearTimeout(trans.timeoutId);if(isLoaded){window[trans.cb]=undefined;try{delete window[trans.cb];}catch(e){}}else{window[trans.cb]=function(){window[trans.cb]=undefined;try{delete window[trans.cb];}catch(e){}};}},handleFailure:function(trans){this.trans=false;this.destroyTrans(trans,false);this.fireEvent("loadexception",this,null,trans.arg);trans.callback.call(trans.scope||window,null,trans.arg,false);}});

Ext.data.DirectProxy=function(config){Ext.apply(this,config);this.api=config.api||{load:undefined,save:undefined,create:undefined,destroy:undefined};if(typeof this.paramOrder=='string'){this.paramOrder=this.paramOrder.split(/[\s,|]/);}
Ext.data.DirectProxy.superclass.constructor.call(this);};Ext.extend(Ext.data.DirectProxy,Ext.data.DataProxy,{paramOrder:undefined,paramsAsHash:true,doRequest:function(action,rs,params,reader,writer,cb,scope,options){var args=[];var directFn=this.api[action];switch(action){case'save':args.push(params[reader.meta.idProperty]);args.push(params[writer.dataProperty]);break;case'destroy':args.push(params[writer.dataProperty]);break;case'create':args.push(params[writer.dataProperty]);break;case'load':args.push(params);break;}
args.push(this.createCallback(action,reader,cb,scope,options));directFn.apply(window,args);},createCallback:function(action,reader,cb,scope,arg){return{callback:(action=='load')?function(result,e){if(!e.status){this.fireEvent(action+"exception",this,e,result);cb.call(scope,null,arg,false);return;}
var records;try{records=reader.readRecords(result);}
catch(ex){this.fireEvent(action+"exception",this,e,result,ex);cb.call(scope,null,arg,false);return;}
this.fireEvent(action,this,e,arg);cb.call(scope,records,arg,true);}:function(result,e){if(!e.status){this.fireEvent(action+"exception",this,e);cb.call(scope,null,e,false);return;}
this.fireEvent(action,this,result,e,arg);cb.call(scope,result,e,true);},scope:this}}});

Ext.data.JsonReader=function(meta,recordType){meta=meta||{};Ext.data.JsonReader.superclass.constructor.call(this,meta,recordType||meta.fields);};Ext.extend(Ext.data.JsonReader,Ext.data.DataReader,{read:function(response){var json=response.responseText;var o=Ext.decode(json);if(!o){throw{message:"JsonReader.read: Json object not found"};}
return this.readRecords(o);},onMetaChange:function(meta,recordType,o){},simpleAccess:function(obj,subsc){return obj[subsc];},getJsonAccessor:function(){var re=/[\[\.]/;return function(expr){try{return(re.test(expr))?new Function("obj","return obj."+expr):function(obj){return obj[expr];};}catch(e){}
return Ext.emptyFn;};}(),readRecords:function(o){this.jsonData=o;if(o.metaData){delete this.ef;this.meta=o.metaData;this.recordType=Ext.data.Record.create(o.metaData.fields);this.onMetaChange(this.meta,this.recordType,o);}
var s=this.meta,Record=this.recordType,f=Record.prototype.fields,fi=f.items,fl=f.length;if(!this.ef){if(s.totalProperty){this.getTotal=this.getJsonAccessor(s.totalProperty);}
if(s.successProperty){this.getSuccess=this.getJsonAccessor(s.successProperty);}
this.getRoot=s.root?this.getJsonAccessor(s.root):function(p){return p;};if(s.id||s.idProperty){var g=this.getJsonAccessor(s.id||s.idProperty);this.getId=function(rec){var r=g(rec);return(r===undefined||r==="")?null:r;};}else{this.getId=function(){return null;};}
this.ef=[];for(var i=0;i<fl;i++){f=fi[i];var map=(f.mapping!==undefined&&f.mapping!==null)?f.mapping:f.name;this.ef[i]=this.getJsonAccessor(map);}}
var root=this.getRoot(o),c=root.length,totalRecords=c,success=true;if(s.totalProperty){var v=parseInt(this.getTotal(o),10);if(!isNaN(v)){totalRecords=v;}}
if(s.successProperty){var v=this.getSuccess(o);if(v===false||v==='false'){success=false;}}
var records=[];for(var i=0;i<c;i++){var n=root[i];var values={};var id=this.getId(n);for(var j=0;j<fl;j++){f=fi[j];var v=this.ef[j](n);values[f.name]=f.convert((v!==undefined)?v:f.defaultValue,n);}
var record=new Record(values,id);record.json=n;records[i]=record;}
return{success:success,records:records,totalRecords:totalRecords};},readResponse:function(response){var json=response.responseText;var o=eval("("+json+")");if(!o){throw{message:"JsonReader.read: Json object not found"};}
return o;}});

Ext.data.XmlReader=function(meta,recordType){meta=meta||{};Ext.data.XmlReader.superclass.constructor.call(this,meta,recordType||meta.fields);};Ext.extend(Ext.data.XmlReader,Ext.data.DataReader,{read:function(response){var doc=response.responseXML;if(!doc){throw{message:"XmlReader.read: XML Document not available"};}
return this.readRecords(doc);},readRecords:function(doc){this.xmlData=doc;var root=doc.documentElement||doc;var q=Ext.DomQuery;var recordType=this.recordType,fields=recordType.prototype.fields;var sid=this.meta.idPath||this.meta.id;var totalRecords=0,success=true;if(this.meta.totalRecords){totalRecords=q.selectNumber(this.meta.totalRecords,root,0);}
if(this.meta.success){var sv=q.selectValue(this.meta.success,root,true);success=sv!==false&&sv!=='false';}
var records=[];var ns=q.select(this.meta.record,root);for(var i=0,len=ns.length;i<len;i++){var n=ns[i];var values={};var id=sid?q.selectValue(sid,n):undefined;for(var j=0,jlen=fields.length;j<jlen;j++){var f=fields.items[j];var v=q.selectValue(Ext.value(f.mapping,f.name,true),n,f.defaultValue);v=f.convert(v,n);values[f.name]=v;}
var record=new recordType(values,id);record.node=n;records[records.length]=record;}
return{success:success,records:records,totalRecords:totalRecords||records.length};}});

Ext.data.ArrayReader=Ext.extend(Ext.data.JsonReader,{readRecords:function(o){this.arrayData=o;var s=this.meta;var sid=s?(s.idIndex||s.id):null;var recordType=this.recordType,fields=recordType.prototype.fields;var records=[];if(!this.getRoot){this.getRoot=s.root?this.getJsonAccessor(s.root):function(p){return p;};if(s.totalProperty){this.getTotal=this.getJsonAccessor(s.totalProperty);}}
var root=this.getRoot(o);for(var i=0;i<root.length;i++){var n=root[i];var values={};var id=((sid||sid===0)&&n[sid]!==undefined&&n[sid]!==""?n[sid]:null);for(var j=0,jlen=fields.length;j<jlen;j++){var f=fields.items[j];var k=f.mapping!==undefined&&f.mapping!==null?f.mapping:j;var v=n[k]!==undefined?n[k]:f.defaultValue;v=f.convert(v,n);values[f.name]=v;}
var record=new recordType(values,id);record.json=n;records[records.length]=record;}
var totalRecords=records.length;if(s.totalProperty){var v=parseInt(this.getTotal(o),10);if(!isNaN(v)){totalRecords=v;}}
return{records:records,totalRecords:totalRecords};}});

Ext.data.DataWriter=function(config){Ext.apply(this,config);};Ext.data.DataWriter.prototype={meta:{},dataProperty:'data',writeAllFields:false,save:function(p,rs){if(Ext.isArray(rs)){var data=[];var ids=[];for(var n=0,len=rs.length;n<len;n++){ids.push(rs[n].id);data.push(this.saveRecord(rs[n]));}
p[this.meta.idProperty]=ids;p[this.dataProperty]=data;}
else if(rs instanceof Ext.data.Record){p[this.meta.idProperty]=rs.id;p[this.dataProperty]=this.saveRecord(rs);}
return false;},saveRecord:Ext.emptyFn,create:function(p,rec){return p[this.dataProperty]=this.createRecord(rec);},createRecord:Ext.emptyFn,destroy:function(p,rs){if(Ext.isArray(rs)){var data=[];var ids=[];for(var i=0,len=rs.length;i<len;i++){data.push(this.destroyRecord(rs[i]));}
p[this.dataProperty]=data;}else if(rs instanceof Ext.data.Record){p[this.dataProperty]=this.destroyRecord(rs);}
return false;},destroyRecord:Ext.emptyFn,toHash:function(rec){var map=rec.fields.map;var data={};var raw=(this.writeAllFields===false&&rec.phantom===false)?rec.getChanges():rec.data;for(var k in raw){data[(map[k].mapping)?map[k].mapping:map[k].name]=raw[k];}
data[this.meta.idProperty]=rec.id;return data;}};

Ext.data.JsonWriter=Ext.extend(Ext.data.DataWriter,{returnJson:true,writeRecord:function(rec){var data=this.toHash(rec);return(this.returnJson===true)?Ext.encode(data):data;},createRecord:function(rec){var data=this.toHash(rec);delete data[this.meta.idProperty];return(this.returnJson===true)?Ext.encode(data):data;},save:function(p,rs){Ext.data.JsonWriter.superclass.save.apply(this,arguments);if(this.returnJson){if(Ext.isArray(rs)){p[this.meta.idProperty]=Ext.encode(p[this.meta.idProperty]);}
p[this.dataProperty]=Ext.encode(p[this.dataProperty]);}},saveRecord:function(rec){return this.toHash(rec);},destroy:function(p,rs){Ext.data.JsonWriter.superclass.destroy.apply(this,arguments);if(this.returnJson){p[this.dataProperty]=Ext.encode(p[this.dataProperty]);}},destroyRecord:function(rec){return rec.id}});

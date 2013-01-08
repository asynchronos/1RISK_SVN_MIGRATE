/*
 * Ext JS Library 3.0 RC1
 * Copyright(c) 2006-2009, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */


Ext.ns("Ext.grid","Ext.dd","Ext.tree","Ext.form","Ext.menu","Ext.state","Ext.layout","Ext.app","Ext.ux","Ext.chart","Ext.direct");Ext.apply(Ext,function(){var E=Ext,idSeed=0;return{SSL_SECURE_URL:"javascript:false",emptyFn:function(){},BLANK_IMAGE_URL:"http:/"+"/extjs.com/s.gif",extendX:function(supr,fn){return Ext.extend(supr,fn(supr.prototype));},getDoc:function(){return Ext.get(document);},isDate:function(v){return Object.prototype.toString.apply(v)==='[object Date]';},num:function(v,defaultValue){v=Number(v==null?NaN:v);return isNaN(v)?defaultValue:v;},value:function(v,defaultValue,allowBlank){return Ext.isEmpty(v,allowBlank)?defaultValue:v;},escapeRe:function(s){return s.replace(/([.*+?^${}()|[\]\/\\])/g,"\\$1");},sequence:function(o,name,fn,scope){o[name]=o[name].createSequence(fn,scope);},addBehaviors:function(o){if(!Ext.isReady){Ext.onReady(function(){Ext.addBehaviors(o);});}else{var cache={},parts,b,s;for(b in o){if((parts=b.split('@'))[1]){s=parts[0];if(!cache[s]){cache[s]=Ext.select(s);}
cache[s].on(parts[1],o[b]);}}
cache=null;}},combine:function(){var as=arguments,l=as.length,r=[];for(var i=0;i<l;i++){var a=as[i];if(Ext.isArray(a)){r=r.concat(a);}else if(a.length!==undefined&&!a.substr){r=r.concat(Array.prototype.slice.call(a,0));}else{r.push(a);}}
return r;},copyTo:function(dest,source,names){if(typeof names=='string'){names=names.split(/[,;\s]/);}
for(var i=0,len=names.length;i<len;i++){var n=names[i];if(source.hasOwnProperty(n)){dest[n]=source[n];}}
return dest;},destroy:function(){for(var i=0,a=arguments,len=a.length;i<len;i++){var as=a[i];if(as){if(typeof as.destroy=='function'){as.destroy();}
else if(as.dom){as.removeAllListeners();as.remove();}}}},destroyMembers:function(o,arg1,arg2,etc){for(var i=1,a=arguments,len=a.length;i<len;i++){Ext.destroy(o[a[i]]);delete o[a[i]];}},clean:function(arr){var ret=[];Ext.each(arr,function(v){if(!!v)ret.push(v);});return ret;},unique:function(arr){var ret=[],collect={};Ext.each(arr,function(v){if(!collect[v]){ret.push(v);}
collect[v]=true;});return ret;},flatten:function(arr){var worker=[];function rFlatten(a){Ext.each(a,function(v){Ext.isArray(v)?rFlatten(v):worker.push(v);});return worker;};return rFlatten(arr);},min:function(arr,comp){var ret=arr[0];comp=comp||function(a,b){return a<b?-1:1};Ext.each(arr,function(v){ret=comp(ret,v)==-1?ret:v;});return ret;},max:function(arr,comp){var ret=arr[0];comp=comp||function(a,b){return a>b?1:-1};Ext.each(arr,function(v){ret=comp(ret,v)==1?ret:v;});return ret;},median:function(arr,sorter,medCalc){var ret,middle,remainder;if(arr.length){if(arr.length==1){ret=arr[0];}else{arr=Ext.toArray(arr);sorter?arr.sort(sorter):arr.sort();remainder=(middle=(arr.length/2)-1)%1;if(remainder==0){ret=medCalc?medCalc(arr[middle],arr[middle+1]):((arr[middle]+arr[middle+1])/2);}else{ret=arr[middle+remainder];}}}
return ret;},mean:function(arr){return Ext.sum(arr)/arr.length;},mode:function(arr){var collect={},mode=arr[0];Ext.each(arr,function(v){collect[v]==undefined?collect[v]=0:collect[v]++;mode=collect[mode]<collect[v]?v:mode;});return mode;},sum:function(arr){var ret=0;Ext.each(arr,function(v){ret+=v;});return ret;},partition:function(arr,truth){var ret=[[],[]];Ext.each(arr,function(v,i,a){ret[(truth&&truth(v,i,a))||(!truth&&v)?0:1].push(v);});return ret;},invoke:function(arr,prop){var ret=[],args=Array.prototype.slice.call(arguments,2);Ext.each(arr,function(v,i){if(v&&typeof v[prop]=="function"){ret.push(v[prop].apply(v,args));}else{ret.push(undefined);}});return ret;},pluck:function(arr,prop){var ret=[];Ext.each(arr,function(v){ret.push(v[prop]);});return ret;},zip:function(){var parts=Ext.partition(arguments,function(val){return typeof val!="function"}),arrs=parts[0],fn=parts[1][0],len=Ext.max(Ext.pluck(arrs,"length")),ret=[];for(var i=0;i<len;i++){ret[i]=[];if(fn){ret[i]=fn.apply(fn,Ext.pluck(arrs,i));}else{for(var j=0,aLen=arrs.length;j<aLen;j++){ret[i].push(arrs[j][i]);}}}
return ret;},getCmp:function(id){return Ext.ComponentMgr.get(id);},useShims:((E.isIE&&E.isIE6)||(E.isMac&&E.isGecko&&!E.isGecko3)),type:function(o){if(o===undefined||o===null){return false;}
if(o.htmlElement){return'element';}
var t=typeof o;if(t=='object'&&o.nodeName){switch(o.nodeType){case 1:return'element';case 3:return(/\S/).test(o.nodeValue)?'textnode':'whitespace';}}
if(t=='object'||t=='function'){switch(o.constructor){case Array:return'array';case RegExp:return'regexp';case Date:return'date';}
if(typeof o.length=='number'&&typeof o.item=='function'){return'nodelist';}}
return t;},intercept:function(o,name,fn,scope){o[name]=o[name].createInterceptor(fn,scope);},callback:function(cb,scope,args,delay){if(Ext.isFunction(cb)){if(delay){cb.defer(delay,scope,args||[]);}else{cb.apply(scope,args||[]);}}}}}());Ext.apply(Function.prototype,{createSequence:function(fcn,scope){var method=this;return!Ext.isFunction(fcn)?this:function(){var retval=method.apply(this||window,arguments);fcn.apply(scope||this||window,arguments);return retval;};}});Ext.applyIf(String,{escape:function(string){return string.replace(/('|\\)/g,"\\$1");},leftPad:function(val,size,ch){var result=String(val);if(!ch){ch=" ";}
while(result.length<size){result=ch+result;}
return result;}});String.prototype.toggle=function(value,other){return this==value?other:value;};String.prototype.trim=function(){var re=/^\s+|\s+$/g;return function(){return this.replace(re,"");};}();Date.prototype.getElapsed=function(date){return Math.abs((date||new Date()).getTime()-this.getTime());};Ext.applyIf(Number.prototype,{constrain:function(min,max){return Math.min(Math.max(this,min),max);}});
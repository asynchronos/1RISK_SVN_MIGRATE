/*
 * Ext JS Library 3.0 RC1
 * Copyright(c) 2006-2009, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */


Ext.form.TextField=Ext.extend(Ext.form.Field,{grow:false,growMin:30,growMax:800,vtype:null,maskRe:null,disableKeyFilter:false,allowBlank:true,minLength:0,maxLength:Number.MAX_VALUE,minLengthText:"The minimum length for this field is {0}",maxLengthText:"The maximum length for this field is {0}",selectOnFocus:false,blankText:"This field is required",validator:null,regex:null,regexText:"",emptyText:null,emptyClass:'x-form-empty-field',initComponent:function(){Ext.form.TextField.superclass.initComponent.call(this);this.addEvents('autosize','keydown','keyup','keypress');},initEvents:function(){Ext.form.TextField.superclass.initEvents.call(this);if(this.validationEvent=='keyup'){this.validationTask=new Ext.util.DelayedTask(this.validate,this);this.mon(this.el,'keyup',this.filterValidation,this);}
else if(this.validationEvent!==false){this.mon(this.el,this.validationEvent,this.validate,this,{buffer:this.validationDelay});}
if(this.selectOnFocus||this.emptyText){this.on("focus",this.preFocus,this);this.mon(this.el,'mousedown',function(){if(!this.hasFocus){this.el.on('mouseup',function(e){e.preventDefault();},this,{single:true});}},this);if(this.emptyText){this.on('blur',this.postBlur,this);this.applyEmptyText();}}
if(this.maskRe||(this.vtype&&this.disableKeyFilter!==true&&(this.maskRe=Ext.form.VTypes[this.vtype+'Mask']))){this.mon(this.el,'keypress',this.filterKeys,this);}
if(this.grow){this.mon(this.el,'keyup',this.onKeyUpBuffered,this,{buffer:50});this.mon(this.el,'click',this.autoSize,this);}
if(this.enableKeyEvents){this.mon(this.el,'keyup',this.onKeyUp,this);this.mon(this.el,'keydown',this.onKeyDown,this);this.mon(this.el,'keypress',this.onKeyPress,this);}},processValue:function(value){if(this.stripCharsRe){var newValue=value.replace(this.stripCharsRe,'');if(newValue!==value){this.setRawValue(newValue);return newValue;}}
return value;},filterValidation:function(e){if(!e.isNavKeyPress()){this.validationTask.delay(this.validationDelay);}},onDisable:function(){Ext.form.TextField.superclass.onDisable.call(this);if(Ext.isIE){this.el.dom.unselectable='on';}},onEnable:function(){Ext.form.TextField.superclass.onEnable.call(this);if(Ext.isIE){this.el.dom.unselectable='';}},onKeyUpBuffered:function(e){if(!e.isNavKeyPress()){this.autoSize();}},onKeyUp:function(e){this.fireEvent('keyup',this,e);},onKeyDown:function(e){this.fireEvent('keydown',this,e);},onKeyPress:function(e){this.fireEvent('keypress',this,e);},reset:function(){Ext.form.TextField.superclass.reset.call(this);this.applyEmptyText();},applyEmptyText:function(){if(this.rendered&&this.emptyText&&this.getRawValue().length<1&&!this.hasFocus){this.setRawValue(this.emptyText);this.el.addClass(this.emptyClass);}},preFocus:function(){if(this.emptyText){if(this.el.dom.value==this.emptyText){this.setRawValue('');}
this.el.removeClass(this.emptyClass);}
if(this.selectOnFocus){this.el.dom.select();}},postBlur:function(){this.applyEmptyText();},filterKeys:function(e){if(e.ctrlKey){return;}
var k=e.getKey();if(Ext.isGecko&&(e.isNavKeyPress()||k==e.BACKSPACE||(k==e.DELETE&&e.button==-1))){return;}
var c=e.getCharCode(),cc=String.fromCharCode(c);if(!Ext.isGecko&&e.isSpecialKey()&&!cc){return;}
if(!this.maskRe.test(cc)){e.stopEvent();}},setValue:function(v){if(this.emptyText&&this.el&&v!==undefined&&v!==null&&v!==''){this.el.removeClass(this.emptyClass);}
Ext.form.TextField.superclass.setValue.apply(this,arguments);this.applyEmptyText();this.autoSize();return this;},validateValue:function(value){if(Ext.isFunction(this.validator)){var msg=this.validator(value);if(msg!==true){this.markInvalid(msg);return false;}}
if(this.vtype){var vt=Ext.form.VTypes;if(!vt[this.vtype](value,this)){this.markInvalid(this.vtypeText||vt[this.vtype+'Text']);return false;}}
if(this.regex&&!this.regex.test(value)){this.markInvalid(this.regexText);return false;}
if(value.length<1||value===this.emptyText){if(this.allowBlank){this.clearInvalid();return true;}else{this.markInvalid(this.blankText);return false;}}
if(value.length<this.minLength){this.markInvalid(String.format(this.minLengthText,this.minLength));return false;}
if(value.length>this.maxLength){this.markInvalid(String.format(this.maxLengthText,this.maxLength));return false;}
return true;},selectText:function(start,end){var v=this.getRawValue();var doFocus=false;if(v.length>0){start=start===undefined?0:start;end=end===undefined?v.length:end;var d=this.el.dom;if(d.setSelectionRange){d.setSelectionRange(start,end);}else if(d.createTextRange){var range=d.createTextRange();range.moveStart("character",start);range.moveEnd("character",end-v.length);range.select();}
doFocus=Ext.isGecko||Ext.isOpera;}else{doFocus=true;}
if(doFocus){this.focus();}},autoSize:function(){if(!this.grow||!this.rendered){return;}
if(!this.metrics){this.metrics=Ext.util.TextMetrics.createInstance(this.el);}
var el=this.el;var v=el.dom.value;var d=document.createElement('div');d.appendChild(document.createTextNode(v));v=d.innerHTML;d=null;Ext.removeNode(d);v+="&#160;";var w=Math.min(this.growMax,Math.max(this.metrics.getWidth(v)+10,this.growMin));this.el.setWidth(w);this.fireEvent("autosize",this,w);},onDestroy:function(){if(this.validationTask){this.validationTask.cancel();this.validationTask=null;}
Ext.form.TextField.superclass.onDestroy.call(this);}});Ext.reg('textfield',Ext.form.TextField);
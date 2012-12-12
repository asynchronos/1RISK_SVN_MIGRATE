/*
 * Ext JS Library 3.0 RC1
 * Copyright(c) 2006-2009, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */


Ext.form.TriggerField=Ext.extend(Ext.form.TextField,{defaultAutoCreate:{tag:"input",type:"text",size:"16",autocomplete:"off"},hideTrigger:false,editable:true,autoSize:Ext.emptyFn,monitorTab:true,deferHeight:true,mimicing:false,onResize:function(w,h){Ext.form.TriggerField.superclass.onResize.call(this,w,h);if(typeof w=='number'){this.el.setWidth(this.adjustWidth('input',w-this.trigger.getWidth()));}
this.wrap.setWidth(this.el.getWidth()+this.trigger.getWidth());},adjustSize:Ext.BoxComponent.prototype.adjustSize,getResizeEl:function(){return this.wrap;},getPositionEl:function(){return this.wrap;},alignErrorIcon:function(){if(this.wrap){this.errorIcon.alignTo(this.wrap,'tl-tr',[2,0]);}},onRender:function(ct,position){Ext.form.TriggerField.superclass.onRender.call(this,ct,position);this.wrap=this.el.wrap({cls:"x-form-field-wrap"});this.trigger=this.wrap.createChild(this.triggerConfig||{tag:"img",src:Ext.BLANK_IMAGE_URL,cls:"x-form-trigger "+this.triggerClass});if(this.hideTrigger){this.trigger.setDisplayed(false);}
this.initTrigger();if(!this.width){this.wrap.setWidth(this.el.getWidth()+this.trigger.getWidth());}
if(!this.editable){this.editable=true;this.setEditable(false);}},afterRender:function(){Ext.form.TriggerField.superclass.afterRender.call(this);var y;if(Ext.isIE&&!this.hideTrigger&&this.el.getY()!=(y=this.trigger.getY())){this.el.position();this.el.setY(y);}},initTrigger:function(){this.mon(this.trigger,'click',this.onTriggerClick,this,{preventDefault:true});this.trigger.addClassOnOver('x-form-trigger-over');this.trigger.addClassOnClick('x-form-trigger-click');},onDestroy:function(){Ext.destroy(this.trigger,this.wrap);if(this.mimicing){Ext.get(Ext.isIE?document.body:document).un("mousedown",this.mimicBlur,this);}
Ext.form.TriggerField.superclass.onDestroy.call(this);},onFocus:function(){Ext.form.TriggerField.superclass.onFocus.call(this);if(!this.mimicing){this.wrap.addClass('x-trigger-wrap-focus');this.mimicing=true;Ext.get(Ext.isIE?document.body:document).on("mousedown",this.mimicBlur,this,{delay:10});if(this.monitorTab){this.el.on('keydown',this.checkTab,this);}}},checkTab:function(e){if(e.getKey()==e.TAB){this.triggerBlur();}},onBlur:function(){},mimicBlur:function(e){if(!this.wrap.contains(e.target)&&this.validateBlur(e)){this.triggerBlur();}},triggerBlur:function(){this.mimicing=false;Ext.get(Ext.isIE?document.body:document).un("mousedown",this.mimicBlur,this);if(this.monitorTab&&this.el){this.el.un("keydown",this.checkTab,this);}
this.beforeBlur();if(this.wrap){this.wrap.removeClass('x-trigger-wrap-focus');}
Ext.form.TriggerField.superclass.onBlur.call(this);},beforeBlur:Ext.emptyFn,setEditable:function(value){if(value==this.editable){return;}
this.editable=value;if(!value){this.el.addClass('x-trigger-noedit').on('click',this.onTriggerClick,this).dom.setAttribute('readOnly',true);}else{this.el.removeClass('x-trigger-noedit').un('click',this.onTriggerClick,this).dom.removeAttribute('readOnly');}},validateBlur:function(e){return true;},onDisable:function(){Ext.form.TriggerField.superclass.onDisable.call(this);if(this.wrap){this.wrap.addClass(this.disabledClass);this.el.removeClass(this.disabledClass);}},onEnable:function(){Ext.form.TriggerField.superclass.onEnable.call(this);if(this.wrap){this.wrap.removeClass(this.disabledClass);}},onShow:function(){if(this.wrap){var s=this.wrap.dom.style;s.display='';s.visibility='visible';}},onHide:function(){this.wrap.dom.style.display='none';},onTriggerClick:Ext.emptyFn});Ext.form.TwinTriggerField=Ext.extend(Ext.form.TriggerField,{initComponent:function(){Ext.form.TwinTriggerField.superclass.initComponent.call(this);this.triggerConfig={tag:'span',cls:'x-form-twin-triggers',cn:[{tag:"img",src:Ext.BLANK_IMAGE_URL,cls:"x-form-trigger "+this.trigger1Class},{tag:"img",src:Ext.BLANK_IMAGE_URL,cls:"x-form-trigger "+this.trigger2Class}]};},getTrigger:function(index){return this.triggers[index];},initTrigger:function(){var ts=this.trigger.select('.x-form-trigger',true);this.wrap.setStyle('overflow','hidden');var triggerField=this;ts.each(function(t,all,index){t.hide=function(){var w=triggerField.wrap.getWidth();this.dom.style.display='none';triggerField.el.setWidth(w-triggerField.trigger.getWidth());};t.show=function(){var w=triggerField.wrap.getWidth();this.dom.style.display='';triggerField.el.setWidth(w-triggerField.trigger.getWidth());};var triggerIndex='Trigger'+(index+1);if(this['hide'+triggerIndex]){t.dom.style.display='none';}
this.mon(t,'click',this['on'+triggerIndex+'Click'],this,{preventDefault:true});t.addClassOnOver('x-form-trigger-over');t.addClassOnClick('x-form-trigger-click');},this);this.triggers=ts.elements;},onTrigger1Click:Ext.emptyFn,onTrigger2Click:Ext.emptyFn});Ext.reg('trigger',Ext.form.TriggerField);
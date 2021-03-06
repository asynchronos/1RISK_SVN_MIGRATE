/*
 * Ext JS Library 3.0 RC1
 * Copyright(c) 2006-2009, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */


Ext.ComponentMgr=function(){var all=new Ext.util.MixedCollection();var types={};var ptypes={};return{register:function(c){all.add(c);},unregister:function(c){all.remove(c);},get:function(id){return all.get(id);},onAvailable:function(id,fn,scope){all.on("add",function(index,o){if(o.id==id){fn.call(scope||o,o);all.un("add",fn,scope);}});},all:all,registerType:function(xtype,cls){types[xtype]=cls;cls.xtype=xtype;},create:function(config,defaultType){return config.render?config:new types[config.xtype||defaultType](config);},registerPlugin:function(ptype,cls){ptypes[ptype]=cls;cls.ptype=ptype;},createPlugin:function(config,defaultType){return new ptypes[config.ptype||defaultType](config);}};}();Ext.reg=Ext.ComponentMgr.registerType;Ext.preg=Ext.ComponentMgr.registerPlugin;Ext.create=Ext.ComponentMgr.create;

Ext.Component=function(config){config=config||{};if(config.initialConfig){if(config.isAction){this.baseAction=config;}
config=config.initialConfig;}else if(config.tagName||config.dom||typeof config=="string"){config={applyTo:config,id:config.id||config};}
this.initialConfig=config;Ext.apply(this,config);this.addEvents('disable','enable','beforeshow','show','beforehide','hide','beforerender','render','afterrender','beforedestroy','destroy','beforestaterestore','staterestore','beforestatesave','statesave');this.getId();Ext.ComponentMgr.register(this);Ext.Component.superclass.constructor.call(this);if(this.baseAction){this.baseAction.addComponent(this);}
this.initComponent();if(this.plugins){if(Ext.isArray(this.plugins)){for(var i=0,len=this.plugins.length;i<len;i++){this.plugins[i]=this.initPlugin(this.plugins[i]);}}else{this.plugins=this.initPlugin(this.plugins);}}
if(this.stateful!==false){this.initState(config);}
if(this.applyTo){this.applyToMarkup(this.applyTo);delete this.applyTo;}else if(this.renderTo){this.render(this.renderTo);delete this.renderTo;}};Ext.Component.AUTO_ID=1000;Ext.extend(Ext.Component,Ext.util.Observable,{autoEl:'div',disabledClass:"x-item-disabled",allowDomMove:true,autoShow:false,hideMode:'display',hideParent:false,hidden:false,disabled:false,rendered:false,ctype:"Ext.Component",actionMode:"el",getActionEl:function(){return this[this.actionMode];},initPlugin:function(p){if(p.ptype&&typeof p.init!='function'){p=Ext.ComponentMgr.createPlugin(p);}else if(typeof p=='string'){p=Ext.ComponentMgr.createPlugin({ptype:p});}
p.init(this);return p;},initComponent:Ext.emptyFn,render:function(container,position){if(!this.rendered&&this.fireEvent("beforerender",this)!==false){if(!container&&this.el){this.el=Ext.get(this.el);container=this.el.dom.parentNode;this.allowDomMove=false;}
this.container=Ext.get(container);if(this.ctCls){this.container.addClass(this.ctCls);}
this.rendered=true;if(position!==undefined){if(typeof position=='number'){position=this.container.dom.childNodes[position];}else{position=Ext.getDom(position);}}
this.onRender(this.container,position||null);if(this.autoShow){this.el.removeClass(['x-hidden','x-hide-'+this.hideMode]);}
if(this.cls){this.el.addClass(this.cls);delete this.cls;}
if(this.style){this.el.applyStyles(this.style);delete this.style;}
if(this.overCls){this.el.addClassOnOver(this.overCls);}
this.fireEvent("render",this);this.afterRender(this.container);if(this.hidden){this.hide();}
if(this.disabled){this.disable();}
if(this.stateful!==false){this.initStateEvents();}
this.initRef();this.fireEvent("afterrender",this);}
return this;},initRef:function(){if(this.ref){var levels=this.ref.split('/');var last=levels.length,i=0;var t=this;while(i<last){if(t.ownerCt){t=t.ownerCt;}
i++;}
t[levels[--i]]=this;}},initState:function(config){if(Ext.state.Manager){var id=this.getStateId();if(id){var state=Ext.state.Manager.get(id);if(state){if(this.fireEvent('beforestaterestore',this,state)!==false){this.applyState(state);this.fireEvent('staterestore',this,state);}}}}},getStateId:function(){return this.stateId||((this.id.indexOf('ext-comp-')==0||this.id.indexOf('ext-gen')==0)?null:this.id);},initStateEvents:function(){if(this.stateEvents){for(var i=0,e;e=this.stateEvents[i];i++){this.on(e,this.saveState,this,{delay:100});}}},applyState:function(state,config){if(state){Ext.apply(this,state);}},getState:function(){return null;},saveState:function(){if(Ext.state.Manager&&this.stateful!==false){var id=this.getStateId();if(id){var state=this.getState();if(this.fireEvent('beforestatesave',this,state)!==false){Ext.state.Manager.set(id,state);this.fireEvent('statesave',this,state);}}}},applyToMarkup:function(el){this.allowDomMove=false;this.el=Ext.get(el);this.render(this.el.dom.parentNode);},addClass:function(cls){if(this.el){this.el.addClass(cls);}else{this.cls=this.cls?this.cls+' '+cls:cls;}
return this;},removeClass:function(cls){if(this.el){this.el.removeClass(cls);}else if(this.cls){this.cls=this.cls.split(' ').remove(cls).join(' ');}
return this;},onRender:function(ct,position){if(!this.el&&this.autoEl){if(typeof this.autoEl=='string'){this.el=document.createElement(this.autoEl);}else{var div=document.createElement('div');Ext.DomHelper.overwrite(div,this.autoEl);this.el=div.firstChild;}
if(!this.el.id){this.el.id=this.getId();}}
if(this.el){this.el=Ext.get(this.el);if(this.allowDomMove!==false){ct.dom.insertBefore(this.el.dom,position);}}},getAutoCreate:function(){var cfg=typeof this.autoCreate=="object"?this.autoCreate:Ext.apply({},this.defaultAutoCreate);if(this.id&&!cfg.id){cfg.id=this.id;}
return cfg;},afterRender:Ext.emptyFn,destroy:function(){if(this.fireEvent("beforedestroy",this)!==false){this.beforeDestroy();if(this.rendered){this.el.removeAllListeners();this.el.remove();if(this.actionMode=="container"||this.removeMode=="container"){this.container.remove();}}
this.onDestroy();Ext.ComponentMgr.unregister(this);this.fireEvent("destroy",this);this.purgeListeners();}},beforeDestroy:Ext.emptyFn,onDestroy:Ext.emptyFn,getEl:function(){return this.el;},getId:function(){return this.id||(this.id="ext-comp-"+(++Ext.Component.AUTO_ID));},getItemId:function(){return this.itemId||this.getId();},focus:function(selectText,delay){if(delay){this.focus.defer(typeof delay=='number'?delay:10,this,[selectText,false]);return;}
if(this.rendered){this.el.focus();if(selectText===true){this.el.dom.select();}}
return this;},blur:function(){if(this.rendered){this.el.blur();}
return this;},disable:function(){if(this.rendered){this.onDisable();}
this.disabled=true;this.fireEvent("disable",this);return this;},onDisable:function(){this.getActionEl().addClass(this.disabledClass);this.el.dom.disabled=true;},enable:function(){if(this.rendered){this.onEnable();}
this.disabled=false;this.fireEvent("enable",this);return this;},onEnable:function(){this.getActionEl().removeClass(this.disabledClass);this.el.dom.disabled=false;},setDisabled:function(disabled){return this[disabled?"disable":"enable"]();},show:function(){if(this.fireEvent("beforeshow",this)!==false){this.hidden=false;if(this.autoRender){this.render(typeof this.autoRender=='boolean'?Ext.getBody():this.autoRender);}
if(this.rendered){this.onShow();}
this.fireEvent("show",this);}
return this;},onShow:function(){if(this.hideParent){this.container.removeClass('x-hide-'+this.hideMode);}else{this.getActionEl().removeClass('x-hide-'+this.hideMode);}},hide:function(){if(this.fireEvent("beforehide",this)!==false){this.hidden=true;if(this.rendered){this.onHide();}
this.fireEvent("hide",this);}
return this;},onHide:function(){if(this.hideParent){this.container.addClass('x-hide-'+this.hideMode);}else{this.getActionEl().addClass('x-hide-'+this.hideMode);}},setVisible:function(visible){return this[visible?"show":"hide"]();},isVisible:function(){return this.rendered&&this.getActionEl().isVisible();},cloneConfig:function(overrides){overrides=overrides||{};var id=overrides.id||Ext.id();var cfg=Ext.applyIf(overrides,this.initialConfig);cfg.id=id;return new this.constructor(cfg);},getXType:function(){return this.constructor.xtype;},isXType:function(xtype,shallow){if(typeof xtype=='function'){xtype=xtype.xtype;}else if(typeof xtype=='object'){xtype=xtype.constructor.xtype;}
return!shallow?('/'+this.getXTypes()+'/').indexOf('/'+xtype+'/')!=-1:this.constructor.xtype==xtype;},getXTypes:function(){var tc=this.constructor;if(!tc.xtypes){var c=[],sc=this;while(sc&&sc.constructor.xtype){c.unshift(sc.constructor.xtype);sc=sc.constructor.superclass;}
tc.xtypeChain=c;tc.xtypes=c.join('/');}
return tc.xtypes;},findParentBy:function(fn){for(var p=this.ownerCt;(p!=null)&&!fn(p,this);p=p.ownerCt);return p||null;},findParentByType:function(xtype){return typeof xtype=='function'?this.findParentBy(function(p){return p.constructor===xtype;}):this.findParentBy(function(p){return p.constructor.xtype===xtype;});},getDomPositionEl:function(){return this.getPositionEl?this.getPositionEl():this.getEl();},mon:function(item,ename,fn,scope,opt){if(!this.mons){this.mons=[];this.on('beforedestroy',function(){for(var i=0,len=this.mons.length;i<len;i++){var m=this.mons[i];m.item.un(m.ename,m.fn,m.scope);}},this,{single:true});}
if(typeof ename=="object"){var propRe=/^(?:scope|delay|buffer|single|stopEvent|preventDefault|stopPropagation|normalized|args|delegate)$/;var o=ename;for(var e in o){if(propRe.test(e)){continue;}
if(typeof o[e]=="function"){this.mons.push({item:item,ename:e,fn:o[e],scope:o.scope});item.on(e,o[e],o.scope,o);}else{this.mons.push({item:item,ename:e,fn:o[e],scope:o.scope});item.on(e,o[e]);}}
return;}
this.mons.push({item:item,ename:ename,fn:fn,scope:scope});item.on(ename,fn,scope,opt);},nextSibling:function(){if(this.ownerCt){var index=this.ownerCt.items.indexOf(this);if(index!=-1&&index+1<this.ownerCt.items.getCount()){return this.ownerCt.items.itemAt(index+1);}}
return null;},previousSibling:function(){if(this.ownerCt){var index=this.ownerCt.items.indexOf(this);if(index>0){return this.ownerCt.items.itemAt(index-1);}}
return null;},getBubbleTarget:function(){return this.ownerCt;}});Ext.reg('component',Ext.Component);

Ext.BoxComponent=Ext.extend(Ext.Component,{initComponent:function(){Ext.BoxComponent.superclass.initComponent.call(this);this.addEvents('resize','move');},boxReady:false,deferHeight:false,setSize:function(w,h){if(typeof w=='object'){h=w.height;w=w.width;}
if(!this.boxReady){this.width=w;this.height=h;return this;}
if(this.cacheSizes!==false&&this.lastSize&&this.lastSize.width==w&&this.lastSize.height==h){return this;}
this.lastSize={width:w,height:h};var adj=this.adjustSize(w,h);var aw=adj.width,ah=adj.height;if(aw!==undefined||ah!==undefined){var rz=this.getResizeEl();if(!this.deferHeight&&aw!==undefined&&ah!==undefined){rz.setSize(aw,ah);}else if(!this.deferHeight&&ah!==undefined){rz.setHeight(ah);}else if(aw!==undefined){rz.setWidth(aw);}
this.onResize(aw,ah,w,h);this.fireEvent('resize',this,aw,ah,w,h);}
return this;},setWidth:function(width){return this.setSize(width);},setHeight:function(height){return this.setSize(undefined,height);},getSize:function(){return this.getResizeEl().getSize();},getWidth:function(){return this.getResizeEl().getWidth();},getHeight:function(){return this.getResizeEl().getHeight();},getOuterSize:function(){var el=this.getResizeEl();return{width:el.getWidth()+el.getMargins('lr'),height:el.getHeight()+el.getMargins('tb')};},getPosition:function(local){var el=this.getPositionEl();if(local===true){return[el.getLeft(true),el.getTop(true)];}
return this.xy||el.getXY();},getBox:function(local){var pos=this.getPosition(local);var s=this.getSize();s.x=pos[0];s.y=pos[1];return s;},updateBox:function(box){this.setSize(box.width,box.height);this.setPagePosition(box.x,box.y);return this;},getResizeEl:function(){return this.resizeEl||this.el;},getPositionEl:function(){return this.positionEl||this.el;},setPosition:function(x,y){if(x&&typeof x[1]=='number'){y=x[1];x=x[0];}
this.x=x;this.y=y;if(!this.boxReady){return this;}
var adj=this.adjustPosition(x,y);var ax=adj.x,ay=adj.y;var el=this.getPositionEl();if(ax!==undefined||ay!==undefined){if(ax!==undefined&&ay!==undefined){el.setLeftTop(ax,ay);}else if(ax!==undefined){el.setLeft(ax);}else if(ay!==undefined){el.setTop(ay);}
this.onPosition(ax,ay);this.fireEvent('move',this,ax,ay);}
return this;},setPagePosition:function(x,y){if(x&&typeof x[1]=='number'){y=x[1];x=x[0];}
this.pageX=x;this.pageY=y;if(!this.boxReady){return;}
if(x===undefined||y===undefined){return;}
var p=this.getPositionEl().translatePoints(x,y);this.setPosition(p.left,p.top);return this;},onRender:function(ct,position){Ext.BoxComponent.superclass.onRender.call(this,ct,position);if(this.resizeEl){this.resizeEl=Ext.get(this.resizeEl);}
if(this.positionEl){this.positionEl=Ext.get(this.positionEl);}},afterRender:function(){Ext.BoxComponent.superclass.afterRender.call(this);this.boxReady=true;this.setSize(this.width,this.height);if(this.x||this.y){this.setPosition(this.x,this.y);}else if(this.pageX||this.pageY){this.setPagePosition(this.pageX,this.pageY);}},syncSize:function(){delete this.lastSize;this.setSize(this.autoWidth?undefined:this.getResizeEl().getWidth(),this.autoHeight?undefined:this.getResizeEl().getHeight());return this;},onResize:function(adjWidth,adjHeight,rawWidth,rawHeight){},onPosition:function(x,y){},adjustSize:function(w,h){if(this.autoWidth){w='auto';}
if(this.autoHeight){h='auto';}
return{width:w,height:h};},adjustPosition:function(x,y){return{x:x,y:y};}});Ext.reg('box',Ext.BoxComponent);Ext.Spacer=Ext.extend(Ext.BoxComponent,{autoEl:'div'});Ext.reg('spacer',Ext.Spacer);

(function(){Ext.Layer=function(config,existingEl){config=config||{};var dh=Ext.DomHelper;var cp=config.parentEl,pel=cp?Ext.getDom(cp):document.body;if(existingEl){this.dom=Ext.getDom(existingEl);}
if(!this.dom){var o=config.dh||{tag:"div",cls:"x-layer"};this.dom=dh.append(pel,o);}
if(config.cls){this.addClass(config.cls);}
this.constrain=config.constrain!==false;this.visibilityMode=Ext.Element.VISIBILITY;if(config.id){this.id=this.dom.id=config.id;}else{this.id=Ext.id(this.dom);}
this.zindex=config.zindex||this.getZIndex();this.position("absolute",this.zindex);if(config.shadow){this.shadowOffset=config.shadowOffset||4;this.shadow=new Ext.Shadow({offset:this.shadowOffset,mode:config.shadow});}else{this.shadowOffset=0;}
this.useShim=config.shim!==false&&Ext.useShims;this.useDisplay=config.useDisplay;this.hide();};var supr=Ext.Element.prototype;var shims=[];Ext.extend(Ext.Layer,Ext.Element,{getZIndex:function(){return this.zindex||parseInt(this.getStyle("z-index"),10)||11000;},getShim:function(){if(!this.useShim){return null;}
if(this.shim){return this.shim;}
var shim=shims.shift();if(!shim){shim=this.createShim();shim.enableDisplayMode('block');shim.dom.style.display='none';shim.dom.style.visibility='visible';}
var pn=this.dom.parentNode;if(shim.dom.parentNode!=pn){pn.insertBefore(shim.dom,this.dom);}
shim.setStyle('z-index',this.getZIndex()-2);this.shim=shim;return shim;},hideShim:function(){if(this.shim){this.shim.setDisplayed(false);shims.push(this.shim);delete this.shim;}},disableShadow:function(){if(this.shadow){this.shadowDisabled=true;this.shadow.hide();this.lastShadowOffset=this.shadowOffset;this.shadowOffset=0;}},enableShadow:function(show){if(this.shadow){this.shadowDisabled=false;this.shadowOffset=this.lastShadowOffset;delete this.lastShadowOffset;if(show){this.sync(true);}}},sync:function(doShow){var sw=this.shadow;if(!this.updating&&this.isVisible()&&(sw||this.useShim)){var sh=this.getShim();var w=this.getWidth(),h=this.getHeight();var l=this.getLeft(true),t=this.getTop(true);if(sw&&!this.shadowDisabled){if(doShow&&!sw.isVisible()){sw.show(this);}else{sw.realign(l,t,w,h);}
if(sh){if(doShow){sh.show();}
var a=sw.adjusts,s=sh.dom.style;s.left=(Math.min(l,l+a.l))+"px";s.top=(Math.min(t,t+a.t))+"px";s.width=(w+a.w)+"px";s.height=(h+a.h)+"px";}}else if(sh){if(doShow){sh.show();}
sh.setSize(w,h);sh.setLeftTop(l,t);}}},destroy:function(){this.hideShim();if(this.shadow){this.shadow.hide();}
this.removeAllListeners();Ext.removeNode(this.dom);Ext.Element.uncache(this.id);},remove:function(){this.destroy();},beginUpdate:function(){this.updating=true;},endUpdate:function(){this.updating=false;this.sync(true);},hideUnders:function(negOffset){if(this.shadow){this.shadow.hide();}
this.hideShim();},constrainXY:function(){if(this.constrain){var vw=Ext.lib.Dom.getViewWidth(),vh=Ext.lib.Dom.getViewHeight();var s=Ext.getDoc().getScroll();var xy=this.getXY();var x=xy[0],y=xy[1];var so=this.shadowOffset;var w=this.dom.offsetWidth+so,h=this.dom.offsetHeight+so;var moved=false;if((x+w)>vw+s.left){x=vw-w-so;moved=true;}
if((y+h)>vh+s.top){y=vh-h-so;moved=true;}
if(x<s.left){x=s.left;moved=true;}
if(y<s.top){y=s.top;moved=true;}
if(moved){if(this.avoidY){var ay=this.avoidY;if(y<=ay&&(y+h)>=ay){y=ay-h-5;}}
xy=[x,y];this.storeXY(xy);supr.setXY.call(this,xy);this.sync();}}
return this;},isVisible:function(){return this.visible;},showAction:function(){this.visible=true;if(this.useDisplay===true){this.setDisplayed("");}else if(this.lastXY){supr.setXY.call(this,this.lastXY);}else if(this.lastLT){supr.setLeftTop.call(this,this.lastLT[0],this.lastLT[1]);}},hideAction:function(){this.visible=false;if(this.useDisplay===true){this.setDisplayed(false);}else{this.setLeftTop(-10000,-10000);}},setVisible:function(v,a,d,c,e){if(v){this.showAction();}
if(a&&v){var cb=function(){this.sync(true);if(c){c();}}.createDelegate(this);supr.setVisible.call(this,true,true,d,cb,e);}else{if(!v){this.hideUnders(true);}
var cb=c;if(a){cb=function(){this.hideAction();if(c){c();}}.createDelegate(this);}
supr.setVisible.call(this,v,a,d,cb,e);if(v){this.sync(true);}else if(!a){this.hideAction();}}
return this;},storeXY:function(xy){delete this.lastLT;this.lastXY=xy;},storeLeftTop:function(left,top){delete this.lastXY;this.lastLT=[left,top];},beforeFx:function(){this.beforeAction();return Ext.Layer.superclass.beforeFx.apply(this,arguments);},afterFx:function(){Ext.Layer.superclass.afterFx.apply(this,arguments);this.sync(this.isVisible());},beforeAction:function(){if(!this.updating&&this.shadow){this.shadow.hide();}},setLeft:function(left){this.storeLeftTop(left,this.getTop(true));supr.setLeft.apply(this,arguments);this.sync();return this;},setTop:function(top){this.storeLeftTop(this.getLeft(true),top);supr.setTop.apply(this,arguments);this.sync();return this;},setLeftTop:function(left,top){this.storeLeftTop(left,top);supr.setLeftTop.apply(this,arguments);this.sync();return this;},setXY:function(xy,a,d,c,e){this.fixDisplay();this.beforeAction();this.storeXY(xy);var cb=this.createCB(c);supr.setXY.call(this,xy,a,d,cb,e);if(!a){cb();}
return this;},createCB:function(c){var el=this;return function(){el.constrainXY();el.sync(true);if(c){c();}};},setX:function(x,a,d,c,e){this.setXY([x,this.getY()],a,d,c,e);return this;},setY:function(y,a,d,c,e){this.setXY([this.getX(),y],a,d,c,e);return this;},setSize:function(w,h,a,d,c,e){this.beforeAction();var cb=this.createCB(c);supr.setSize.call(this,w,h,a,d,cb,e);if(!a){cb();}
return this;},setWidth:function(w,a,d,c,e){this.beforeAction();var cb=this.createCB(c);supr.setWidth.call(this,w,a,d,cb,e);if(!a){cb();}
return this;},setHeight:function(h,a,d,c,e){this.beforeAction();var cb=this.createCB(c);supr.setHeight.call(this,h,a,d,cb,e);if(!a){cb();}
return this;},setBounds:function(x,y,w,h,a,d,c,e){this.beforeAction();var cb=this.createCB(c);if(!a){this.storeXY([x,y]);supr.setXY.call(this,[x,y]);supr.setSize.call(this,w,h,a,d,cb,e);cb();}else{supr.setBounds.call(this,x,y,w,h,a,d,cb,e);}
return this;},setZIndex:function(zindex){this.zindex=zindex;this.setStyle("z-index",zindex+2);if(this.shadow){this.shadow.setZIndex(zindex+1);}
if(this.shim){this.shim.setStyle("z-index",zindex);}
return this;}});})();

Ext.Shadow=function(config){Ext.apply(this,config);if(typeof this.mode!="string"){this.mode=this.defaultMode;}
var o=this.offset,a={h:0};var rad=Math.floor(this.offset/2);switch(this.mode.toLowerCase()){case"drop":a.w=0;a.l=a.t=o;a.t-=1;if(Ext.isIE){a.l-=this.offset+rad;a.t-=this.offset+rad;a.w-=rad;a.h-=rad;a.t+=1;}
break;case"sides":a.w=(o*2);a.l=-o;a.t=o-1;if(Ext.isIE){a.l-=(this.offset-rad);a.t-=this.offset+rad;a.l+=1;a.w-=(this.offset-rad)*2;a.w-=rad+1;a.h-=1;}
break;case"frame":a.w=a.h=(o*2);a.l=a.t=-o;a.t+=1;a.h-=2;if(Ext.isIE){a.l-=(this.offset-rad);a.t-=(this.offset-rad);a.l+=1;a.w-=(this.offset+rad+1);a.h-=(this.offset+rad);a.h+=1;}
break;};this.adjusts=a;};Ext.Shadow.prototype={offset:4,defaultMode:"drop",show:function(target){target=Ext.get(target);if(!this.el){this.el=Ext.Shadow.Pool.pull();if(this.el.dom.nextSibling!=target.dom){this.el.insertBefore(target);}}
this.el.setStyle("z-index",this.zIndex||parseInt(target.getStyle("z-index"),10)-1);if(Ext.isIE){this.el.dom.style.filter="progid:DXImageTransform.Microsoft.alpha(opacity=50) progid:DXImageTransform.Microsoft.Blur(pixelradius="+(this.offset)+")";}
this.realign(target.getLeft(true),target.getTop(true),target.getWidth(),target.getHeight());this.el.dom.style.display="block";},isVisible:function(){return this.el?true:false;},realign:function(l,t,w,h){if(!this.el){return;}
var a=this.adjusts,d=this.el.dom,s=d.style;var iea=0;s.left=(l+a.l)+"px";s.top=(t+a.t)+"px";var sw=(w+a.w),sh=(h+a.h),sws=sw+"px",shs=sh+"px";if(s.width!=sws||s.height!=shs){s.width=sws;s.height=shs;if(!Ext.isIE){var cn=d.childNodes;var sww=Math.max(0,(sw-12))+"px";cn[0].childNodes[1].style.width=sww;cn[1].childNodes[1].style.width=sww;cn[2].childNodes[1].style.width=sww;cn[1].style.height=Math.max(0,(sh-12))+"px";}}},hide:function(){if(this.el){this.el.dom.style.display="none";Ext.Shadow.Pool.push(this.el);delete this.el;}},setZIndex:function(z){this.zIndex=z;if(this.el){this.el.setStyle("z-index",z);}}};Ext.Shadow.Pool=function(){var p=[];var markup=Ext.isIE?'<div class="x-ie-shadow"></div>':'<div class="x-shadow"><div class="xst"><div class="xstl"></div><div class="xstc"></div><div class="xstr"></div></div><div class="xsc"><div class="xsml"></div><div class="xsmc"></div><div class="xsmr"></div></div><div class="xsb"><div class="xsbl"></div><div class="xsbc"></div><div class="xsbr"></div></div></div>';return{pull:function(){var sh=p.shift();if(!sh){sh=Ext.get(Ext.DomHelper.insertHtml("beforeBegin",document.body.firstChild,markup));sh.autoBoxAdjust=false;}
return sh;},push:function(sh){p.push(sh);}};}();

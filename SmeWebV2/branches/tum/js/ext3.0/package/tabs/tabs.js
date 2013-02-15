/*
 * Ext JS Library 3.0 RC1
 * Copyright(c) 2006-2009, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */


Ext.TabPanel=Ext.extend(Ext.Panel,{monitorResize:true,deferredRender:true,tabWidth:120,minTabWidth:30,resizeTabs:false,enableTabScroll:false,scrollIncrement:0,scrollRepeatInterval:400,scrollDuration:.35,animScroll:true,tabPosition:'top',baseCls:'x-tab-panel',autoTabs:false,autoTabSelector:'div.x-tab',activeTab:null,tabMargin:2,plain:false,wheelIncrement:20,idDelimiter:'__',itemCls:'x-tab-item',elements:'body',headerAsText:false,frame:false,hideBorders:true,initComponent:function(){this.frame=false;Ext.TabPanel.superclass.initComponent.call(this);this.addEvents('beforetabchange','tabchange','contextmenu');this.setLayout(new Ext.layout.CardLayout(Ext.apply({layoutOnCardChange:this.layoutOnTabChange,deferredRender:this.deferredRender},this.layoutConfig)));if(this.tabPosition=='top'){this.elements+=',header';this.stripTarget='header';}else{this.elements+=',footer';this.stripTarget='footer';}
if(!this.stack){this.stack=Ext.TabPanel.AccessStack();}
this.initItems();},onRender:function(ct,position){Ext.TabPanel.superclass.onRender.call(this,ct,position);if(this.plain){var pos=this.tabPosition=='top'?'header':'footer';this[pos].addClass('x-tab-panel-'+pos+'-plain');}
var st=this[this.stripTarget];this.stripWrap=st.createChild({cls:'x-tab-strip-wrap',cn:{tag:'ul',cls:'x-tab-strip x-tab-strip-'+this.tabPosition}});var beforeEl=(this.tabPosition=='bottom'?this.stripWrap:null);this.stripSpacer=st.createChild({cls:'x-tab-strip-spacer'},beforeEl);this.strip=new Ext.Element(this.stripWrap.dom.firstChild);this.edge=this.strip.createChild({tag:'li',cls:'x-tab-edge'});this.strip.createChild({cls:'x-clear'});this.body.addClass('x-tab-panel-body-'+this.tabPosition);if(!this.itemTpl){var tt=new Ext.Template('<li class="{cls}" id="{id}"><a class="x-tab-strip-close" onclick="return false;"></a>','<a class="x-tab-right" href="#" onclick="return false;"><em class="x-tab-left">','<span class="x-tab-strip-inner"><span class="x-tab-strip-text {iconCls}">{text}</span></span>','</em></a></li>');tt.disableFormats=true;tt.compile();Ext.TabPanel.prototype.itemTpl=tt;}
this.items.each(this.initTab,this);},afterRender:function(){Ext.TabPanel.superclass.afterRender.call(this);if(this.autoTabs){this.readTabs(false);}
if(this.activeTab!==undefined){var item=(typeof this.activeTab=='object')?this.activeTab:this.items.get(this.activeTab);delete this.activeTab;this.setActiveTab(item);}},initEvents:function(){Ext.TabPanel.superclass.initEvents.call(this);this.on('add',this.onAdd,this,{target:this});this.on('remove',this.onRemove,this,{target:this});this.mon(this.strip,'mousedown',this.onStripMouseDown,this);this.mon(this.strip,'contextmenu',this.onStripContextMenu,this);if(this.enableTabScroll){this.mon(this.strip,'mousewheel',this.onStripContextMenu,this);}},findTargets:function(e){var item=null;var itemEl=e.getTarget('li',this.strip);if(itemEl){item=this.getComponent(itemEl.id.split(this.idDelimiter)[1]);if(item.disabled){return{close:null,item:null,el:null};}}
return{close:e.getTarget('.x-tab-strip-close',this.strip),item:item,el:itemEl};},onStripMouseDown:function(e){if(e.button!=0){return;}
e.preventDefault();var t=this.findTargets(e);if(t.close){if(t.item.fireEvent('beforeclose',t.item)!==false){t.item.fireEvent('close',t.item);this.remove(t.item);}
return;}
if(t.item&&t.item!=this.activeTab){this.setActiveTab(t.item);}},onStripContextMenu:function(e){e.preventDefault();var t=this.findTargets(e);if(t.item){this.fireEvent('contextmenu',this,t.item,e);}},readTabs:function(removeExisting){if(removeExisting===true){this.items.each(function(item){this.remove(item);},this);}
var tabs=this.el.query(this.autoTabSelector);for(var i=0,len=tabs.length;i<len;i++){var tab=tabs[i];var title=tab.getAttribute('title');tab.removeAttribute('title');this.add({title:title,contentEl:tab});}},initTab:function(item,index){var before=this.strip.dom.childNodes[index];var p=this.getTemplateArgs(item);var el=before?this.itemTpl.insertBefore(before,p):this.itemTpl.append(this.strip,p);Ext.fly(el).addClassOnOver('x-tab-strip-over');if(item.tabTip){Ext.fly(el).child('span.x-tab-strip-text',true).qtip=item.tabTip;}
item.tabEl=el;item.on('disable',this.onItemDisabled,this);item.on('enable',this.onItemEnabled,this);item.on('titlechange',this.onItemTitleChanged,this);item.on('iconchange',this.onItemIconChanged,this);item.on('beforeshow',this.onBeforeShowItem,this);},getTemplateArgs:function(item){var cls=item.closable?'x-tab-strip-closable':'';if(item.disabled){cls+=' x-item-disabled';}
if(item.iconCls){cls+=' x-tab-with-icon';}
if(item.tabCls){cls+=' '+item.tabCls;}
return{id:this.id+this.idDelimiter+item.getItemId(),text:item.title,cls:cls,iconCls:item.iconCls||''};},onAdd:function(tp,item,index){this.initTab(item,index);if(this.items.getCount()==1){this.syncSize();}
this.delegateUpdates();},onBeforeAdd:function(item){var existing=item.events?(this.items.containsKey(item.getItemId())?item:null):this.items.get(item);if(existing){this.setActiveTab(item);return false;}
Ext.TabPanel.superclass.onBeforeAdd.apply(this,arguments);var es=item.elements;item.elements=es?es.replace(',header',''):es;item.border=(item.border===true);},onRemove:function(tp,item){Ext.destroy(Ext.get(this.getTabEl(item)));this.stack.remove(item);item.un('disable',this.onItemDisabled,this);item.un('enable',this.onItemEnabled,this);item.un('titlechange',this.onItemTitleChanged,this);item.un('iconchange',this.onItemIconChanged,this);item.un('beforeshow',this.onBeforeShowItem,this);if(item==this.activeTab){var next=this.stack.next();if(next){this.setActiveTab(next);}else if(this.items.getCount()>0){this.setActiveTab(0);}else{this.activeTab=null;}}
this.delegateUpdates();},onBeforeShowItem:function(item){if(item!=this.activeTab){this.setActiveTab(item);return false;}},onItemDisabled:function(item){var el=this.getTabEl(item);if(el){Ext.fly(el).addClass('x-item-disabled');}
this.stack.remove(item);},onItemEnabled:function(item){var el=this.getTabEl(item);if(el){Ext.fly(el).removeClass('x-item-disabled');}},onItemTitleChanged:function(item){var el=this.getTabEl(item);if(el){Ext.fly(el).child('span.x-tab-strip-text',true).innerHTML=item.title;}},onItemIconChanged:function(item,iconCls,oldCls){var el=this.getTabEl(item);if(el){Ext.fly(el).child('span.x-tab-strip-text').replaceClass(oldCls,iconCls);}},getTabEl:function(item){var itemId=(typeof item==='number')?this.items.items[item].getItemId():item.getItemId();return document.getElementById(this.id+this.idDelimiter+itemId);},onResize:function(){Ext.TabPanel.superclass.onResize.apply(this,arguments);this.delegateUpdates();},beginUpdate:function(){this.suspendUpdates=true;},endUpdate:function(){this.suspendUpdates=false;this.delegateUpdates();},hideTabStripItem:function(item){item=this.getComponent(item);var el=this.getTabEl(item);if(el){el.style.display='none';this.delegateUpdates();}
this.stack.remove(item);},unhideTabStripItem:function(item){item=this.getComponent(item);var el=this.getTabEl(item);if(el){el.style.display='';this.delegateUpdates();}},delegateUpdates:function(){if(this.suspendUpdates){return;}
if(this.resizeTabs&&this.rendered){this.autoSizeTabs();}
if(this.enableTabScroll&&this.rendered){this.autoScrollTabs();}},autoSizeTabs:function(){var count=this.items.length;var ce=this.tabPosition!='bottom'?'header':'footer';var ow=this[ce].dom.offsetWidth;var aw=this[ce].dom.clientWidth;if(!this.resizeTabs||count<1||!aw){return;}
var each=Math.max(Math.min(Math.floor((aw-4)/count)-this.tabMargin,this.tabWidth),this.minTabWidth);this.lastTabWidth=each;var lis=this.strip.query("li:not([className^=x-tab-edge])");for(var i=0,len=lis.length;i<len;i++){var li=lis[i];var inner=Ext.fly(li).child('.x-tab-strip-inner',true);var tw=li.offsetWidth;var iw=inner.offsetWidth;inner.style.width=(each-(tw-iw))+'px';}},adjustBodyWidth:function(w){if(this.header){this.header.setWidth(w);}
if(this.footer){this.footer.setWidth(w);}
return w;},setActiveTab:function(item){item=this.getComponent(item);if(!item||this.fireEvent('beforetabchange',this,item,this.activeTab)===false){return;}
if(!this.rendered){this.activeTab=item;return;}
if(this.activeTab!=item){if(this.activeTab){var oldEl=this.getTabEl(this.activeTab);if(oldEl){Ext.fly(oldEl).removeClass('x-tab-strip-active');}
this.activeTab.fireEvent('deactivate',this.activeTab);}
var el=this.getTabEl(item);Ext.fly(el).addClass('x-tab-strip-active');this.activeTab=item;this.stack.add(item);this.layout.setActiveItem(item);if(this.scrolling){this.scrollToTab(item,this.animScroll);}
item.fireEvent('activate',item);this.fireEvent('tabchange',this,item);}},getActiveTab:function(){return this.activeTab||null;},getItem:function(item){return this.getComponent(item);},autoScrollTabs:function(){this.pos=this.tabPosition=='bottom'?this.footer:this.header;var count=this.items.length;var ow=this.pos.dom.offsetWidth;var tw=this.pos.dom.clientWidth;var wrap=this.stripWrap;var wd=wrap.dom;var cw=wd.offsetWidth;var pos=this.getScrollPos();var l=this.edge.getOffsetsTo(this.stripWrap)[0]+pos;if(!this.enableTabScroll||count<1||cw<20){return;}
if(l<=tw){wd.scrollLeft=0;wrap.setWidth(tw);if(this.scrolling){this.scrolling=false;this.pos.removeClass('x-tab-scrolling');this.scrollLeft.hide();this.scrollRight.hide();if(Ext.isAir||Ext.isWebKit){wd.style.marginLeft='';wd.style.marginRight='';}}}else{if(!this.scrolling){this.pos.addClass('x-tab-scrolling');if(Ext.isAir||Ext.isWebKit){wd.style.marginLeft='18px';wd.style.marginRight='18px';}}
tw-=wrap.getMargins('lr');wrap.setWidth(tw>20?tw:20);if(!this.scrolling){if(!this.scrollLeft){this.createScrollers();}else{this.scrollLeft.show();this.scrollRight.show();}}
this.scrolling=true;if(pos>(l-tw)){wd.scrollLeft=l-tw;}else{this.scrollToTab(this.activeTab,false);}
this.updateScrollButtons();}},createScrollers:function(){this.pos.addClass('x-tab-scrolling-'+this.tabPosition);var h=this.stripWrap.dom.offsetHeight;var sl=this.pos.insertFirst({cls:'x-tab-scroller-left'});sl.setHeight(h);sl.addClassOnOver('x-tab-scroller-left-over');this.leftRepeater=new Ext.util.ClickRepeater(sl,{interval:this.scrollRepeatInterval,handler:this.onScrollLeft,scope:this});this.scrollLeft=sl;var sr=this.pos.insertFirst({cls:'x-tab-scroller-right'});sr.setHeight(h);sr.addClassOnOver('x-tab-scroller-right-over');this.rightRepeater=new Ext.util.ClickRepeater(sr,{interval:this.scrollRepeatInterval,handler:this.onScrollRight,scope:this});this.scrollRight=sr;},getScrollWidth:function(){return this.edge.getOffsetsTo(this.stripWrap)[0]+this.getScrollPos();},getScrollPos:function(){return parseInt(this.stripWrap.dom.scrollLeft,10)||0;},getScrollArea:function(){return parseInt(this.stripWrap.dom.clientWidth,10)||0;},getScrollAnim:function(){return{duration:this.scrollDuration,callback:this.updateScrollButtons,scope:this};},getScrollIncrement:function(){return this.scrollIncrement||(this.resizeTabs?this.lastTabWidth+2:100);},scrollToTab:function(item,animate){if(!item){return;}
var el=this.getTabEl(item);var pos=this.getScrollPos(),area=this.getScrollArea();var left=Ext.fly(el).getOffsetsTo(this.stripWrap)[0]+pos;var right=left+el.offsetWidth;if(left<pos){this.scrollTo(left,animate);}else if(right>(pos+area)){this.scrollTo(right-area,animate);}},scrollTo:function(pos,animate){this.stripWrap.scrollTo('left',pos,animate?this.getScrollAnim():false);if(!animate){this.updateScrollButtons();}},onWheel:function(e){var d=e.getWheelDelta()*this.wheelIncrement*-1;e.stopEvent();var pos=this.getScrollPos();var newpos=pos+d;var sw=this.getScrollWidth()-this.getScrollArea();var s=Math.max(0,Math.min(sw,newpos));if(s!=pos){this.scrollTo(s,false);}},onScrollRight:function(){var sw=this.getScrollWidth()-this.getScrollArea();var pos=this.getScrollPos();var s=Math.min(sw,pos+this.getScrollIncrement());if(s!=pos){this.scrollTo(s,this.animScroll);}},onScrollLeft:function(){var pos=this.getScrollPos();var s=Math.max(0,pos-this.getScrollIncrement());if(s!=pos){this.scrollTo(s,this.animScroll);}},updateScrollButtons:function(){var pos=this.getScrollPos();this.scrollLeft[pos==0?'addClass':'removeClass']('x-tab-scroller-left-disabled');this.scrollRight[pos>=(this.getScrollWidth()-this.getScrollArea())?'addClass':'removeClass']('x-tab-scroller-right-disabled');},beforeDestroy:function(){if(this.items){this.items.each(function(item){if(item&&item.tabEl){Ext.get(item.tabEl).removeAllListeners();item.tabEl=null;}},this);}
if(this.strip){this.strip.removeAllListeners();}
Ext.TabPanel.superclass.beforeDestroy.apply(this);}});Ext.reg('tabpanel',Ext.TabPanel);Ext.TabPanel.prototype.activate=Ext.TabPanel.prototype.setActiveTab;Ext.TabPanel.AccessStack=function(){var items=[];return{add:function(item){items.push(item);if(items.length>10){items.shift();}},remove:function(item){var s=[];for(var i=0,len=items.length;i<len;i++){if(items[i]!=item){s.push(items[i]);}}
items=s;},next:function(){return items.pop();}};};

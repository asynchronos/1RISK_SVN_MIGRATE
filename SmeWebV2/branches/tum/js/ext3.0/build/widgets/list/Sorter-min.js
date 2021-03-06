/*
 * Ext JS Library 3.0 RC1
 * Copyright(c) 2006-2009, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */


Ext.ListView.Sorter=Ext.extend(Ext.util.Observable,{sortClasses:["sort-asc","sort-desc"],constructor:function(config){Ext.apply(this,config);Ext.ListView.Sorter.superclass.constructor.call(this);},init:function(listView){this.view=listView;listView.on('render',this.initEvents,this);},initEvents:function(view){view.mon(view.innerHd,'click',this.onHdClick,this);view.innerHd.setStyle('cursor','pointer');view.mon(view.store,'datachanged',this.updateSortState,this);this.updateSortState.defer(10,this,[view.store]);},updateSortState:function(store){var state=store.getSortState();if(!state){return;}
this.sortState=state;var cs=this.view.columns,sortColumn=-1;for(var i=0,len=cs.length;i<len;i++){if(cs[i].dataIndex==state.field){sortColumn=i;break;}}
if(sortColumn!=-1){var sortDir=state.direction;this.updateSortIcon(sortColumn,sortDir);}},updateSortIcon:function(col,dir){var sc=this.sortClasses;var hds=this.view.innerHd.select('em').removeClass(sc);hds.item(col).addClass(sc[dir=="DESC"?1:0]);},onHdClick:function(e){var hd=e.getTarget('em',3);if(hd&&!this.view.disableHeaders){var index=this.view.findHeaderIndex(hd);this.view.store.sort(this.view.columns[index].dataIndex);}}});
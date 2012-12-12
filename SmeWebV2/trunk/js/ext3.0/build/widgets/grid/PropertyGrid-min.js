/*
 * Ext JS Library 3.0 RC1
 * Copyright(c) 2006-2009, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */


Ext.grid.PropertyRecord=Ext.data.Record.create([{name:'name',type:'string'},'value']);Ext.grid.PropertyStore=function(grid,source){this.grid=grid;this.store=new Ext.data.Store({recordType:Ext.grid.PropertyRecord});this.store.on('update',this.onUpdate,this);if(source){this.setSource(source);}
Ext.grid.PropertyStore.superclass.constructor.call(this);};Ext.extend(Ext.grid.PropertyStore,Ext.util.Observable,{setSource:function(o){this.source=o;this.store.removeAll();var data=[];for(var k in o){if(this.isEditableValue(o[k])){data.push(new Ext.grid.PropertyRecord({name:k,value:o[k]},k));}}
this.store.loadRecords({records:data},{},true);},onUpdate:function(ds,record,type){if(type==Ext.data.Record.EDIT){var v=record.data['value'];var oldValue=record.modified['value'];if(this.grid.fireEvent('beforepropertychange',this.source,record.id,v,oldValue)!==false){this.source[record.id]=v;record.commit();this.grid.fireEvent('propertychange',this.source,record.id,v,oldValue);}else{record.reject();}}},getProperty:function(row){return this.store.getAt(row);},isEditableValue:function(val){if(Ext.isDate(val)){return true;}else if(typeof val=='object'||typeof val=='function'){return false;}
return true;},setValue:function(prop,value){this.source[prop]=value;this.store.getById(prop).set('value',value);},getSource:function(){return this.source;}});Ext.grid.PropertyColumnModel=function(grid,store){this.grid=grid;var g=Ext.grid;g.PropertyColumnModel.superclass.constructor.call(this,[{header:this.nameText,width:50,sortable:true,dataIndex:'name',id:'name',menuDisabled:true},{header:this.valueText,width:50,resizable:false,dataIndex:'value',id:'value',menuDisabled:true}]);this.store=store;this.bselect=Ext.DomHelper.append(document.body,{tag:'select',cls:'x-grid-editor x-hide-display',children:[{tag:'option',value:'true',html:'true'},{tag:'option',value:'false',html:'false'}]});var f=Ext.form;var bfield=new f.Field({el:this.bselect,bselect:this.bselect,autoShow:true,getValue:function(){return this.bselect.value=='true';}});this.editors={'date':new g.GridEditor(new f.DateField({selectOnFocus:true})),'string':new g.GridEditor(new f.TextField({selectOnFocus:true})),'number':new g.GridEditor(new f.NumberField({selectOnFocus:true,style:'text-align:left;'})),'boolean':new g.GridEditor(bfield)};this.renderCellDelegate=this.renderCell.createDelegate(this);this.renderPropDelegate=this.renderProp.createDelegate(this);};Ext.extend(Ext.grid.PropertyColumnModel,Ext.grid.ColumnModel,{nameText:'Name',valueText:'Value',dateFormat:'m/j/Y',renderDate:function(dateVal){return dateVal.dateFormat(this.dateFormat);},renderBool:function(bVal){return bVal?'true':'false';},isCellEditable:function(colIndex,rowIndex){return colIndex==1;},getRenderer:function(col){return col==1?this.renderCellDelegate:this.renderPropDelegate;},renderProp:function(v){return this.getPropertyName(v);},renderCell:function(val){var rv=val;if(Ext.isDate(val)){rv=this.renderDate(val);}else if(typeof val=='boolean'){rv=this.renderBool(val);}
return Ext.util.Format.htmlEncode(rv);},getPropertyName:function(name){var pn=this.grid.propertyNames;return pn&&pn[name]?pn[name]:name;},getCellEditor:function(colIndex,rowIndex){var p=this.store.getProperty(rowIndex);var n=p.data['name'],val=p.data['value'];if(this.grid.customEditors[n]){return this.grid.customEditors[n];}
if(Ext.isDate(val)){return this.editors['date'];}else if(typeof val=='number'){return this.editors['number'];}else if(typeof val=='boolean'){return this.editors['boolean'];}else{return this.editors['string'];}},destroy:function(){Ext.grid.PropertyColumnModel.superclass.destroy.call(this);for(var ed in this.editors){Ext.destroy(ed);}}});Ext.grid.PropertyGrid=Ext.extend(Ext.grid.EditorGridPanel,{enableColumnMove:false,stripeRows:false,trackMouseOver:false,clicksToEdit:1,enableHdMenu:false,viewConfig:{forceFit:true},initComponent:function(){this.customEditors=this.customEditors||{};this.lastEditRow=null;var store=new Ext.grid.PropertyStore(this);this.propStore=store;var cm=new Ext.grid.PropertyColumnModel(this,store);store.store.sort('name','ASC');this.addEvents('beforepropertychange','propertychange');this.cm=cm;this.ds=store.store;Ext.grid.PropertyGrid.superclass.initComponent.call(this);this.mon(this.selModel,'beforecellselect',function(sm,rowIndex,colIndex){if(colIndex===0){this.startEditing.defer(200,this,[rowIndex,1]);return false;}},this);},onRender:function(){Ext.grid.PropertyGrid.superclass.onRender.apply(this,arguments);this.getGridEl().addClass('x-props-grid');},afterRender:function(){Ext.grid.PropertyGrid.superclass.afterRender.apply(this,arguments);if(this.source){this.setSource(this.source);}},setSource:function(source){this.propStore.setSource(source);},getSource:function(){return this.propStore.getSource();}});Ext.reg("propertygrid",Ext.grid.PropertyGrid);
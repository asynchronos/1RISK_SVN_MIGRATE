/*
 * Ext JS Library 3.0 RC1
 * Copyright(c) 2006-2009, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */


Ext.DatePicker=Ext.extend(Ext.BoxComponent,{todayText:"Today",okText:"&#160;OK&#160;",cancelText:"Cancel",todayTip:"{0} (Spacebar)",minText:"This date is before the minimum date",maxText:"This date is after the maximum date",format:"m/d/y",disabledDaysText:"Disabled",disabledDatesText:"Disabled",monthNames:Date.monthNames,dayNames:Date.dayNames,nextText:'Next Month (Control+Right)',prevText:'Previous Month (Control+Left)',monthYearText:'Choose a month (Control+Up/Down to move years)',startDay:0,showToday:true,initComponent:function(){Ext.DatePicker.superclass.initComponent.call(this);this.value=this.value?this.value.clearTime():new Date().clearTime();this.addEvents('select');if(this.handler){this.on("select",this.handler,this.scope||this);}
this.initDisabledDays();},initDisabledDays:function(){if(!this.disabledDatesRE&&this.disabledDates){var dd=this.disabledDates;var re="(?:";for(var i=0;i<dd.length;i++){re+=dd[i];if(i!=dd.length-1)re+="|";}
this.disabledDatesRE=new RegExp(re+")");}},setDisabledDates:function(dd){if(Ext.isArray(dd)){this.disabledDates=dd;this.disabledDatesRE=null;}else{this.disabledDatesRE=dd;}
this.initDisabledDays();this.update(this.value,true);},setDisabledDays:function(dd){this.disabledDays=dd;this.update(this.value,true);},setMinDate:function(dt){this.minDate=dt;this.update(this.value,true);},setMaxDate:function(dt){this.maxDate=dt;this.update(this.value,true);},setValue:function(value){var old=this.value;this.value=value.clearTime(true);if(this.el){this.update(this.value);}},getValue:function(){return this.value;},focus:function(){if(this.el){this.update(this.activeDate);}},onRender:function(container,position){var m=['<table cellspacing="0">','<tr><td class="x-date-left"><a href="#" title="',this.prevText,'">&#160;</a></td><td class="x-date-middle" align="center"></td><td class="x-date-right"><a href="#" title="',this.nextText,'">&#160;</a></td></tr>','<tr><td colspan="3"><table class="x-date-inner" cellspacing="0"><thead><tr>'];var dn=this.dayNames;for(var i=0;i<7;i++){var d=this.startDay+i;if(d>6){d=d-7;}
m.push("<th><span>",dn[d].substr(0,1),"</span></th>");}
m[m.length]="</tr></thead><tbody><tr>";for(var i=0;i<42;i++){if(i%7==0&&i!=0){m[m.length]="</tr><tr>";}
m[m.length]='<td><a href="#" hidefocus="on" class="x-date-date" tabIndex="1"><em><span></span></em></a></td>';}
m.push('</tr></tbody></table></td></tr>',this.showToday?'<tr><td colspan="3" class="x-date-bottom" align="center"></td></tr>':'','</table><div class="x-date-mp"></div>');var el=document.createElement("div");el.className="x-date-picker";el.innerHTML=m.join("");container.dom.insertBefore(el,position);this.el=Ext.get(el);this.eventEl=Ext.get(el.firstChild);new Ext.util.ClickRepeater(this.el.child("td.x-date-left a"),{handler:this.showPrevMonth,scope:this,preventDefault:true,stopDefault:true});new Ext.util.ClickRepeater(this.el.child("td.x-date-right a"),{handler:this.showNextMonth,scope:this,preventDefault:true,stopDefault:true});this.mon(this.eventEl,"mousewheel",this.handleMouseWheel,this);this.monthPicker=this.el.down('div.x-date-mp');this.monthPicker.enableDisplayMode('block');var kn=new Ext.KeyNav(this.eventEl,{"left":function(e){e.ctrlKey?this.showPrevMonth():this.update(this.activeDate.add("d",-1));},"right":function(e){e.ctrlKey?this.showNextMonth():this.update(this.activeDate.add("d",1));},"up":function(e){e.ctrlKey?this.showNextYear():this.update(this.activeDate.add("d",-7));},"down":function(e){e.ctrlKey?this.showPrevYear():this.update(this.activeDate.add("d",7));},"pageUp":function(e){this.showNextMonth();},"pageDown":function(e){this.showPrevMonth();},"enter":function(e){e.stopPropagation();return true;},scope:this});this.mon(this.eventEl,"click",this.handleDateClick,this,{delegate:"a.x-date-date"});this.el.unselectable();this.cells=this.el.select("table.x-date-inner tbody td");this.textNodes=this.el.query("table.x-date-inner tbody span");this.mbtn=new Ext.Button({text:"&#160;",tooltip:this.monthYearText,renderTo:this.el.child("td.x-date-middle",true)});this.mon(this.mbtn,'click',this.showMonthPicker,this);this.mbtn.el.child('em').addClass("x-btn-arrow");if(this.showToday){this.todayKeyListener=this.eventEl.addKeyListener(Ext.EventObject.SPACE,this.selectToday,this);var today=(new Date()).dateFormat(this.format);this.todayBtn=new Ext.Button({renderTo:this.el.child("td.x-date-bottom",true),text:String.format(this.todayText,today),tooltip:String.format(this.todayTip,today),handler:this.selectToday,scope:this});}
if(Ext.isIE){this.el.repaint();}
this.update(this.value);},createMonthPicker:function(){if(!this.monthPicker.dom.firstChild){var buf=['<table border="0" cellspacing="0">'];for(var i=0;i<6;i++){buf.push('<tr><td class="x-date-mp-month"><a href="#">',this.monthNames[i].substr(0,3),'</a></td>','<td class="x-date-mp-month x-date-mp-sep"><a href="#">',this.monthNames[i+6].substr(0,3),'</a></td>',i==0?'<td class="x-date-mp-ybtn" align="center"><a class="x-date-mp-prev"></a></td><td class="x-date-mp-ybtn" align="center"><a class="x-date-mp-next"></a></td></tr>':'<td class="x-date-mp-year"><a href="#"></a></td><td class="x-date-mp-year"><a href="#"></a></td></tr>');}
buf.push('<tr class="x-date-mp-btns"><td colspan="4"><button type="button" class="x-date-mp-ok">',this.okText,'</button><button type="button" class="x-date-mp-cancel">',this.cancelText,'</button></td></tr>','</table>');this.monthPicker.update(buf.join(''));this.mon(this.monthPicker,'click',this.onMonthClick,this);this.mon(this.monthPicker,'dblclick',this.onMonthDblClick,this);this.mpMonths=this.monthPicker.select('td.x-date-mp-month');this.mpYears=this.monthPicker.select('td.x-date-mp-year');this.mpMonths.each(function(m,a,i){i+=1;if((i%2)==0){m.dom.xmonth=5+Math.round(i*.5);}else{m.dom.xmonth=Math.round((i-1)*.5);}});}},showMonthPicker:function(){this.createMonthPicker();var size=this.el.getSize();this.monthPicker.setSize(size);this.monthPicker.child('table').setSize(size);this.mpSelMonth=(this.activeDate||this.value).getMonth();this.updateMPMonth(this.mpSelMonth);this.mpSelYear=(this.activeDate||this.value).getFullYear();this.updateMPYear(this.mpSelYear);this.monthPicker.slideIn('t',{duration:.2});},updateMPYear:function(y){this.mpyear=y;var ys=this.mpYears.elements;for(var i=1;i<=10;i++){var td=ys[i-1],y2;if((i%2)==0){y2=y+Math.round(i*.5);td.firstChild.innerHTML=y2;td.xyear=y2;}else{y2=y-(5-Math.round(i*.5));td.firstChild.innerHTML=y2;td.xyear=y2;}
this.mpYears.item(i-1)[y2==this.mpSelYear?'addClass':'removeClass']('x-date-mp-sel');}},updateMPMonth:function(sm){this.mpMonths.each(function(m,a,i){m[m.dom.xmonth==sm?'addClass':'removeClass']('x-date-mp-sel');});},selectMPMonth:function(m){},onMonthClick:function(e,t){e.stopEvent();var el=new Ext.Element(t),pn;if(el.is('button.x-date-mp-cancel')){this.hideMonthPicker();}
else if(el.is('button.x-date-mp-ok')){var d=new Date(this.mpSelYear,this.mpSelMonth,(this.activeDate||this.value).getDate());if(d.getMonth()!=this.mpSelMonth){d=new Date(this.mpSelYear,this.mpSelMonth,1).getLastDateOfMonth();}
this.update(d);this.hideMonthPicker();}
else if(pn=el.up('td.x-date-mp-month',2)){this.mpMonths.removeClass('x-date-mp-sel');pn.addClass('x-date-mp-sel');this.mpSelMonth=pn.dom.xmonth;}
else if(pn=el.up('td.x-date-mp-year',2)){this.mpYears.removeClass('x-date-mp-sel');pn.addClass('x-date-mp-sel');this.mpSelYear=pn.dom.xyear;}
else if(el.is('a.x-date-mp-prev')){this.updateMPYear(this.mpyear-10);}
else if(el.is('a.x-date-mp-next')){this.updateMPYear(this.mpyear+10);}},onMonthDblClick:function(e,t){e.stopEvent();var el=new Ext.Element(t),pn;if(pn=el.up('td.x-date-mp-month',2)){this.update(new Date(this.mpSelYear,pn.dom.xmonth,(this.activeDate||this.value).getDate()));this.hideMonthPicker();}
else if(pn=el.up('td.x-date-mp-year',2)){this.update(new Date(pn.dom.xyear,this.mpSelMonth,(this.activeDate||this.value).getDate()));this.hideMonthPicker();}},hideMonthPicker:function(disableAnim){if(this.monthPicker){if(disableAnim===true){this.monthPicker.hide();}else{this.monthPicker.slideOut('t',{duration:.2});}}},showPrevMonth:function(e){this.update(this.activeDate.add("mo",-1));},showNextMonth:function(e){this.update(this.activeDate.add("mo",1));},showPrevYear:function(){this.update(this.activeDate.add("y",-1));},showNextYear:function(){this.update(this.activeDate.add("y",1));},handleMouseWheel:function(e){var delta=e.getWheelDelta();if(delta>0){this.showPrevMonth();e.stopEvent();}else if(delta<0){this.showNextMonth();e.stopEvent();}},handleDateClick:function(e,t){e.stopEvent();if(t.dateValue&&!Ext.fly(t.parentNode).hasClass("x-date-disabled")){this.setValue(new Date(t.dateValue));this.fireEvent("select",this,this.value);}},selectToday:function(){if(this.todayBtn&&!this.todayBtn.disabled){this.setValue(new Date().clearTime());this.fireEvent("select",this,this.value);}},update:function(date,forceRefresh){var vd=this.activeDate;this.activeDate=date;if(!forceRefresh&&vd&&this.el){var t=date.getTime();if(vd.getMonth()==date.getMonth()&&vd.getFullYear()==date.getFullYear()){this.cells.removeClass("x-date-selected");this.cells.each(function(c){if(c.dom.firstChild.dateValue==t){c.addClass("x-date-selected");setTimeout(function(){try{c.dom.firstChild.focus();}catch(e){}},50);return false;}});return;}}
var days=date.getDaysInMonth();var firstOfMonth=date.getFirstDateOfMonth();var startingPos=firstOfMonth.getDay()-this.startDay;if(startingPos<=this.startDay){startingPos+=7;}
var pm=date.add("mo",-1);var prevStart=pm.getDaysInMonth()-startingPos;var cells=this.cells.elements;var textEls=this.textNodes;days+=startingPos;var day=86400000;var d=(new Date(pm.getFullYear(),pm.getMonth(),prevStart)).clearTime();var today=new Date().clearTime().getTime();var sel=date.clearTime().getTime();var min=this.minDate?this.minDate.clearTime():Number.NEGATIVE_INFINITY;var max=this.maxDate?this.maxDate.clearTime():Number.POSITIVE_INFINITY;var ddMatch=this.disabledDatesRE;var ddText=this.disabledDatesText;var ddays=this.disabledDays?this.disabledDays.join(""):false;var ddaysText=this.disabledDaysText;var format=this.format;if(this.showToday){var td=new Date().clearTime();var disable=(td<min||td>max||(ddMatch&&format&&ddMatch.test(td.dateFormat(format)))||(ddays&&ddays.indexOf(td.getDay())!=-1));this.todayBtn.setDisabled(disable);this.todayKeyListener[disable?'disable':'enable']();}
var setCellClass=function(cal,cell){cell.title="";var t=d.getTime();cell.firstChild.dateValue=t;if(t==today){cell.className+=" x-date-today";cell.title=cal.todayText;}
if(t==sel){cell.className+=" x-date-selected";setTimeout(function(){try{cell.firstChild.focus();}catch(e){}},50);}
if(t<min){cell.className=" x-date-disabled";cell.title=cal.minText;return;}
if(t>max){cell.className=" x-date-disabled";cell.title=cal.maxText;return;}
if(ddays){if(ddays.indexOf(d.getDay())!=-1){cell.title=ddaysText;cell.className=" x-date-disabled";}}
if(ddMatch&&format){var fvalue=d.dateFormat(format);if(ddMatch.test(fvalue)){cell.title=ddText.replace("%0",fvalue);cell.className=" x-date-disabled";}}};var i=0;for(;i<startingPos;i++){textEls[i].innerHTML=(++prevStart);d.setDate(d.getDate()+1);cells[i].className="x-date-prevday";setCellClass(this,cells[i]);}
for(;i<days;i++){var intDay=i-startingPos+1;textEls[i].innerHTML=(intDay);d.setDate(d.getDate()+1);cells[i].className="x-date-active";setCellClass(this,cells[i]);}
var extraDays=0;for(;i<42;i++){textEls[i].innerHTML=(++extraDays);d.setDate(d.getDate()+1);cells[i].className="x-date-nextday";setCellClass(this,cells[i]);}
this.mbtn.setText(this.monthNames[date.getMonth()]+" "+date.getFullYear());if(!this.internalRender){var main=this.el.dom.firstChild;var w=main.offsetWidth;this.el.setWidth(w+this.el.getBorderWidth("lr"));Ext.fly(main).setWidth(w);this.internalRender=true;if(Ext.isOpera&&!this.secondPass){main.rows[0].cells[1].style.width=(w-(main.rows[0].cells[0].offsetWidth+main.rows[0].cells[2].offsetWidth))+"px";this.secondPass=true;this.update.defer(10,this,[date]);}}},beforeDestroy:function(){if(this.rendered){Ext.destroy(this.leftClickRpt,this.rightClickRpt,this.monthPicker,this.eventEl,this.mbtn,this.todayBtn);}}});Ext.reg('datepicker',Ext.DatePicker);
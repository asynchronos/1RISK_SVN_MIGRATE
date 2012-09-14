<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Chart.ascx.vb" Inherits="Controls_Chart_Chart" %>
<%@ Register assembly="OpenFlashChartLibrary" namespace="OpenFlashChartLibrary" tagprefix="ofc" %>
    
                           <ofc:OpenFlashChartControl ID="Chart1" runat="server" 
                               dataSource="GraphData.aspx" heightPx="200" isSwfObjectEnabled="true" 
                               visible="true" widthPx="500">
                           </ofc:OpenFlashChartControl>
    
                           
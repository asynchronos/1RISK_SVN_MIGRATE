Imports Microsoft.VisualBasic
Imports System.Runtime.CompilerServices
Imports System.Globalization
Imports System.Threading

Public Module ExtensionHelper
    <Extension()> _
    Public Function ToDateDisplay(ByVal dtValue As Date) As String
        Thread.CurrentThread.CurrentCulture = New CultureInfo("th-TH")
        Thread.CurrentThread.CurrentUICulture = New CultureInfo("th-TH")
        Return dtValue.ToString("dd MMM yyyy")
    End Function
End Module


<%@ Page Language="VB" AutoEventWireup="false" CodeFile="testUploadAjax.aspx.vb" Inherits="smes_testUploadAjax" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-1.7.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#FileUpload1").change(function () {
                var fileName = $(this).val();
                var value = uploadExcellFile(fileName);
                alert(value);
            });
        });
        function uploadExcellFile(F) {
            

            return F;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="FileUpload1" runat="server" />
    </div>
    </form>
</body>
</html>


Partial Class aspx_category_CategoryMaster
    Inherits aspx.MyPageClass

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        'change old ext resouce to new version
        addHaederLinkAt(0, "~/js/ext-3.3.1/resources/css/ext-all.css")

        addHaederScriptAt(1, "~/js/ext-3.3.1/adapter/ext/ext-base.js")
        addHaederScriptAt(2, "~/js/ext-3.3.1/ext-all.js")
    End Sub
End Class

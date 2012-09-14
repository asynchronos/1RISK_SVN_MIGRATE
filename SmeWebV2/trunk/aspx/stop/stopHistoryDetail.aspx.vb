Option Strict On
Option Explicit On

Namespace aspx.stop
    Partial Class stopHistoryDetail
        Inherits aspx.MyPageClass
    
#Region "Const"

Protected Const CIFLabelFieldToolTip As String = "CIF"
Protected Const CIFLabelFieldText As String = CIFLabelFieldToolTip + ":"

Protected Const CUS_NAMELabelFieldToolTip As String = "ชื่อลูกค้า"
Protected Const CUS_NAMELabelFieldText As String = CUS_NAMELabelFieldToolTip + ":"

Protected Const SEQUENCELabelFieldToolTip As String = "เข้ามาครั้งที่"
Protected Const SEQUENCELabelFieldText As String = SEQUENCELabelFieldToolTip + ":"

Protected Const DATE_INLabelFieldToolTip As String = "วันที่เข้า Stop Program"
Protected Const DATE_INLabelFieldText As String = DATE_INLabelFieldToolTip + ":"

Protected Const AGING_DPD_C_INLabelFieldToolTip As String = "AGING(Commercial ณ วันที่เข้า)"
Protected Const AGING_DPD_C_INLabelFieldText As String = AGING_DPD_C_INLabelFieldToolTip + ":"

Protected Const AGING_DPD_C_OUTLabelFieldToolTip As String = "AGING(Commercial ณ วันที่ออก)"
Protected Const AGING_DPD_C_OUTLabelFieldText As String = AGING_DPD_C_OUTLabelFieldToolTip + ":"

Protected Const AGING_DPD_O_INLabelFieldToolTip As String = "AGING(Non Commercial ณ วันที่เข้า)"
Protected Const AGING_DPD_O_INLabelFieldText As String = AGING_DPD_O_INLabelFieldToolTip + ":"

Protected Const AGING_DPD_O_OUTLabelFieldToolTip As String = "AGING(Non Commercial ณ วันที่ออก)"
Protected Const AGING_DPD_O_OUTLabelFieldText As String = AGING_DPD_O_OUTLabelFieldToolTip + ":"

Protected Const AGING_H_INLabelFieldToolTip As String = "AGING ย้อนหลัง<br />(ณ วันที่เข้า)"
Protected Const AGING_H_INLabelFieldText As String = AGING_H_INLabelFieldToolTip + ":"

Protected Const AGING_H_OUTLabelFieldToolTip As String = "AGING ย้อนหลัง<br />(ณ วันที่ออก)"
Protected Const AGING_H_OUTLabelFieldText As String = AGING_H_OUTLabelFieldToolTip + ":"

Protected Const AGING_DPD_INLabelFieldToolTip As String = "MAX AGING<br />(ณ วันที่เข้า)"
Protected Const AGING_DPD_INLabelFieldText As String = AGING_DPD_INLabelFieldToolTip + ":"

Protected Const AGING_DPD_OUTLabelFieldToolTip As String = "MAX AGING<br />(ณ วันที่ออก)"
Protected Const AGING_DPD_OUTLabelFieldText As String = AGING_DPD_OUTLabelFieldToolTip + ":"

Protected Const AGING_CRITERIA_INLabelFieldToolTip As String = "เข้าStopเพราะAging"
Protected Const AGING_CRITERIA_INLabelFieldText As String = AGING_CRITERIA_INLabelFieldToolTip + ":"

Protected Const CLASS_H_INLabelFieldToolTip As String = "ชั้นหนี้ย้อนหลัง<br />(ณ วันที่เข้า)"
Protected Const CLASS_H_INLabelFieldText As String = CLASS_H_INLabelFieldToolTip + ":"

Protected Const CLASS_H_OUTLabelFieldToolTip As String = "ชั้นหนี้ย้อนหลัง<br />(ณ วันที่ออก)"
Protected Const CLASS_H_OUTLabelFieldText As String = CLASS_H_OUTLabelFieldToolTip + ":"

Protected Const CLASS_CRITERIA_INLabelFieldToolTip As String = "เข้าStopเพราะชั้นหนี้"
Protected Const CLASS_CRITERIA_INLabelFieldText As String = CLASS_CRITERIA_INLabelFieldToolTip + ":"

Protected Const HAS_OTHER_CLASS_INLabelFieldToolTip As String = "HAS_OTHER_CLASS_IN"
Protected Const HAS_OTHER_CLASS_INLabelFieldText As String = HAS_OTHER_CLASS_INLabelFieldToolTip + ":"

Protected Const HAS_OTHER_CLASS_OUTLabelFieldToolTip As String = "HAS_OTHER_CLASS_OUT"
Protected Const HAS_OTHER_CLASS_OUTLabelFieldText As String = HAS_OTHER_CLASS_OUTLabelFieldToolTip + ":"

Protected Const IS_TDR_INLabelFieldToolTip As String = "เคยทำTDRหรือไม่<br />(ณ วันที่เข้า)"
Protected Const IS_TDR_INLabelFieldText As String = IS_TDR_INLabelFieldToolTip + ":"

Protected Const IS_TDR_OUTLabelFieldToolTip As String = "เคยทำTDRหรือไม่<br />(ณ วันที่ออก)"
Protected Const IS_TDR_OUTLabelFieldText As String = IS_TDR_OUTLabelFieldToolTip + ":"

Protected Const TDR_CRITERIA_INLabelFieldToolTip As String = "เข้าStopเพราะเป็นTDR"
Protected Const TDR_CRITERIA_INLabelFieldText As String = TDR_CRITERIA_INLabelFieldToolTip + ":"

Protected Const OD_UTILIZE_INLabelFieldToolTip As String = "%การใช้วงเงินO/D<br />(ณ วันที่เข้า)"
Protected Const OD_UTILIZE_INLabelFieldText As String = OD_UTILIZE_INLabelFieldToolTip + ":"

Protected Const OD_UTILIZE_OUTLabelFieldToolTip As String = "%การใช้วงเงินO/D<br />(ณ วันที่ออก)"
Protected Const OD_UTILIZE_OUTLabelFieldText As String = OD_UTILIZE_OUTLabelFieldToolTip + ":"

Protected Const OD_UTILIZE_CRITERIA_INLabelFieldToolTip As String = "เข้าStopเพราะO/D>80%<br />แต่Movement<20%"
Protected Const OD_UTILIZE_CRITERIA_INLabelFieldText As String = OD_UTILIZE_CRITERIA_INLabelFieldToolTip + ":"

Protected Const MOVEMENT_INLabelFieldToolTip As String = "%Movetment<br />(ณ วันที่เข้า)"
Protected Const MOVEMENT_INLabelFieldText As String = MOVEMENT_INLabelFieldToolTip + ":"

Protected Const MOVEMENT_OUTLabelFieldToolTip As String = "%Movetment<br />(ณ วันที่ออก)"
Protected Const MOVEMENT_OUTLabelFieldText As String = MOVEMENT_OUTLabelFieldToolTip + ":"

Protected Const JUDGEMENT_ID_INLabelFieldToolTip As String = "Judgement<br />(ณ วันที่เข้า)"
Protected Const JUDGEMENT_ID_INLabelFieldText As String = JUDGEMENT_ID_INLabelFieldToolTip + ":"

Protected Const JUDGEMENT_ID_OUTLabelFieldToolTip As String = "Judgement<br />(ณ วันที่ออก)"
Protected Const JUDGEMENT_ID_OUTLabelFieldText As String = JUDGEMENT_ID_OUTLabelFieldToolTip + ":"

Protected Const JUDGEMENT_CRITERIA_INLabelFieldToolTip As String = "เข้าStopเพราะJudgement<br />เป็น Watch List"
Protected Const JUDGEMENT_CRITERIA_INLabelFieldText As String = JUDGEMENT_CRITERIA_INLabelFieldToolTip + ":"

Protected Const BUSINESS_CIM_FLAG_INLabelFieldToolTip As String = "BUSINESS_CIM_FLAG_IN"
Protected Const BUSINESS_CIM_FLAG_INLabelFieldText As String = BUSINESS_CIM_FLAG_INLabelFieldToolTip + ":"

Protected Const BUSINESS_CIM_FLAG_OUTLabelFieldToolTip As String = "BUSINESS_CIM_FLAG_OUT"
Protected Const BUSINESS_CIM_FLAG_OUTLabelFieldText As String = BUSINESS_CIM_FLAG_OUTLabelFieldToolTip + ":"

Protected Const BUSINESS_CRITERIA_INLabelFieldToolTip As String = "เข้าStopเพราะประเภทธุรกิจ"
Protected Const BUSINESS_CRITERIA_INLabelFieldText As String = BUSINESS_CRITERIA_INLabelFieldToolTip + ":"

Protected Const BUSINESS_CODE_INLabelFieldToolTip As String = "รหัสประเภทธุรกิจ<br />(ณ วันที่เข้า)"
Protected Const BUSINESS_CODE_INLabelFieldText As String = BUSINESS_CODE_INLabelFieldToolTip + ":"

Protected Const BUSINESS_CODE_OUTLabelFieldToolTip As String = "รหัสประเภทธุรกิจ<br />(ณ วันที่ออก)"
Protected Const BUSINESS_CODE_OUTLabelFieldText As String = BUSINESS_CODE_OUTLabelFieldToolTip + ":"

Protected Const BUSINESS_DESC_INLabelFieldToolTip As String = "ประเภทธุรกิจ<br />(ณ วันที่เข้า)"
Protected Const BUSINESS_DESC_INLabelFieldText As String = BUSINESS_DESC_INLabelFieldToolTip + ":"

Protected Const BUSINESS_DESC_OUTLabelFieldToolTip As String = "ประเภทธุรกิจ<br />(ณ วันที่ออก)"
Protected Const BUSINESS_DESC_OUTLabelFieldText As String = BUSINESS_DESC_OUTLabelFieldToolTip + ":"

Protected Const UPDATE_ACTION_IDLabelFieldToolTip As String = "การดำเนินการ"
Protected Const UPDATE_ACTION_IDLabelFieldText As String = UPDATE_ACTION_IDLabelFieldToolTip + ":"

Protected Const UPDATE_ACTION_DATELabelFieldToolTip As String = "วันที่บันทึกข้อมูลการดำเนินการ"
Protected Const UPDATE_ACTION_DATELabelFieldText As String = UPDATE_ACTION_DATELabelFieldToolTip + ":"

Protected Const UPDATE_ACTION_USERLabelFieldToolTip As String = "รหัสพนักงานที่บันทึกข้อมูล"
Protected Const UPDATE_ACTION_USERLabelFieldText As String = UPDATE_ACTION_USERLabelFieldToolTip + ":"

Protected Const EMP_NAMELabelFieldToolTip As String = "ชื่อพนักงานที่บันทึกข้อมูล"
Protected Const EMP_NAMELabelFieldText As String = EMP_NAMELabelFieldToolTip + ":"

Protected Const PAY_ABILITYLabelFieldToolTip As String = "ความสามารถในการชำระหนี้"
Protected Const PAY_ABILITYLabelFieldText As String = PAY_ABILITYLabelFieldToolTip + ":"

'Protected Const PAY_DETAILLabelFieldToolTip As String = "PAY_DETAIL"
'Protected Const PAY_DETAILLabelFieldText As String = PAY_DETAILLabelFieldToolTip + ":"

Protected Const DEPT_RESOLVELabelFieldToolTip As String = "วิธีการแก้ไขหนี้"
Protected Const DEPT_RESOLVELabelFieldText As String = DEPT_RESOLVELabelFieldToolTip + ":"

Protected Const UPDATE_TDR_DATELabelFieldToolTip As String = "วันที่Register TDR"
Protected Const UPDATE_TDR_DATELabelFieldText As String = UPDATE_TDR_DATELabelFieldToolTip + ":"

Protected Const DATE_OUTLabelFieldToolTip As String = "วันที่ออก Stop Program"
Protected Const DATE_OUTLabelFieldText As String = DATE_OUTLabelFieldToolTip + ":"

Protected Const COMMENTLabelFieldToolTip As String = "COMMENT"
Protected Const COMMENTLabelFieldText As String = COMMENTLabelFieldToolTip + ":"

#End Region

#Region "Move_2_Stop"
Protected Sub move2StopButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    'Stored ที่ใช้สำหรับส่งกลับไปยัง STOP CUSTOMER ถูกเก็บไว้ที่ Insert ของ History_DS
    'เพราะไม่น่าจะมีการ insert โดย manual ลง Table STOP_CUSTOMER_HISTORY
    Dim result As Integer = HistoryDetail_DS.Insert()
    DetailFormView.DataBind()
End Sub

Protected Sub HistoryDetail_DS_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles HistoryDetail_DS.Inserted
    'Response.Write("ทำการย้ายกลับเรียบร้อยแล้ว")
    Label1.Visible = True
    CloseButton.Visible = True
End Sub

Protected Sub HistoryDetail_DS_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles HistoryDetail_DS.Inserting
    e.Command.Parameters.Item("@CIF").Value = DetailFormView.SelectedValue
End Sub
#End Region

    End Class
End Namespace

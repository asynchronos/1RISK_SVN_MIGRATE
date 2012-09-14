Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Diagnostics

Public Class AnnalsCredit

    Private Const CLSNAME As String = "Class AnnalsCredit"

    Private strID As String
    Private strANNALS_TYPE As String
    Private strANNALS_SEQ_NO As String
    Private strANNALS_YEAR As String
    Private strID_OUT As String
    Private strEMP_APPROVE_ID As String
    Private strEMP_REQUEST_ID As String
    Private strEMP_APPROVE2_ID As String
    Private bolSend_To_Board As String
    Private strBOARD_ID As String
    Private strBOARD_Others As String
    Private strRM_ID As String
    Private strBRANCH_ID As String
    Private strDEP_ID As String
    Private strFlag As String
    Private strREGION_ID As String
    Private strOthers As String
    Private strOthers2 As String
    Private strResult As String
    Private strComment As String
    Private strCMJudgement As String
    Private strCMJudgementBoard As String
    Private strCMRemark As String
    Private strReason As String   ' เพิ่มฟิวเหตผลวันที่ 28/07/2008
    Private strReason2 As String
    Private strJob_Type_Id As String ' เพิ่มฟิวประเภทงานวันที่ 26/11/2008
    Private strSME_Referral_No As String ' 23/2/2009
    Private strCustomer_Size As String  '29/06/2009
    Private strEMP_APPROVE3_ID As String    ' เพิ่มฟิว ผู้อนุมัติคนที่ 3-4 วันที่   28/07/2009
    Private strEMP_APPROVE4_ID As String    ' เพิ่มฟิว ผู้อนุมัติคนที่ 3-4 วันที่   28/07/2009
    Private strCOVENANT_FLAG As String   ' เพิ่มฟิว  ระบุว่ามีหรือไม่มี covenant  วันที่   29/09/2009
    'Private strCONFIRMVALUE_FLAG As String   '   เพิ่มฟิว  ยืนยันค่าที่กรอกใหน cm/board /approve 06/01/2553
    'Private strCONFIRMVALUE_EMP As String       '   เพิ่มฟิว ผู้ที่ยืนยัน
    Private strDO_KFS_FLAG As String   '   เพิ่มฟิว  แสดงว่า ca นี้มีการทำ หนังสือ kfs 18/02/2553
    Private strSUB_COMMITTEE_1 As String   '   เพิ่มฟิว  แสดงว่า ca นี้มี subcommittee  7/04/2553
    Private strSUB_COMMITTEE_2 As String     '   เพิ่มฟิว  แสดงว่า ca นี้มี subcommittee  7/04/2553
    Private strSUB_COMMITTEE_3 As String     '   เพิ่มฟิว  แสดงว่า ca นี้มี subcommittee  7/04/2553
    Private strOUT_OF_SCOPE_ID As String      '   18/05/2554
    Private decGROUP_EXPOSURE As Decimal   '   27/05/2554
    Private dateREVIEW_DATE As Date
    Private strEMP_CONTROL As String            '   20/07/2554
    Private intIS_FLOOD As Integer           ' 02/04/2555
    Private intIS_FLOOD_BOT As Integer   ' 02/04/2555


    Public Property ID() As String
        Get
            Return strID
        End Get
        Set(ByVal Value As String)
            strID = Value
        End Set
    End Property

    Public Property ANNALS_TYPE() As String
        Get
            Return strANNALS_TYPE
        End Get
        Set(ByVal Value As String)
            strANNALS_TYPE = Value
        End Set
    End Property

    Public Property ANNALS_SEQ_NO() As String
        Get
            Return strANNALS_SEQ_NO
        End Get
        Set(ByVal Value As String)
            strANNALS_SEQ_NO = Value
        End Set
    End Property

    Public Property ANNALS_YEAR() As String
        Get
            Return strANNALS_YEAR
        End Get
        Set(ByVal Value As String)
            strANNALS_YEAR = Value
        End Set
    End Property

    Public Property ID_OUT() As String
        Get
            Return strID_OUT
        End Get
        Set(ByVal Value As String)
            strID_OUT = Value
        End Set
    End Property

    Public Property EMP_APPROVE_ID() As String
        Get
            Return strEMP_APPROVE_ID
        End Get
        Set(ByVal Value As String)
            strEMP_APPROVE_ID = Value
        End Set
    End Property

    Public Property EMP_REQUEST_ID() As String
        Get
            Return strEMP_REQUEST_ID
        End Get
        Set(ByVal Value As String)
            strEMP_REQUEST_ID = Value
        End Set
    End Property

    Public Property EMP_APPROVE2_ID() As String
        Get
            Return strEMP_APPROVE2_ID
        End Get
        Set(ByVal Value As String)
            strEMP_APPROVE2_ID = Value
        End Set
    End Property

    Public Property Send_To_Board() As String
        Get
            Return bolSend_To_Board
        End Get
        Set(ByVal Value As String)
            bolSend_To_Board = Value
        End Set
    End Property

    Public Property BOARD_ID() As String
        Get
            Return strBOARD_ID
        End Get
        Set(ByVal Value As String)
            strBOARD_ID = Value
        End Set
    End Property

    Public Property BOARD_Others() As String
        Get
            Return strBOARD_Others
        End Get
        Set(ByVal Value As String)
            strBOARD_Others = Value
        End Set
    End Property

    Public Property RM_ID() As String
        Get
            Return strRM_ID
        End Get
        Set(ByVal Value As String)
            strRM_ID = Value
        End Set
    End Property

    Public Property BRANCH_ID() As String
        Get
            Return strBRANCH_ID
        End Get
        Set(ByVal Value As String)
            strBRANCH_ID = Value
        End Set
    End Property
    Public Property Flag() As String
        Get
            Return strFlag
        End Get
        Set(ByVal Value As String)
            strFlag = Value
        End Set
    End Property
    Public Property DEP_ID() As String
        Get
            Return strDEP_ID
        End Get
        Set(ByVal Value As String)
            strDEP_ID = Value
        End Set
    End Property

    Public Property REGION_ID() As String
        Get
            Return strREGION_ID
        End Get
        Set(ByVal Value As String)
            strREGION_ID = Value
        End Set
    End Property

    Public Property Others() As String
        Get
            Return strOthers
        End Get
        Set(ByVal Value As String)
            strOthers = Value
        End Set
    End Property

    Public Property Others2() As String
        Get
            Return strOthers2
        End Get
        Set(ByVal Value As String)
            strOthers2 = Value
        End Set
    End Property

    Public Property Result() As String
        Get
            Return strResult
        End Get
        Set(ByVal Value As String)
            strResult = Value
        End Set
    End Property
    Public Property Comment() As String
        Get
            Return strComment
        End Get
        Set(ByVal Value As String)
            strComment = Value
        End Set
    End Property
    Public Property CMJudgement() As String
        Get
            Return strCMJudgement
        End Get
        Set(ByVal Value As String)
            strCMJudgement = Value
        End Set
    End Property
    Public Property CMJudgementBoard() As String
        Get
            Return strCMJudgementBoard
        End Get
        Set(ByVal Value As String)
            strCMJudgementBoard = Value
        End Set
    End Property

    Public Property CMRemark() As String
        Get
            Return strCMRemark
        End Get
        Set(ByVal Value As String)
            strCMRemark = Value
        End Set
    End Property
    Public Property Reason() As String
        Get
            Return strReason
        End Get
        Set(ByVal Value As String)
            strReason = Value
        End Set
    End Property
    Public Property Reason2() As String
        Get
            Return strReason2
        End Get
        Set(ByVal Value As String)
            strReason2 = Value
        End Set
    End Property
    Public Property Job_Type_Id() As String
        Get
            Return strJob_Type_Id
        End Get
        Set(ByVal Value As String)
            strJob_Type_Id = Value
        End Set
    End Property
    Public Property SME_Referral_No() As String
        Get
            Return strSME_Referral_No
        End Get
        Set(ByVal Value As String)
            strSME_Referral_No = Value
        End Set
    End Property
    Public Property Customer_Size() As String
        Get
            Return strCustomer_Size
        End Get
        Set(ByVal Value As String)
            strCustomer_Size = Value
        End Set
    End Property

    Public Property EMP_APPROVE3_ID() As String
        Get
            Return strEMP_APPROVE3_ID
        End Get
        Set(ByVal Value As String)
            strEMP_APPROVE3_ID = Value
        End Set
    End Property

    Public Property EMP_APPROVE4_ID() As String
        Get
            Return strEMP_APPROVE4_ID
        End Get
        Set(ByVal Value As String)
            strEMP_APPROVE4_ID = Value
        End Set
    End Property
    Public Property COVENANT_FLAG() As String
        Get
            Return strCOVENANT_FLAG
        End Get
        Set(ByVal Value As String)
            strCOVENANT_FLAG = Value
        End Set
    End Property
    Public Property DO_KFS_FLAG() As String
        Get
            Return strDO_KFS_FLAG
        End Get
        Set(ByVal Value As String)
            strDO_KFS_FLAG = Value
        End Set
    End Property
    Public Property SUB_COMMITTEE_1() As String
        Get
            Return strSUB_COMMITTEE_1
        End Get
        Set(ByVal Value As String)
            strSUB_COMMITTEE_1 = Value
        End Set
    End Property
    Public Property SUB_COMMITTEE_2() As String
        Get
            Return strSUB_COMMITTEE_2
        End Get
        Set(ByVal Value As String)
            strSUB_COMMITTEE_2 = Value
        End Set
    End Property
    Public Property SUB_COMMITTEE_3() As String
        Get
            Return strSUB_COMMITTEE_3
        End Get
        Set(ByVal Value As String)
            strSUB_COMMITTEE_3 = Value
        End Set
    End Property
    Public Property OUT_OF_SCOPE_ID() As String
        Get
            Return strOUT_OF_SCOPE_ID
        End Get
        Set(ByVal Value As String)
            strOUT_OF_SCOPE_ID = Value
        End Set
    End Property
    Public Property GROUP_EXPOSURE() As Decimal
        Get
            Return decGROUP_EXPOSURE
        End Get
        Set(ByVal Value As Decimal)
            decGROUP_EXPOSURE = Value
        End Set
    End Property

    Public Property REVIEW_DATE() As Date
        Get
            Return dateREVIEW_DATE
        End Get
        Set(ByVal Value As Date)
            dateREVIEW_DATE = Value
        End Set
    End Property

    Public Property EMP_CONTROL() As String
        Get
            Return strEMP_CONTROL
        End Get
        Set(ByVal Value As String)
            strEMP_CONTROL = Value
        End Set
    End Property
    Public Property IS_FLOOD() As Integer
        Get
            Return intIS_FLOOD
        End Get
        Set(ByVal Value As Integer)
            intIS_FLOOD = Value
        End Set
    End Property



    'Public Sub Print()
    '    Debug.Print("")
    '    Debug.Print("ID : " & ID)
    '    Debug.Print("ANNALS_TYPE : " & ANNALS_TYPE)
    '    Debug.Print("ANNALS_SEQ_NO : " & ANNALS_SEQ_NO)
    '    Debug.Print("ANNALS_YEAR : " & ANNALS_YEAR)
    '    Debug.Print("ID_OUT : " & ID_OUT)
    '    Debug.Print("EMP_APPROVE_ID : " & EMP_APPROVE_ID)
    '    Debug.Print("EMP_REQUEST_ID : " & EMP_REQUEST_ID)
    '    Debug.Print("EMP_APPROVE2_ID : " & EMP_APPROVE2_ID)
    '    Debug.Print("Send_To_Board : " & Send_To_Board)
    '    Debug.Print("BOARD_ID : " & BOARD_ID)
    '    Debug.Print("BOARD_Others : " & BOARD_Others)
    '    Debug.Print("RM_ID : " & RM_ID)
    '    Debug.Print("BRANCH_ID : " & BRANCH_ID)
    '    Debug.Print("FLAG:" & Flag)
    '    Debug.Print("DEP_ID : " & DEP_ID)
    '    Debug.Print("REGION_ID : " & REGION_ID)
    '    Debug.Print("Others : " & Others)
    '    Debug.Print("Others2 : " & Others2)
    '    Debug.Print("Result : " & Result)
    '    Debug.Print("Comment : " & Comment)
    '    Debug.Print("CMJudgement : " & CMJudgement)
    '    Debug.Print("CMJudgementBoard : " & CMJudgementBoard)
    '    Debug.Print("CMRemark : " & CMRemark)
    '    Debug.Print("Reason : " & Reason)
    '    Debug.Print("Reason : " & Reason2)
    '    Debug.Print("Job_Type_Id : " & Job_Type_Id)
    '    Debug.Print("SME_Referral_No : " & SME_Referral_No)
    '    Debug.Print("Customer_Size :" & Customer_Size)
    '    Debug.Print("EMP_APPROVE3_ID : " & EMP_APPROVE3_ID)
    '    Debug.Print("EMP_APPROVE4_ID : " & EMP_APPROVE4_ID)
    '    Debug.Print("COVENANT_FLAG : " & COVENANT_FLAG)
    '    Debug.Print("SUB_COMMITTEE_1 : " & SUB_COMMITTEE_1)
    '    Debug.Print("SUB_COMMITTEE_2 : " & SUB_COMMITTEE_2)
    '    Debug.Print("SUB_COMMITTEE_3 : " & SUB_COMMITTEE_3)
    '    Debug.Print("OUT_OF_SCOPE  : " & OUT_OF_SCOPE_ID)
    '    Debug.Print("GROUP_EXPOSURE  : " & GROUP_EXPOSURE)
    '    Debug.Print("EMP_CONTROL  : " & EMP_CONTROL)


    'End Sub

End Class
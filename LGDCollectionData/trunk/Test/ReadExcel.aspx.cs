using System;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Web;
using log4net;
using NPOI.HSSF.UserModel;

namespace LGDCollectionData.Test
{
    public partial class ReadExcel : System.Web.UI.Page
    {
        private static readonly ILog log = LogManager.GetLogger(
            System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected void Page_Load(object sender, EventArgs e)
        {
            log.Debug("load");
            using (FileStream fs = new FileStream(Server.MapPath(@"\Excel\RestructureInformation.xls"), FileMode.Open, FileAccess.Read))
            {
                HSSFWorkbook wb = new HSSFWorkbook(fs, true);
                log.Debug(wb.GetSheetName(0));
                HSSFSheet sh = (HSSFSheet)wb.GetSheet("ตารางคำนวณ");

                log.Debug(sh.GetRow(11).GetCell(13).CellType.ToString());
                log.Debug(sh.GetRow(11).GetCell(13).StringCellValue);

                log.Debug(sh.GetRow(14).GetCell(13).CellType.ToString());
                log.Debug(sh.GetRow(14).GetCell(13).NumericCellValue);
            }
        }

        /// <summary>
        /// Render a Excel 2007 (xlsx) Worksheet to NPOI Excel 2003 Worksheet, all excel formatting
        /// from XLSX will be lost when converted.  NPOI roadmap shows v1.6 will support Excel 2007 (xlsx).
        /// NPOI Roadmap  : http://npoi.codeplex.com/wikipage?title=NPOI%20Road%20Map&referringTitle=Documentation
        /// NPOI Homepage : http://npoi.codeplex.com/
        /// </summary>
        /// <param name="excelFileStream">XLSX FileStream</param>
        /// <param name="sheetName">Excel worksheet to convert</param>
        /// <returns>MemoryStream containing NPOI Excel workbook</returns>
        public static Stream ConvertXLSXWorksheetToXLSWorksheet(Stream excelFileStream, string sheetName)
        {
            // Temp file name
            string tempFile = HttpContext.Current.Server.MapPath("~/uploads/" + HttpContext.Current.Session.LCID + ".tmp");

            // Temp data container (using DataTable to leverage existing RenderDataTableToExcel function)
            DataTable dt = new DataTable();

            try
            {
                // Create temp XLSX file
                FileStream fileStream = new FileStream(tempFile, FileMode.Create, FileAccess.Write);

                const int length = 256;

                Byte[] buffer = new Byte[length];

                int bytesRead = excelFileStream.Read(buffer, 0, length);

                while (bytesRead > 0)
                {
                    fileStream.Write(buffer, 0, bytesRead);

                    bytesRead = excelFileStream.Read(buffer, 0, length);
                }

                excelFileStream.Close();
                fileStream.Close();

                // Read temp XLSX file using OLEDB
                // Tested on Vista & Windows 2008 R2
                using (OleDbConnection con = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0; Extended Properties=Excel 12.0;Data Source=" + tempFile + @";Extended Properties=Excel 12.0;"))
                {
                    con.Open();

                    string sql = String.Format("SELECT * FROM [{0}$]", sheetName);

                    OleDbDataAdapter da = new OleDbDataAdapter(sql, con);

                    da.Fill(dt);
                }
            }

            finally
            {
                // Make sure temp file is deleted

                File.Delete(tempFile);
            }

            // Return a new POI Excel 2003 Workbook

            return RenderDataTableToExcel(dt);
        }

        /// <summary>
        /// Render DataTable to NPOI Excel 2003 MemoryStream
        /// NOTE:  Limitation of 65,536 rows suppored by XLS
        /// </summary>
        /// <param name="sourceTable">Source DataTable</param>
        /// <returns>MemoryStream containing NPOI Excel workbook</returns>
        public static Stream RenderDataTableToExcel(DataTable sourceTable)
        {
            HSSFWorkbook workbook = new HSSFWorkbook();

            MemoryStream memoryStream = new MemoryStream();

            // By default NPOI creates "Sheet0" which is inconsistent with Excel using "Sheet1"
            HSSFSheet sheet = (HSSFSheet)workbook.CreateSheet("Sheet1");
            HSSFRow headerRow = (HSSFRow)sheet.CreateRow(0);

            // Header Row
            foreach (DataColumn column in sourceTable.Columns)
                headerRow.CreateCell(column.Ordinal).SetCellValue(column.ColumnName);

            // Detail Rows
            int rowIndex = 1;

            foreach (DataRow row in sourceTable.Rows)
            {
                HSSFRow dataRow = (HSSFRow)sheet.CreateRow(rowIndex);

                foreach (DataColumn column in sourceTable.Columns)
                {
                    dataRow.CreateCell(column.Ordinal).SetCellValue(row[column].ToString());
                }

                rowIndex++;
            }

            workbook.Write(memoryStream);
            memoryStream.Flush();
            memoryStream.Position = 0;

            return memoryStream;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }
    }
}
using System.Collections.Generic;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using log4net;

namespace PDFUtility
{
    public class HTML2PDF
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        public static void Convert2PDF(string htmlText, string destination)
        {
            if (isDebugEnabled)
            {
                log.Debug(htmlText);
                log.Debug("");
            }

            using (Document document = new Document())
            {
                PdfWriter.GetInstance(document, new FileStream(destination, FileMode.Create));
                document.Open();
                //WebClient wc = new WebClient();
                //string htmlText = wc.DownloadString("http://localhost:59500/my.html");
                //Response.Write(htmlText);
                List<IElement> htmlarraylist = HTMLWorker.ParseToList(new StringReader(htmlText), null);
                for (int k = 0; k < htmlarraylist.Count; k++)
                {
                    document.Add((IElement)htmlarraylist[k]);
                }
                document.Close();
            }
        }
    }
}
/*
///    | Copyright 2012 |"
///
/// Author : Mr.Siriwat Suananpornpanit
/// Source Product : Support iTextSharp
/// Date : 2012-08-21
/// Version 1.0.0.0
///
*/

using System;
using System.IO;
using iTextSharp.text;

namespace SME.PlugIn.PDF
{
    public static class PageWatermark
    {
        #region " | Members | "

        #region " | Private Property | "

        private static String _text;

        private static String _encoding;

        private static String _headerText;

        private static String _footerText;

        #endregion " | Private Property | "

        #region " | Public Property | "

        public static String Text
        {
            get { return _text; }
            set { _text = value; }
        }

        public static String Encoding
        {
            get { return _encoding; }
            set { _encoding = value; }
        }

        public static String HeaderText
        {
            get { return _headerText; }
            set { _headerText = value; }
        }

        public static String FooterText
        {
            get { return _footerText; }
            set { _footerText = value; }
        }

        #endregion " | Public Property | "

        #endregion " | Members | "

        public static bool IsWatermark(string source,
            string destination, string[] watermarkText, string documentNumber = "xxxx-xxxx-xx/xxxxxx",
            float lineSpace = 20f, iTextSharp.text.pdf.BaseFont watermarkFont = null, float watermarkFontSize = 18f,
            iTextSharp.text.BaseColor watermarkFontColor = null, float watermarkFontOpacity = 0.15f, float watermarkRotation = 45f)
        {
            bool isSuccess = true;
            iTextSharp.text.pdf.PdfReader reader = null;
            Document doc = new Document(PageSize.A4);

            iTextSharp.text.pdf.PdfStamper stamper = null;
            iTextSharp.text.pdf.PdfGState gstate = null;
            iTextSharp.text.pdf.PdfContentByte underContent = null;
            iTextSharp.text.Rectangle rect = null;
            float oCurrentY = 0f;
            float offset = 0f;
            int pageCount = 0;
            try
            {
                reader = new iTextSharp.text.pdf.PdfReader(source);
                rect = reader.GetPageSizeWithRotation(1);
                stamper = new iTextSharp.text.pdf.PdfStamper(reader, new FileStream(destination, FileMode.Create));
                //Dim writer As PdfWriter = PdfWriter.GetInstance(doc, New FileStream(outputFile, FileMode.Create, FileAccess.Write))
                //underContent = writer.DirectContent
                if (watermarkFont == null)
                {
                    watermarkFont = iTextSharp.text.pdf.BaseFont.CreateFont(iTextSharp.text.pdf.BaseFont.HELVETICA, iTextSharp.text.pdf.BaseFont.CP1252, iTextSharp.text.pdf.BaseFont.NOT_EMBEDDED);
                }
                if (watermarkFontColor == null)
                {
                    watermarkFontColor = iTextSharp.text.BaseColor.BLUE;
                }

                iTextSharp.text.Font ofont = FontFactory.GetFont("Tahoma", 10, Font.NORMAL);
                ofont.Color = iTextSharp.text.BaseColor.GRAY;

                gstate = new iTextSharp.text.pdf.PdfGState();
                gstate.FillOpacity = watermarkFontOpacity;
                gstate.StrokeOpacity = watermarkFontOpacity;
                pageCount = reader.NumberOfPages;
                for (int i = 1; i <= pageCount; i++)
                {
                    underContent = stamper.GetOverContent(i);
                    {
                        underContent.SaveState();
                        underContent.SetGState(gstate);
                        underContent.SetColorFill(watermarkFontColor);
                        underContent.BeginText();
                        underContent.SetFontAndSize(watermarkFont, watermarkFontSize);
                        underContent.SetTextMatrix(30, 30);
                        //Int32 iHeight = 0;
                        if (watermarkText.Length > 1)
                        {
                            if ((rect != null))
                            {
                                oCurrentY = (rect.Height / 2) + (((watermarkFontSize + lineSpace) * watermarkText.Length) / 2);
                            }
                            else
                            {
                                oCurrentY = 0 + (((watermarkFontSize + lineSpace) * watermarkText.Length) / 2);
                            }
                        }
                        else
                        {
                            if ((rect != null))
                            {
                                oCurrentY = 0 + (((watermarkFontSize + lineSpace) * watermarkText.Length) / 2);
                            }
                            else
                            {
                                oCurrentY = 0;
                            }
                        }
                        for (int j = 0; j <= watermarkText.Length - 1; j++)
                        {
                            if (j > 0)
                            {
                                offset = (j * (watermarkFontSize + lineSpace)) + ((watermarkFontSize + lineSpace) / 4) * j;
                            }
                            else
                            {
                                offset = 0f;
                            }
                            if ((rect != null))
                            {
                                underContent.ShowTextAligned(iTextSharp.text.Element.ALIGN_CENTER, watermarkText[j], rect.Width / 2, oCurrentY - offset, watermarkRotation);
                            }
                            else
                            {
                                underContent.ShowTextAligned(iTextSharp.text.Element.ALIGN_CENTER, watermarkText[j], rect.Width / 2, oCurrentY - offset, watermarkRotation);
                                //.ShowTextAligned(iTextSharp.text.Element.ALIGN_CENTER, watermarkText(j), 60, currentY - offset, watermarkRotation)
                            }
                        }
                        if (!string.IsNullOrEmpty(documentNumber))
                        {
                            string ca = documentNumber;
                            underContent.SetColorFill(watermarkFontColor);
                            underContent.SetFontAndSize(watermarkFont, 9);
                            if ((rect != null))
                            {
                                underContent.ShowTextAligned(iTextSharp.text.Element.ALIGN_RIGHT, ca, rect.Right - 10, rect.Height - 20, 0);
                                underContent.ShowTextAligned(iTextSharp.text.Element.ALIGN_RIGHT, _footerText + " Copyright © Page [" + i + "/" + pageCount + "]", rect.Right - 10, 10, 0);
                                //.ShowTextAligned(iTextSharp.text.Element.ALIGN_RIGHT, ca, rect.Width - 20, rect.Height - 30, 0)
                            }
                        }
                        underContent.EndText();
                        underContent.RestoreState();
                    }
                }
            }
            catch (Exception ex)
            {
                isSuccess = false;
                throw ex;
            }
            finally
            {
                stamper.Close();
                reader.Close();
            }
            return isSuccess;
        }
    }
}
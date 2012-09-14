using System;
using System.IO;
using System.Text;
using iTextSharp.text;
using iTextSharp.text.pdf;
using log4net;

namespace PDFUtility
{
    public class SecurityPDF : IDisposable
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        private bool _disposed;
        private PdfReader _resource = null;

        #region "Properties"

        private string _watermarkText = "Show Text.";

        public SecurityPDF SetWatermarkText(string text)
        {
            this._watermarkText = text;
            return this;
        }

        public string GetWatermarkText()
        {
            return this._watermarkText;
        }

        //private BaseFont _watermarkBasefont = BaseFont.CreateFont(BaseFont.HELVETICA_BOLD, Encoding.ASCII.EncodingName, false);
        private BaseFont _watermarkBasefont = BaseFont.CreateFont("c:\\WINDOWS\\Fonts\\tahoma.ttf", BaseFont.IDENTITY_H, false);

        public SecurityPDF SetWaterMarkBaseFont(BaseFont basefont)
        {
            this._watermarkBasefont = basefont;
            return this;
        }

        public BaseFont GetWaterMarkBaseFont()
        {
            return this._watermarkBasefont;
        }

        private float _watermarkFontSize = 40f;

        public SecurityPDF SetWatermarkFontSize(float fontSize)
        {
            this._watermarkFontSize = fontSize;
            return this;
        }

        public float GetWatermarkFontSize()
        {
            return this._watermarkFontSize;
        }

        private BaseColor _watermarkFontColor = BaseColor.RED;

        public SecurityPDF SetWatermarkFontColor(BaseColor fontColor)
        {
            this._watermarkFontColor = fontColor;
            return this;
        }

        public BaseColor GetWatermarkFontColor()
        {
            return this._watermarkFontColor;
        }

        private float? _watermarkRotation = null;

        public SecurityPDF SetWatermarkRotation(float rotation)
        {
            this._watermarkRotation = rotation;
            return this;
        }

        public float? GetWatermarkRotation()
        {
            return this._watermarkRotation;
        }

        private string _source;

        public SecurityPDF SetSource(string source)
        {
            this._source = source;
            return this;
        }

        public string GetSource()
        {
            return this._source;
        }

        private string _destination;

        public SecurityPDF SetDestination(string destination)
        {
            this._destination = destination;
            return this;
        }

        public string GetDestination()
        {
            return this._destination;
        }

        private string _userPassword;

        public SecurityPDF SetUserPassword(string userPassword)
        {
            this._userPassword = userPassword;
            return this;
        }

        public string GetUserPassword()
        {
            return this._userPassword;
        }

        private string _ownerPassword;

        public SecurityPDF SetOwnerPassword(string ownerPassword)
        {
            this._ownerPassword = ownerPassword;
            return this;
        }

        public string GetOwnerPassword()
        {
            return this._ownerPassword;
        }

        private string _headerText;

        public SecurityPDF SetHeaderText(string headerText)
        {
            this._headerText = headerText;
            return this;
        }

        public string GetHeaderText()
        {
            return this._headerText;
        }

        private int _headerAlignment;

        public SecurityPDF SetHeaderAlignment(int headerAlignment)
        {
            this._headerAlignment = headerAlignment;
            return this;
        }

        public int GetHeaderAlignment()
        {
            return this._headerAlignment;
        }

        //private BaseFont _basefont = BaseFont.CreateFont(BaseFont.HELVETICA_BOLD, Encoding.UTF8.EncodingName, false);
        private BaseFont _basefont = BaseFont.CreateFont("c:\\WINDOWS\\Fonts\\tahoma.ttf", BaseFont.IDENTITY_H, false);

        public SecurityPDF SetBaseFont(BaseFont basefont)
        {
            this._basefont = basefont;
            return this;
        }

        public BaseFont GetBaseFont()
        {
            return this._basefont;
        }

        private float _fontSize = 10f;

        public SecurityPDF SetFontSize(float fontSize)
        {
            this._fontSize = fontSize;
            return this;
        }

        public float GetFontSize()
        {
            return this._fontSize;
        }

        private BaseColor _fontColor = BaseColor.BLUE;

        public SecurityPDF SetFontColor(BaseColor fontColor)
        {
            this._fontColor = fontColor;
            return this;
        }

        public BaseColor GetFontColor()
        {
            return this._fontColor;
        }

        #endregion "Properties"

        #region "Constructor"

        public SecurityPDF(PdfReader resource, string destination)
        {
            if (resource == null)
                throw new ArgumentNullException("resource in null.");

            this._resource = resource;
            this.SetDestination(destination);

            this._disposed = false;
        }

        public SecurityPDF(string source, string destination)
        {
            PdfReader resource = new PdfReader(source);
            if (resource == null)
                throw new ArgumentNullException("resource in null.");
            //if (!resource.CanRead)
            //    throw new ArgumentException("resource must be readable.");

            this._resource = resource;
            this.SetDestination(destination);

            this._disposed = false;
        }

        #endregion "Constructor"

        // Demonstrates using the resource.
        // It must not be already disposed.
        public void ApplySecurity()
        {
            if (_disposed)
                throw new ObjectDisposedException("Resource was disposed.");

            float pageWidth = 0f;
            float pageHiehgt = 0f;
            float textAngle = 0f;

            using (MemoryStream stream = new MemoryStream())
            {
                try
                {
                    using (PdfStamper stamper = new PdfStamper(this._resource, stream))
                    {
                        for (int i = 1; i <= _resource.NumberOfPages; i++) // Must start at 1 because 0 is not an actual page.
                        {
                            //
                            // If you ask for the page size with the method getPageSize(), you always get a
                            // Rectangle object without rotation (rot. 0 degrees)—in other words, the paper size
                            // without orientation. That’s fine if that’s what you’re expecting; but if you reuse
                            // the page, you need to know its orientation. You can ask for it separately with
                            // getPageRotation(), or you can use getPageSizeWithRotation(). - (Manning Java iText Book)
                            //
                            //
                            Rectangle pageSize = _resource.GetPageSizeWithRotation(i);

                            //
                            // Gets the content ABOVE the PDF, Another option is GetUnderContent(...)
                            // which will place the text below the PDF content.
                            //
                            PdfContentByte pdfPageContents = stamper.GetUnderContent(i);
                            pdfPageContents.SaveState();
                            pdfPageContents.BeginText(); // Start working with text.

                            //
                            // Create a font to work with
                            //
                            //BaseFont baseFont = BaseFont.CreateFont(BaseFont.HELVETICA_BOLD, Encoding.ASCII.EncodingName, false);
                            pdfPageContents.SetFontAndSize(this.GetWaterMarkBaseFont(), this.GetWatermarkFontSize()); // 40 point font
                            pdfPageContents.SetColorFill(this.GetWatermarkFontColor()); // Sets the color of the font, RED in this instance

                            //
                            // Angle of the text. This will give us the angle so we can angle the text diagonally
                            // from the bottom left corner to the top right corner through the use of simple trigonometry.
                            //
                            if (null == this.GetWatermarkRotation())
                            {
                                //init rotation
                                if (pageWidth == 0f && pageHiehgt == 0f)
                                {
                                    pageWidth = pageSize.Width;
                                    pageHiehgt = pageSize.Height;

                                    textAngle = (float)GetHypotenuseAngleInDegreesFrom(pageHiehgt, pageWidth);

                                    if (isDebugEnabled)
                                    {
                                        log.Debug("-------------------------------");
                                        log.Debug("pageWidth == 0f && pageHiehgt == 0f");
                                        log.Debug("pageSize.Width : " + pageSize.Width);
                                        log.Debug("pageSize.Height : " + pageSize.Height);

                                        log.Debug("textAngle : " + textAngle);
                                        log.Debug("-------------------------------");
                                        log.Debug("");
                                    }
                                }

                                if (pageWidth != pageSize.Width || pageHiehgt != pageSize.Height)
                                {
                                    pageWidth = pageSize.Width;
                                    pageHiehgt = pageSize.Height;

                                    textAngle = (float)GetHypotenuseAngleInDegreesFrom(pageHiehgt, pageWidth);
                                    if (isDebugEnabled)
                                    {
                                        log.Debug("-------------------------------");
                                        log.Debug("pageWidth != pageSize.Width || pageHiehgt != pageSize.Height");
                                        log.Debug("pageSize.Width : " + pageSize.Width);
                                        log.Debug("pageSize.Height : " + pageSize.Height);

                                        log.Debug("textAngle : " + textAngle);
                                        log.Debug("-------------------------------");
                                        log.Debug("");
                                    }
                                }
                            }
                            else
                            {
                                textAngle = this.GetWatermarkRotation().Value;
                            }

                            //
                            // Note: The x,y of the Pdf Matrix is from bottom left corner.
                            // This command tells iTextSharp to write the text at a certain location with a certain angle.
                            // Again, this will angle the text from bottom left corner to top right corner and it will
                            // place the text in the middle of the page.
                            //
                            pdfPageContents.ShowTextAlignedKerned(PdfContentByte.ALIGN_CENTER, this.GetWatermarkText(),
                                                            pageSize.Width / 2,
                                                            pageSize.Height / 2,
                                                            textAngle);

                            pdfPageContents.ShowTextAlignedKerned(PdfContentByte.ALIGN_CENTER, this.GetWatermarkText(),
                                                            pageSize.Width / 2,
                                                            pageSize.Height / 60,
                                                            textAngle);

                            pdfPageContents.ShowTextAlignedKerned(PdfContentByte.ALIGN_CENTER, this.GetWatermarkText(),
                                                            pageSize.Width / 2,
                                                            pageSize.Height * 59 / 60,
                                                            textAngle);

                            pdfPageContents.EndText(); // Done working with text
                            pdfPageContents.FillStroke();
                            pdfPageContents.RestoreState();
                        }
                        stamper.FormFlattening = true; // enable this if you want the PDF flattened.
                        stamper.Close();
                        stamper.Dispose();
                    }

                    byte[] userPassword = null;
                    byte[] ownerPassword = null;

                    if (null != this.GetUserPassword())
                    {
                        userPassword = Encoding.UTF8.GetBytes(this.GetUserPassword());
                    }

                    if (null != this.GetOwnerPassword())
                    {
                        ownerPassword = Encoding.UTF8.GetBytes(this.GetOwnerPassword());
                    }

                    using (FileStream fs = new FileStream(this.GetDestination()
                        , FileMode.Create
                        , FileAccess.ReadWrite))
                    {
                        PdfEncryptor.Encrypt(new PdfReader(stream.ToArray())
                            , fs
                            , userPassword
                            , ownerPassword
                            , 0
                            , true);
                        fs.Close();
                        fs.Dispose();
                    }
                }
                catch (Exception ex)
                {
                    log.Error(ex.StackTrace);
                    throw ex;
                }
                finally
                {
                    this.Dispose();
                }

                stream.Close();
                stream.Dispose();
            }
        }

        public void Dispose()
        {
            Dispose(true);

            // Use SupressFinalize in case a subclass
            // of this type implements a finalizer.
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            // If you need thread safety, use a lock around these
            // operations, as well as in your methods that use the resource.
            if (!_disposed)
            {
                if (disposing)
                {
                    if (_resource != null)
                        _resource.Close();
                    Console.WriteLine("Object disposed.");
                }

                // Indicate that the instance has been disposed.
                _resource = null;
                _disposed = true;
            }
        }

        private double GetHypotenuseAngleInDegreesFrom(double opposite, double adjacent)
        {
            double radians = Math.Atan2(opposite, adjacent); // Get Radians for Atan2
            double angle = radians * (180 / Math.PI); // Change back to degrees

            return angle;
        }
    }
}
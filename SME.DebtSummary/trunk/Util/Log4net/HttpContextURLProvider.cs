using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace Util.Log4net
{
    public class HttpContextURLProvider
    {
        public override string ToString()
        {
            HttpContext context = HttpContext.Current;
            if (context != null && context.Request != null && context.Request.Url != null)
            {
                return context.Request.Url.ToString();
            }
            return null;
        }
    }
}

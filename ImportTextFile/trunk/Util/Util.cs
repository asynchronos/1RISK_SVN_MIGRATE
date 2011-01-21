using System;
using System.Globalization;

namespace ImportTextFile.Utility
{
    public class Util
    {
        public static DateTime? Str2Date(string s, string format, IFormatProvider provider)
        {
            DateTime? result = null;

            try
            {
                result = DateTime.ParseExact(s, format, provider);
            }
            catch (Exception ex)
            {
                //return null
            }

            return result;
        }

        public static DateTime? Str2Date(string s, string format)
        {
            DateTime? result = null;

            result = Str2Date(s, format, new CultureInfo("en-US"));
            if (result != null && result.Value == DateTime.MinValue)
            {
                result = null;
            }

            if (result != null && result.Value.Year < 1753)
            {
                result = result.Value.AddYears(543);
            }

            //second time
            if (result != null && result.Value.Year < 1753)
            {
                result = null;
            }

            return result;
        }

        public static Decimal? Str2Decimal(string s, int decimalPositionCount)
        {
            Decimal? result = null;

            s = s.Insert(s.Length - decimalPositionCount, ".");

            try
            {
                result = Decimal.Parse(s);
            }
            catch (Exception ex)
            {
                //return null
            }

            return result;
        }
    }
}
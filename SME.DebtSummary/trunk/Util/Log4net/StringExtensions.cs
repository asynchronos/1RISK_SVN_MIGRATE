using System.Diagnostics;

namespace Util.Log4net
{
    /// <summary>
    /// Extension helper methods for strings
    /// </summary>
    [DebuggerStepThrough, DebuggerNonUserCode]
    public static class StringExtensions
    {
        /// <summary>
        /// Formats a string using the <paramref name="format"/> and <paramref name="args"/>.
        /// </summary>
        /// <param name="format">The format.</param>
        /// <param name="args">The args.</param>
        /// <returns>A string with the format placeholders replaced by the args.</returns>
        public static string Sub(this string format, params object[] args)
        {
            return string.Format(format, args);
        }
    }
}
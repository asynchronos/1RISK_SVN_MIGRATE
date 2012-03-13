namespace Util
{
    public sealed class CommonUtil
    {
        public static string ConcatName(string title, string firstname, string lastname)
        {
            string result = null;

            if (string.IsNullOrWhiteSpace(title))
            {
                result = firstname + " " + lastname;
            }
            else
            {
                result = title + " " + firstname + " " + lastname;
            }

            return result;
        }
    }
}
using System;
using log4net;

namespace Util
{
    /**
    * Collected methods which allow easy implementation of <code>hashCode</code>.
    *
    * Example use case:
    * <pre>
    *  public int hashCode(){
    *    int result = HashCodeUtil.SEED;
    *    //collect the contributions of various fields
    *    result = HashCodeUtil.hash(result, fPrimitive);
    *    result = HashCodeUtil.hash(result, fObject);
    *    result = HashCodeUtil.hash(result, fArray);
    *    return result;
    *  }
    * </pre>
    */

    public sealed class HashCodeUtil
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        /**
        * An initial value for a <code>hashCode</code>, to which is added contributions
        * from fields. Using a non-zero value decreases collisons of <code>hashCode</code>
        * values.
        */
        public static int SEED = 23;

        /**
        * booleans.
        */

        public static int hash(int aSeed, bool aBoolean)
        {
            return firstTerm(aSeed) + (aBoolean ? 1 : 0);
        }

        /**
  * chars.
  */

        public static int hash(int aSeed, char aChar)
        {
            return firstTerm(aSeed) + (int)aChar;
        }

        /**
        * ints.
        */

        public static int hash(int aSeed, int aInt)
        {
            /*
            * Implementation Note
            * Note that byte and short are handled by this method, through
            * implicit conversion.
            */
            return firstTerm(aSeed) + aInt;
        }

        /**
        * longs.
        */

        public static int hash(int aSeed, long aLong)
        {
            return firstTerm(aSeed) + (int)(aLong ^ (aLong >> 32));
        }

        /**
        * floats.
        */

        public static int hash(int aSeed, float aFloat)
        {
            return hash(aSeed, aFloat.GetHashCode());
        }

        /**
        * doubles.
        */

        public static int hash(int aSeed, double aDouble)
        {
            return hash(aSeed, aDouble.GetHashCode());
        }

        /**
        * <code>aObject</code> is a possibly-null object field, and possibly an array.
        *
        * If <code>aObject</code> is an array, then each element may be a primitive
        * or a possibly-null object.
        */

        public static int hash(int aSeed, Object aObject)
        {
            int result = aSeed;
            if (aObject == null)
            {
                result = hash(result, 0);
            }
            else if (!isArray(aObject))
            {
                result = hash(result, aObject.GetHashCode());
            }
            else
            {
                int length = ((Array)aObject).Length;
                for (int idx = 0; idx < length; ++idx)
                {
                    Object item = ((Array)aObject).GetValue(idx);
                    //recursive call!
                    result = hash(result, item);
                }
            }
            return result;
        }

        /// PRIVATE ///
        private static int fODD_PRIME_NUMBER = 37;

        private static int firstTerm(int aSeed)
        {
            return fODD_PRIME_NUMBER * aSeed;
        }

        private static bool isArray(Object aObject)
        {
            return aObject.GetType().IsArray;
        }
    }
}
using System;

namespace Util
{
    public sealed class EqualsUtil
    {
        static public bool areEqual(bool aThis, bool aThat)
        {
            //System.out.println("boolean");
            return aThis == aThat;
        }

        static public bool areEqual(char aThis, char aThat)
        {
            //System.out.println("char");
            return aThis == aThat;
        }

        static public bool areEqual(long aThis, long aThat)
        {
            /*
            * Implementation Note
            * Note that byte, short, and int are handled by this method, through
            * implicit conversion.
            */
            //System.out.println("long");
            return aThis == aThat;
        }

        static public bool areEqual(float aThis, float aThat)
        {
            //System.out.println("float");
            return aThis.GetHashCode() == aThat.GetHashCode();
        }

        static public bool areEqual(double aThis, double aThat)
        {
            //System.out.println("double");
            return aThis.GetHashCode() == aThat.GetHashCode();
        }

        /**
        * Possibly-null object field.
        *
        * Includes type-safe enumerations and collections, but does not include
        * arrays. See class comment.
        */

        static public bool areEqual(Object aThis, Object aThat)
        {
            //System.out.println("Object");
            return aThis == null ? aThat == null : aThis.Equals(aThat);
        }
    }
}
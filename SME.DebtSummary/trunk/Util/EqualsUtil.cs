using System;

namespace Util
{
	/*
		@Override public boolean equals(Object aThat) {
		//check for self-comparison
		if ( this == aThat ) return true;

		//use instanceof instead of getClass here for two reasons
		//1. if need be, it can match any supertype, and not just one class;
		//2. it renders an explict check for "that == null" redundant, since
		//it does the check for null already - "null instanceof [type]" always
		//returns false. (See Effective Java by Joshua Bloch.)
		if ( !(aThat instanceof Car) ) return false;
		//Alternative to the above line :
		//if ( aThat == null || aThat.getClass() != this.getClass() ) return false;

		//cast to native object is now safe
		Car that = (Car)aThat;

		//now a proper field-by-field evaluation can be made
		return
		  EqualsUtil.areEqual(this.fName, that.fName) &&
		  EqualsUtil.areEqual(this.fNumDoors, that.fNumDoors) &&
		  EqualsUtil.areEqual(this.fOptions, that.fOptions) &&
		  EqualsUtil.areEqual(this.fGasMileage, that.fGasMileage) &&
		  EqualsUtil.areEqual(this.fColor, that.fColor) &&
		  Arrays.equals(this.fMaintenanceChecks, that.fMaintenanceChecks);
	  }
	*/
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
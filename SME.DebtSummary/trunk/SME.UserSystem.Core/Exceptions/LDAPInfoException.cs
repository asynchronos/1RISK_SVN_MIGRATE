using System;
using System.Runtime.Serialization;

namespace SME.UserSystem.Core.Exceptions
{
    [Serializable]
    public class LDAPInfoException : System.Exception
    {
        public LDAPInfoException()
        {
        }

        public LDAPInfoException(string message)
            : base(message)
        {
        }

        public LDAPInfoException(string message, System.Exception innerException)
            : base(message, innerException)
        {
        }

        protected LDAPInfoException(SerializationInfo info, StreamingContext context)
            : base(info, context)
        {
        }

        public override void GetObjectData(SerializationInfo info,
           StreamingContext context)
        {
            base.GetObjectData(info, context);
        }
    }
}
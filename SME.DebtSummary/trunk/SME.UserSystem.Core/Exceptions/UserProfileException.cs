using System;
using System.Runtime.Serialization;

namespace SME.UserSystem.Core.Exceptions
{
    [Serializable]
    public class UserProfileException : System.Exception
    {
        public UserProfileException()
        {
        }

        public UserProfileException(string message)
            : base(message)
        {
        }

        public UserProfileException(string message, System.Exception innerException)
            : base(message, innerException)
        {
        }

        protected UserProfileException(SerializationInfo info, StreamingContext context)
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
using System;
using System.Runtime.Serialization;

namespace SME.UserSystem.Core.Exceptions
{
    [Serializable]
    public class UserInfoException : System.Exception
    {
        public UserInfoException()
        {
        }

        public UserInfoException(string message)
            : base(message)
        {
        }

        public UserInfoException(string message, System.Exception innerException)
            : base(message, innerException)
        {
        }

        protected UserInfoException(SerializationInfo info, StreamingContext context)
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
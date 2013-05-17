using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Runtime.InteropServices;


namespace SME.UserSystem.Core.Exceptions
{
    public class UserSystemException :  Exception,ISerializable
    {
        public UserSystemException()
        {
        }

        public UserSystemException(string message)
            : base(message)
        {
        }

        public UserSystemException(string message, System.Exception innerException)
            : base(message, innerException)
        {
        }

        protected UserSystemException(SerializationInfo info, StreamingContext context)
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

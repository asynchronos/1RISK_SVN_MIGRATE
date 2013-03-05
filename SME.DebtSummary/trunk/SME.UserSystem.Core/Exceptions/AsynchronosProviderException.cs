using System;
using System.Configuration.Provider;
using System.Runtime.Serialization;

namespace SME.UserSystem.Core.Exceptions
{
    [Serializable]
    public class AsynchronosProviderException : ProviderException
    {
        public AsynchronosProviderException()
        {
        }

        public AsynchronosProviderException(string message)
            : base(message)
        {
        }

        public AsynchronosProviderException(string message, System.Exception innerException)
            : base(message, innerException)
        {
        }

        protected AsynchronosProviderException(SerializationInfo info, StreamingContext context)
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
using System.Reflection;
using System.Runtime.InteropServices;

// General Information about an assembly is controlled through the following
// set of attributes. Change these attribute values to modify the information
// associated with an assembly.
[assembly: AssemblyTitle("SME.UserSystem.Core")]
[assembly: AssemblyDescription("")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("Bank of Ayudhya pcl.")]
[assembly: AssemblyProduct("SME.UserSystem.Core")]
[assembly: AssemblyCopyright("Copyright © Bank of Ayudhya pcl. 2012")]
[assembly: AssemblyTrademark("")]
[assembly: AssemblyCulture("")]

// Setting ComVisible to false makes the types in this assembly not visible
// to COM components.  If you need to access a type in this assembly from
// COM, set the ComVisible attribute to true on that type.
[assembly: ComVisible(false)]

// The following GUID is for the ID of the typelib if this project is exposed to COM
[assembly: Guid("9a101c75-bc42-4d93-96a1-08cf93131c06")]

// Version information for an assembly consists of the following four values:
//
//      Major Version
//      Minor Version
//      Build Number
//      Revision
//
// You can specify all the values or you can default the Build and Revision Numbers
// by using the '*' as shown below:
// [assembly: AssemblyVersion("1.0.*")]
[assembly: AssemblyVersion("2.0.*")]
[assembly: AssemblyFileVersion("2.0.0.0")]

[assembly: log4net.Config.Repository("SME.UserSystem.Core")]
[assembly: log4net.Config.XmlConfigurator(ConfigFile = "Log4net.SMEUserSystemCore.config", Watch = true)]
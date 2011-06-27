using NUnit.Framework;

namespace ConvertDBF.Test
{
    [TestFixture]
    public class DBFConnectionTest
    {
        DBFConnection conn;
        string filePath;
        string connStr;

        [SetUp]
        public void Init()
        {
            filePath = "D:\\workspaces\\SmeRiskSln\\ImportTextFile\\test data\\repc5310.DBF";

            string oledbConnStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=c:\folder;Extended Properties=dBASE IV;User ID=Admin;Password=;";

            string odbcConnStr = "Driver={Microsoft dBASE Driver (*.dbf)};DriverID=277;Dbq=c:\\mydbpath;";

            connStr = oledbConnStr;

            conn = new DBFConnection(DBFConnection.ConnectType.OleDB, connStr);
        }

        [Test]
        public void Connect()
        {
            bool isConnected = conn.connect();
            Assert.IsTrue(isConnected);
        }
    }
}
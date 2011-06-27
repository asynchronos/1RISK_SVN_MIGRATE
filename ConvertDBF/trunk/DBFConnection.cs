using System;
using System.Data.Odbc;
using System.Data.OleDb;

namespace ConvertDBF
{
    public enum ConnectType
    {
        OleDB,
        Odbc
    }

    public class DBFConnection : IDisposable
    {
        private static readonly DBFConnection _instance = new DBFConnection();

        private DBFConnection()
        {
            OLEDBMethod()
        }

        public void OLEDBMethod(string connectionString)
        {
            using (OleDbConnection myConnection = new OleDbConnection())
            {
                myConnection.ConnectionString = connectionString;
                myConnection.Open();
                //execute queries, etc
                myConnection.Close();
            }
        }

        public void ODBCMethod(string connectionString)
        {
            using (OdbcConnection myConnection = new OdbcConnection())
            {
                myConnection.ConnectionString = connectionString;
                myConnection.Open();
                //execute queries, etc
                myConnection.Close();
            }
        }

        public static DBFConnection getInstance()
        {
            return _instance;
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }
    }
}
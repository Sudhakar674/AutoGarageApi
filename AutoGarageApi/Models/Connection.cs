using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace AutoGarageApi.Models
{
    public class Connection
    {
        public static string connectionString = string.Empty;
        static Connection()
        {
            try
            {
                connectionString = "Data Source=DESKTOP-8Q7N8BG\\SQLEXPRESS; Initial Catalog=AutoGarageApiNew25092024; Integrated Security=True; Encrypt=False";
            }
            catch (Exception)
            {
                throw;
            }
        }
        public static DataSet ExecuteQuery(string commandText, params SqlParameter[] parameters)
        {
            DataSet ds = new DataSet();
            try
            {
                using (var connection = new SqlConnection(connectionString))
                using (var command = new SqlCommand(commandText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddRange(parameters);
                    SqlDataAdapter da = new SqlDataAdapter(command);
                    da.Fill(ds);
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("Msg");
                dt.Columns.Add("ErrorMessage");

                DataRow dr = dt.NewRow();
                dr["Msg"] = "0";
                dr["ErrorMessage"] = ex.Message;
                dt.Rows.Add(dr);
                ds.Tables.Add(dt);
            }
            return ds;
        }
    }
}
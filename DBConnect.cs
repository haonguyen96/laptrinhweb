using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Cheshire
{
    public class DBConnect
    {
        String cnnStr;
        public SqlConnection cnn;

        public DBConnect()
        {
            cnnStr = ConfigurationManager.ConnectionStrings["cheshire"].ConnectionString;
            cnn = new SqlConnection(cnnStr);
        }

        public int excuteNonQuery(String query) {
            SqlCommand cmd = new SqlCommand(query, cnn);
            cmd.CommandType = CommandType.Text;
            cnn.Open();
            int i = cmd.ExecuteNonQuery();
            cnn.Close();
            return i;
        }

        public DataTable excuteQuery(String query)
        {
            //SqlCommand cmd = new SqlCommand(query, cnn);
            //cmd.CommandType = CommandType.Text;

            SqlDataAdapter da = new SqlDataAdapter(query, cnn);
            da.SelectCommand.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public DataTable dangnhap(String tk, String mk) {
            SqlCommand cmd = new SqlCommand("dangnhap", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tk", tk);
            cmd.Parameters.AddWithValue("@mk", mk);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        public void dangky(String tk, String mk, String name)
        {
            SqlCommand cmd = new SqlCommand("dangky", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tk", tk);
            cmd.Parameters.AddWithValue("@mk", mk);
            cmd.Parameters.AddWithValue("@name", name);
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
        }

        public DataTable loadDM(int ma)
        {
            SqlCommand cmd = new SqlCommand("sp_dm_sach", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@madm", ma);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            da.Fill(dt);
            return dt;
        }



        public int updateTG(String query, Object[] tg)
        {
            SqlCommand cmd = new SqlCommand(query, cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            
            cmd.Parameters.AddWithValue("@id", int.Parse( tg[0].ToString() ));
            cmd.Parameters.AddWithValue("@ten", tg[1].ToString() );
            cmd.Parameters.AddWithValue("@img", tg[2].ToString() );
            cmd.Parameters.AddWithValue("@tgVN", int.Parse( tg[3].ToString() ));
            cmd.Parameters.AddWithValue("@tgDG", tg[4].ToString() );
            cmd.Parameters.AddWithValue("@mota", tg[5].ToString() );
            cmd.Parameters.AddWithValue("@tt", int.Parse( tg[6].ToString() ));

            cnn.Open();
            int i = cmd.ExecuteNonQuery();
            cnn.Close();
            return i;
        }
    }
}
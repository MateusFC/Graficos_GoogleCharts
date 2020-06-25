using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GraficosGoogleCharts
{
    public partial class Grafico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected string obterDados()
        {
            SqlConnection conexaoSQL = new SqlConnection("Data Source=LAPTOP-F262UKQR\\SQLEXPRESS;Initial Catalog=Estatistica;Integrated Security=True");

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "ESTATISTICA";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = conexaoSQL;
            conexaoSQL.Open();

            DataTable Dados = new DataTable();
            Dados.Load(cmd.ExecuteReader());
            conexaoSQL.Close();

            string strDados;
            strDados = "[['Task','Hours per Day'],";
            foreach (DataRow dr in Dados.Rows)
            {
                strDados = strDados + "[";
                strDados = strDados + "'" + dr[0] + "'" + "," + dr[1];
                strDados = strDados + "],";
            }
            strDados = strDados + "]";
            return strDados;
        }
        protected string obterDadosTopMais()
        {
            SqlConnection conexaoSQL = new SqlConnection("Data Source=LAPTOP-F262UKQR\\SQLEXPRESS;Initial Catalog=Estatistica;Integrated Security=True");

            SqlCommand cmdM = new SqlCommand();
            cmdM.CommandText = "select Liguagem,Popularidade from Linguagens where Popularidade > 40";
            cmdM.CommandType = CommandType.Text;
            cmdM.Connection = conexaoSQL;
            conexaoSQL.Open();

            DataTable Dados = new DataTable();
            Dados.Load(cmdM.ExecuteReader());
            conexaoSQL.Close();

            string strDados;
            strDados = "[['Task','Hours per Day'],";
            foreach (DataRow dr in Dados.Rows)
            {
                strDados = strDados + "[";
                strDados = strDados + "'" + dr[0] + "'" + "," + dr[1];
                strDados = strDados + "],";
            }
            strDados = strDados + "]";
            return strDados;
        }
        protected string obterDadosTopMenos()
        {
            SqlConnection conexaoSQL = new SqlConnection("Data Source=LAPTOP-F262UKQR\\SQLEXPRESS;Initial Catalog=Estatistica;Integrated Security=True");

            SqlCommand cmdMe = new SqlCommand();
            cmdMe.CommandText = "select Liguagem,Popularidade from Linguagens where Popularidade< 40";
            cmdMe.CommandType = CommandType.Text;
            cmdMe.Connection = conexaoSQL;
            conexaoSQL.Open();

            DataTable Dados = new DataTable();
            Dados.Load(cmdMe.ExecuteReader());
            conexaoSQL.Close();

            string strDados;
            strDados = "[['Task','Hours per Day'],";
            foreach (DataRow dr in Dados.Rows)
            {
                strDados = strDados + "[";
                strDados = strDados + "'" + dr[0] + "'" + "," + dr[1];
                strDados = strDados + "],";
            }
            strDados = strDados + "]";
            return strDados;
        }
    }
}
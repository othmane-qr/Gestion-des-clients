using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Gestion_des_clients
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        //******** connexion DATA BASE && create data set & data adapter *************//
        SqlConnection cnx = new SqlConnection(@"Data Source=DESKTOP-3K62L35\SQLEXPRESS; initial catalog=AdoNet; integrated security=true;");
        DataSet DS = new DataSet();
        SqlDataAdapter DA;
        
        private void Form1_Load(object sender, EventArgs e)
        {

            //******** affichage les donnes dans grid view *************//
            DA = new SqlDataAdapter("select * from  clients",cnx);
            DA.Fill(DS, "client");
            dataGridView1.DataSource = DS.Tables["client"];
            DataView dv =  new DataView();
        }

        private void button1_Click(object sender, EventArgs e)
        {
          //******** ajouter *************//
            DataRow Ligne = DS.Tables["client"].NewRow();
            Ligne[0] = int.Parse(id.Text);
            Ligne[1] = Nom.Text;
            Ligne[2] = Prenom.Text;
            Ligne[3] = Adresse.Text;
            Ligne[4] = Ville.Text;
            DS.Tables["client"].Rows.Add(Ligne);
            MessageBox.Show(" les informations ont été ajoutées");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //******** supprimer *************//
            int p = -1;
            for (int i = 0; i < DS.Tables["client"].Rows.Count; i++)
            {
                if (id.Text == DS.Tables["client"].Rows[i][0].ToString())
                {
                    p = i;
                }
            }
            if (p == -1) { MessageBox.Show("Client introuvale"); }
            else
               
            {
              
                DS.Tables["client"].Rows[p].Delete();
                MessageBox.Show("client supprimer");
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            //********  modification*************//
            int p = -1;
            for (int i = 0; i < DS.Tables["client"].Rows.Count; i++)
            {
                if (id.Text == DS.Tables["client"].Rows[i][0].ToString())
                {
                    p = i;
                }
            }
            if (p == -1) { MessageBox.Show("Client introuvale"); }
            else
            {
                DS.Tables["client"].Rows[p][0] = int.Parse(id.Text);
                DS.Tables["client"].Rows[p][1] = Nom.Text;
                DS.Tables["client"].Rows[p][2] = Prenom.Text;
                DS.Tables["client"].Rows[p][3] = Adresse.Text;
                DS.Tables["client"].Rows[p][4] = Ville.Text;
                MessageBox.Show("les modifications ont été faites");
               
            }

        }

        private void button4_Click(object sender, EventArgs e)
        {
            //******** Enregistré *************//

            SqlCommandBuilder cb = new SqlCommandBuilder(DA);
            DA.Update(DS, "client");
            MessageBox.Show("Les données ont été bien Enregistrées");
        }
        public void VIDER(Control f)
            ///  nouvou *************
        {
            foreach (Control ct in f.Controls)
            {
                if (ct.GetType() == typeof(TextBox))
                {
                    ct.Text = "";
                }
                else  if (ct.GetType() == typeof(ComboBox))
                {
                    ct.Text = "";
                }

                    if (ct.Controls.Count != 0) 
                {
                    VIDER(ct);
                }

            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
           
                VIDER(this);
        }

        private void button6_Click(object sender, EventArgs e)
        {
            // ************** filter *************
            int p = -1;
            for (int i = 0; i < DS.Tables["client"].Rows.Count; i++)
            {
                if (textBox1.Text == DS.Tables["client"].Rows[i][4].ToString())
                {
                    p = i;
                }
            }
            if (p == -1)
            {
                MessageBox.Show("client not found");
            }
            else
            {

                if (DS.Tables["client"] != null)
                {
                    DS.Tables["client"].Clear();
                }
                DA = new SqlDataAdapter("Select  * from clients where Ville = '" + textBox1.Text + "'", cnx);
                DA.Fill(DS, "client");
                dataGridView1.DataSource = DS.Tables["client"];
        

            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            /// afficher **********

            if (DS.Tables["client"] != null)
            {
                DS.Tables["client"].Clear();
            }
            DA = new SqlDataAdapter("select * from  clients", cnx);
            DA.Fill(DS, "client");
            dataGridView1.DataSource = DS.Tables["client"];
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
           
        }
    }
}

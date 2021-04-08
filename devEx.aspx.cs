using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace serkanISG
{
    public partial class devEx : System.Web.UI.Page
    {
        serkanISGEntities1 db = new serkanISGEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource= db.ISTANIM.ToList();

            if (!IsPostBack)
            {
                //DataTable table = new DataTable();
                //table.Columns.Add(new DataColumn("id", typeof(int)));
                //table.Columns.Add(new DataColumn("name", typeof(string)));

                //table.Rows.Add(1, "jack");
                //table.Rows.Add(2, "mary");
                //table.Rows.Add(3, "david");
                //GridView1.DataSource = table;
                GridView1.DataBind();
            }

        }

        protected void link_Click(object sender, EventArgs e)
        {
            LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
            GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
            TextBox1.Text = row.Cells[1].Text;  // get the first cell value of the row
                                                // if you want to get controls in templatefield , just use row.FindControl
            Label3.Text = linkbutton.CommandArgument;
            ScriptManager.RegisterStartupScript(this, GetType(), "serkan", "$('#myModal').modal()", true);//show the modal
        }

        protected void Savee_Click(object sender, EventArgs e)
        {
            //GridViewRow row = GridView1.SelectedRow;
            // row.Cells[0].Text = TextBox1.Text;  // get the first cell value of the row

            GridView1.SelectedRow.Cells[1].Text = TextBox1.Text;


        }

        protected void lnk_delete_Click(object sender, EventArgs e)
        {



        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using prjTCC.Lógica;

namespace prjTCC
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] != null)
            {
                Response.Redirect("~/index.aspx");
            }
            loading_spinner.Visible = false;
        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            if(txtEmailLogin.Text == "")
            {
                litAviso.Text = "Login não foi preenchido";
                return;
            }
            else if (txtSenhaLogin.Text == "")
            {
                litAviso.Text = "Senha não foi preenchida";
                return;
            }

            FazerLogin login = new FazerLogin();
            string[] loginInfo = login.Logar(txtEmailLogin.Text, txtSenhaLogin.Text);

            if (loginInfo[0] == "Usuário não encontrado")
            {
                litAviso.Text = "Login e/ou senha inválido(s)";
                return;
            }
            else
            {
                Session["login"] = loginInfo[0];
                Session["nome"] = loginInfo[1];
                Session["tipo"] = loginInfo[2];

                if (Request.Cookies["ultimaUrl"] != null)
                {
                    string ultimaUrl = Request.Cookies["ultimaUrl"].Value;
                    Response.Redirect(ultimaUrl);
                }
                else
                {
                    Response.Redirect("~/index.aspx");
                }
            }
        }
    }
}
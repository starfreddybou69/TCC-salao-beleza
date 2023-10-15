using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using prjTCC.Lógica;
using MySql.Data.MySqlClient;

namespace prjTCC
{
    public partial class servicos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string categoria = Request.QueryString.Get("categoria");

            if (String.IsNullOrEmpty(categoria))
            {
                categoria = "0";
            }

            ListaCategoria criarCategorias = new ListaCategoria();
            rpFiltrosLista.DataSource = criarCategorias.ListarCategorias(true);
            rpFiltrosLista.DataBind();
          
            ListaServicoPorCategoria criarServicos = new ListaServicoPorCategoria();
            rpListaServicos.DataSource = criarServicos.ListarServicosPorCategoria(categoria);
            rpListaServicos.DataBind();

            loading_spinner.Visible = false;
        }
    }
}   
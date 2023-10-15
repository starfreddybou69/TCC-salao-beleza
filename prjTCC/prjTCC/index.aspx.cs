using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using prjTCC.Lógica;
using prjTCC.Classe;
using System.Web.UI.HtmlControls;

namespace prjTCC
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ListaCategoria criarCategorias = new ListaCategoria();
            rpTipoServicosContainers.DataSource = criarCategorias.ListarCategorias(false);
            rpTipoServicosContainers.DataBind();
         
            ListaDepoimentoPopular criarDepoimentos = new ListaDepoimentoPopular();
            List<Depoimento> depoimentos = criarDepoimentos.ListarPrincipaisDepoimentos();
            if (depoimentos.Count > 0)
            {
                string depoimentosHtml = @"
                    <section class='section-depoimentos'>
                        <div class='section-content-largura'>
                            <h1 class='centralizado'>Depoimentos</h1>
                            <p>Veja o que nossos clientes dizem</p>
                            <div class='depoimentos'>";

                foreach (Depoimento depoimento in depoimentos)
                {
                    depoimentosHtml += $@"
                        <div class='depoimento-container'>
                            <div>
                                <i class='fa-solid fa-quote-left aspas'></i>
                                <h3>{depoimento.NomeCliente}</h3>
                                <div class='estrelas-avaliativas'>";
                    for (int x = 0; x < depoimento.Avaliacao; x++)
                    {
                        depoimentosHtml += "<i class='fa-solid fa-star'></i>";
                    }

                    depoimentosHtml += $@" 
                            </div>
                        </div>
                        <div>
                            <p>{ depoimento.Descricao}</p>
                        </div>
                    </div>";
                }
                depoimentosHtml += "</div> </div> </section>";
                litDepoimentos.Text += depoimentosHtml;

                loading_spinner.Visible = false;
            }
        }
    }
}

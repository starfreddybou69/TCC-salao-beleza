using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using prjTCC.Lógica;
using prjTCC.Classe;

namespace prjTCC
{
    public partial class agendamento_servico : System.Web.UI.Page
    {
        string codigoServico;
        protected void Page_Load(object sender, EventArgs e)
        {
            codigoServico = Request.QueryString.Get("servico");

            string hoje = DateTime.Now.ToString("yyyy-MM-dd");
            string limite = DateTime.Now.AddMonths(2).ToString("yyyy-MM-dd");


            DadosMinimosServicoEspecifico dadosServico = new DadosMinimosServicoEspecifico();
            Servico servico = dadosServico.DadosMinimosServico(codigoServico);

            imgServico.ImageUrl = $"~/imagens/{servico.Imagem[0].Pasta}/{servico.Imagem[0].Nome}";
            litNomeServico.Text = servico.Nome;
            litDuracaoServico.Text = servico.Duracao;
            litPrecoServico.Text = servico.Valor.ToString();

            //txtDateAgendamento.Attributes.Add("min", hoje);

            //txtDateAgendamento.Attributes.Add("max", limite);

            if (!IsPostBack)
            txtDateAgendamento.Text = DateTime.Now.ToString("yyyy-MM-dd");//DateTime.Today.ToString("dd/MM/yyyy");
            foreach (Funcionario funcionario in servico.Funcionario)
            {
                ddlFuncionarios.Items.Add(funcionario.Nome);
            }
            
        }
    }
}
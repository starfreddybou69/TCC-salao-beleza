using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace prjTCC.Classe
{
    public class Depoimento
    {
        #region Dados de Depoimento
        public int CodigoServico { get; set; }
        public string EmailCliente { get; set; }
        public int Avaliacao { get; set; }
        public string Descricao { get; set; }
        public string DataAvaliacao { get; set; }
        #endregion

        #region Dado pegado por join com Cliente
        public string NomeCliente { get; set; }
        #endregion

        #region  Dado pegado por join com Funcionario (Nome) 
        public Funcionario Funcionario { get; set; }
        #endregion

        #region Construtores
        public Depoimento(){}
        public Depoimento(string cPFFuncionario, int codigoServico, int codigoTipoFuncionario, string emailCliente, int avaliacao, string descricao, string dataAvaliacao, string nomeCliente, Funcionario funcionario)
        {
            this.CodigoServico = codigoServico;
            this.EmailCliente = emailCliente;
            this.Avaliacao = avaliacao;
            this.Descricao = descricao;
            this.DataAvaliacao = dataAvaliacao;
            this.NomeCliente = nomeCliente;
            this.Funcionario = funcionario;
        }
        #endregion
    }
}
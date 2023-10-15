using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace prjTCC.Classe
{
    public class Funcionario
    {
        #region Dados de Funcionário
        public string CPF { get; set; }
        public int Codigo { get; set; }
        public int CodigoTipoFuncionario { get; set; }
        public string Nome { get; set; }
        public string Email { get; set; }
        public string Senha { get; set; }
        public Imagem Imagem { get; set; }
        #endregion

        public Funcionario(){}
        public Funcionario(string cPF, int codigoTipoFuncionario, string nome, string email, string senha, Imagem imagem)
        {
            this.CPF = cPF;
            this.CodigoTipoFuncionario = codigoTipoFuncionario;
            this.Nome = nome;
            this.Email = email;
            this.Senha = senha;
            this.Imagem = imagem;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace prjTCC.Classe
{
    public class Agendamento
    {
        public string Codigo { get; set; }
        public string Data { get; set; }
        public bool PresencaFuncionario { get; set; }
        public bool PresencaCliente { get; set; }
        #region Dado do cliente (Email)
        public Cliente Cliente { get; set; }
        #endregion
        #region Dado de funcionário (Código)
        public Funcionario Funcionario { get; set; }
        #endregion
        #region Dado de serviço (Código)
        public Servico Servico { get; set; }
        #endregion
        #region Dado de FuncionárioServiçoDiaDeTrablho (Código e Hora)
        public FuncionarioServicoDiaDeTrabalho FuncionarioServicoDiaDeTrabalho { get; set; }
        #endregion

        public Agendamento() { }
        public Agendamento(string codigo, string data, bool presencaFuncionario, bool presencaCliente, Cliente cliente, Funcionario funcionario, Servico servico, FuncionarioServicoDiaDeTrabalho funcionarioServicoDiaDeTrabalho)
        {
            this.Codigo = codigo;
            this.Data = data;
            this.PresencaFuncionario = presencaFuncionario;
            this.PresencaCliente = presencaCliente;
            this.Cliente = cliente;
            this.Funcionario = funcionario;
            this.Servico = servico;
            this.FuncionarioServicoDiaDeTrabalho = funcionarioServicoDiaDeTrabalho;
        }
    }
}
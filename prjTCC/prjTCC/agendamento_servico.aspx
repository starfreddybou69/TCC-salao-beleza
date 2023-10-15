<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="agendamento_servico.aspx.cs" Inherits="prjTCC.agendamento_servico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    <title>Stefany Amorim - Cílios e Sobrancelhas</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
    <script src="https://kit.fontawesome.com/f9a95042e5.js" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <div class="logo-container">
                    <asp:HyperLink NavigateUrl="~/index.aspx" runat="server">
                        <img src="imagens/logotipo.png" alt="logo do site">
                    </asp:HyperLink>
                </div>

                <nav>
                    <ul>
                        <li>
                            <asp:HyperLink NavigateUrl="~/servicos.aspx" runat="server">Serviços</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink NavigateUrl="~/recompensas.aspx" runat="server">Recompensas</asp:HyperLink></li>
                    </ul>
                </nav>

                <div class="menu-sanduiche">
                    <i class="fa-solid fa-bars"></i>
                </div>

                <div class="usuario-container">
                    <asp:HyperLink NavigateUrl="~/login.aspx" runat="server">
                        <i class="fa-solid fa-circle-user"></i>
                    </asp:HyperLink>
                </div>

                <div class="dropdown">
                    <li>
                        <asp:HyperLink NavigateUrl="~/servicos.aspx" runat="server">Serviços</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink NavigateUrl="~/recompensas.aspx" runat="server">Recompensas</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink NavigateUrl="~/login.aspx" runat="server">
                        <asp:Button runat="server" Text="Fazer login" CssClass="botoes" /></asp:HyperLink></li>
                </div>
            </header>

            <section class="container">
                <div class="section-content-largura">
                    <div class="section-agendamento">
                        <h1>Agendamento de serviço</h1>
                        <h2>Serviço</h2>

                        <hr>

                        <div class="agendamento-servico">
                            <div class="agendamento-servico-container">
                                <div class="agendamento-imagem">
                                    <asp:Image ID="imgServico" runat="server" />
                                </div>

                                <div cldass="agendamento-info">
                                    <h2>
                                        <asp:Literal ID="litNomeServico" runat="server"></asp:Literal>
                                    </h2>
                                    <h3>R$
                                        <asp:Literal ID="litPrecoServico" runat="server"></asp:Literal></h3>
                                </div>
                            </div>

                            <div class="agendamento-duracao">
                                <p>
                                    <i class="fa-regular fa-clock"></i>em média 
                                    <asp:Literal ID="litDuracaoServico" runat="server"></asp:Literal>
                                    min
                                </p>

                                <div onclick="animar('.agendamento-filtro-container', '0')" class="botoes" style="text-align: center">Prosseguir</div>
                                <!--<button onclick="animar('.agendamento-filtro-container', '0')">Prosseguir</button>-->
                            </div>
                        </div>

                        <h2>Data e Horário</h2>
                        <hr>

                        <div class="agendamento-filtro-container suaveAnimar animar">
                            <div>
                                <label for="txtDateAgendamento" />
                                Insira a data que você deseja:
                                    <asp:TextBox ID="txtDateAgendamento" AutoPostBack="true" runat="server" type="date" min="2023-05-01" max="2023-12-31" />
                                          
                    
                            </div>

                            <div>
                                <label for="ddlFuncionarios" />
                                Selecione o funcionário que você deseja (opcional):
                                        <asp:DropDownList ID="ddlFuncionarios" runat="server"></asp:DropDownList>
                            </div>

                            <div>
                                <button>Filtrar</button>
                            </div>
                        </div>

                        <h2>Funcionários</h2>
                        <hr>

                        <div class="agendamentos-funcionario suaveAnimar animar">
                            <div class="agendamneto-funcionario-horario-container">

                                <asp:Repeater ID="rpFuncionarioServico" runat="server">
                                    <ItemTemplate>
                                        <div class="agendamento-funcionario-imagem">
                                            <asp:Image runat="server" alt="foto do(a) funcionário(a)" />
                                        </div>
                                        <div class="agendamento-nome-funcionario">
                                            <h3></h3>
                                        </div>

                                        <div class="agendamento-horarios-funcionario">
                                            <button>08:00</button>
                                            <button>10:00</button>
                                            <button>12:00</button>
                                            <button>14:00</button>
                                            <button>18:00</button>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
            </section>
            <asp:HiddenField ID="hfPasso" runat="server" />
        </div>
    </form>
    <script src="<%=ResolveUrl("~/js/menu_sanduiche.js") %>" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~/js/animarAgendamentoServico.js") %>" type="text/javascript"></script>
</body>
</html>

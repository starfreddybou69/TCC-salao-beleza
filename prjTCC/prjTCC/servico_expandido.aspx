<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="servico_expandido.aspx.cs" Inherits="prjTCC.servico_expandido" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    <title>Stefany Amorim - Cílios e Sobrancelhas</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
    <script src="https://kit.fontawesome.com/f9a95042e5.js" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
                        <li><asp:HyperLink NavigateUrl="~/servicos.aspx" runat="server">Serviços</asp:HyperLink></li>
                        <li><asp:HyperLink NavigateUrl="~/recompensas.aspx" runat="server">Recompensas</asp:HyperLink></li>
                    </ul>
                </nav>

                <div class="menu-sanduiche">
                    <i class="fa-solid fa-bars"></i>
                </div>

                <div class="usuario-container">
                   <a href='login_cookie.html?url=<%= Request.Url.PathAndQuery %>'>
                        <i class="fa-solid fa-circle-user"></i>
                   </a>
                </div>

                <div class="dropdown">
                    <ul>
                    <li><asp:HyperLink NavigateUrl="~/servicos.aspx" runat="server">Serviços</asp:HyperLink></li>
                    <li><asp:HyperLink NavigateUrl="~/recompensas.aspx" runat="server">Recompensas</asp:HyperLink></li>
                    <li>
                        <a href='login_cookie.html?url=<%= Request.Url.PathAndQuery %>'>
                            <div class="botoes">Fazer login</div>
                        </a>
                    </li>
                   </ul>
                </div>
            </header>

            <section class="container">
                <div class="section-content-largura">

                    <div class="servico-expandido-container">
                        <div class="servico-expandido-imagem">
                            <asp:Repeater ID="rpImagemServico" runat="server">
                                <ItemTemplate>
                                    <asp:Image CssClass="slide" runat="server" ImageUrl='<%# "~/imagens/" + DataBinder.Eval(Container.DataItem, "Pasta") + "/" + DataBinder.Eval(Container.DataItem, "Nome") %>' />
                                </ItemTemplate>
                            </asp:Repeater>
                            <!--<img src="imagens/labio.png" class="slide">
                            <img src="imagens/progressiva-semformol.jpg" class="slide">-->

                            <asp:Panel ID="btnRadios" runat="server"></asp:Panel>
                            <!--<div id="btnRadios">
                                <div class="btnRadio btnPreenchido" onclick="currentDiv(0)"></div>
                                <div class="btnRadio btnContorno" onclick="currentDiv(1)"></div>
                            </div>-->
                        </div>

                        <div class="servico-expandido-dados-container">
                            <div class="servico-expandido-info-container">
                                <div cladss="servico-expandido-" style="width: 100%;">
                                    <h1>
                                        <asp:Literal ID="litNomeServico" runat="server"></asp:Literal>
                                    </h1>
                                    <h2>R$
                                        <asp:Literal ID="litPrecoServico" runat="server"></asp:Literal></h2>
                                </div>

                                <div class="estrelas-avaliativas">
                                    <asp:Literal ID="litEstrelasMediaServico" runat="server"></asp:Literal>
                                    <asp:Literal ID="litQuantidadeAvaliacoesServico" runat="server"></asp:Literal>
                                </div>

                                <div>
                                    <p><i class="fa-regular fa-clock"></i>em média
                                        <asp:Literal ID="litDuracaoServico" runat="server"></asp:Literal>
                                        min</p>
                                </div>
                            </div>

                            <div class="servico-expandido-descricao">
                                <h3>Descrição do serviço</h3>
                                <p><asp:Literal ID="litDescricaoServico" runat="server"></asp:Literal></p>
                                    <asp:Button ID="btnAgendar" runat="server" Text="Agendar" CssClass="botoes" OnClick="btnAgendar_Click" />
                                    <div class="cls"></div>
                            </div>
                        </div>

                    </div>

                    <h1>Avaliações</h1>

                    <div class="filtros-lista">
                         <div>
                            <asp:Button runat="server" Text="Todos" OnClick="BtnListarDepoimentosComFiltro" CssClass="filtros" CommandArgument="0" />
                        </div>

                        <div>
                            <asp:Button runat="server" Text="Positivas" OnClick="BtnListarDepoimentosComFiltro" CssClass="filtros" CommandArgument="1" />
                        </div>

                        <div>
                            <asp:Button runat="server" Text="Negativas" OnClick="BtnListarDepoimentosComFiltro" CssClass="filtros" CommandArgument="2" />
                        </div>
                    </div>

                    <div class="section-avaliacoes">
                    <asp:Panel ID="pnlAvaliacao" CssClass="avaliacoes-container" runat="server">
                    </asp:Panel>
                    </div>

                    <div class="section-avaliacoes">
                        <asp:Literal ID="litAvaliacao" runat="server"></asp:Literal>
                    </div>
            </section>
        </div>
        <asp:Panel ID="loading_spinner" runat="server" CssClass="loading_spinner">
            <div class="spinner"></div>
        </asp:Panel>
    </form>
    <script src="<%=ResolveUrl("~/js/carrosselImagens.js") %>" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~/js/menu_sanduiche.js") %>" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~/js/filtroSelecionado.js") %>" type="text/javascript"></script>
</body>
</html>

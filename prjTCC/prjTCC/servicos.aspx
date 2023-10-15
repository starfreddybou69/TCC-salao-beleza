<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="servicos.aspx.cs" Inherits="prjTCC.servicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    <title>La Bella</title>
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
                    <h1>Escolha um de nossos serviços</h1>

                    <div class="filtros-lista">
                        <asp:Repeater ID="rpFiltrosLista" runat="server">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" NavigateUrl='<%# "~/servicos.aspx" + "?categoria=" + DataBinder.Eval(Container.DataItem, "Codigo")  %>'>
                                <!--<div class="filtros-lista">-->
                                    <div class="filtros">
                                    <p><%# DataBinder.Eval(Container.DataItem, "Nome") %></p>
                                    </div>
                                <!--</div>-->
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <div class="lista-servicos">
                        <asp:Repeater ID="rpListaServicos" runat="server">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" NavigateUrl='<%# "~/servico_expandido.aspx" + "?servico=" + DataBinder.Eval(Container.DataItem, "Codigo")  %>'>
                                    <div class="servico-container">
                                        <div class="servico-imagem">
                                            <asp:Image ImageUrl='<%# "~/imagens/" + DataBinder.Eval(Container.DataItem, "Imagem[0].Pasta") + "/" + DataBinder.Eval(Container.DataItem, "Imagem[0].Nome") %>' runat="server"/>
                                        </div>
                                        <h2><%# DataBinder.Eval(Container.DataItem, "Nome")%> </h2>
                                        <div class="preco-tempo">
                                            <h3>R$ <%# DataBinder.Eval(Container.DataItem, "Valor") %> <h3>
                                            <p><i class="fa-regular fa-clock"></i>em média <%# DataBinder.Eval(Container.DataItem, "Duracao") %> min</p>
                                        </div>
                                    </div>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
            </section>
        </div>
        <asp:Panel ID="loading_spinner" runat="server" CssClass="loading_spinner">
            <div class="spinner"></div>
        </asp:Panel>
    </form>
</body>
</html>

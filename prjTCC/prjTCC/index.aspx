<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="prjTCC.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    <title>Stefany Amorim - Cílios e Sobrancelhas</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
    <script src="https://kit.fontawesome.com/f9a95042e5.js" crossdorigin="anonymous"></script>
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

            <section>
                <div class="banner-container">
                    <img src="imagens/Banner/banner2.jpg" alt="banner de destaque">
                </div>

                <h1 class="centralizado">Faça o seu agendamento</h1>

                <div id="carrossel" class="section-content-largura">

                    <div class="div_botoes_navegacao">
                        <div class="botoes_navegacao" id="left"><span><</span></div>
                    </div>

                    <div class="wrapper">
                        <div id="tipo_servicos_containers">
                            <asp:Repeater ID="rpTipoServicosContainers" runat="server">
                                <ItemTemplate>   
                                    <asp:HyperLink runat="server" NavigateUrl='<%# "~/servicos.aspx" + "?categoria=" + DataBinder.Eval(Container.DataItem, "Codigo")  %>'>
                                    <div class="tipo_servicos_container">
                                        <asp:Image runat="server" ImageUrl='<%# "~/imagens/" + DataBinder.Eval(Container.DataItem, "Imagem.Pasta") + "/" + DataBinder.Eval(Container.DataItem, "Imagem.Nome") %>' />
                                        <h3><%# DataBinder.Eval(Container.DataItem, "Nome") %></h3>
                                        <!--<p>Veja mais ></p>-->
                                    </div>
                                    </asp:HyperLink>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <div class="div_botoes_navegacao">
                        <div class="botoes_navegacao" id="right"><span>></span></div>
                    </div>
                </div>
            </section>

            <asp:Literal ID="litDepoimentos" runat="server"></asp:Literal>

            <footer>
                <div class="footer-container">
                    <div class="logo-container">
                        <asp:HyperLink NavigateUrl="~/index.aspx" runat="server">
                            <img src="imagens/logotipo_branco.png">
                        </asp:HyperLink>
                        
                    </div>

                    <div>
                        <h1>Onde nos encontrar</h1>

                        <ul>
                            <li>Av. Epitácio Pessoa, 466, Santos-SP</li>
                        </ul>
                    </div>

                    <div>
                        <h1>Horário</h1>

                        <ul>
                            <li>De terça a sábado das 9 às 18</li>
                        </ul>
                    </div>

                    <div class="footer-contato-container">
                        <h1>Contato</h1>

                        <ul>
                            <li>(13) 99009-9625</li>
               
                        </ul>
                        <div class="contato-icones">
                            <i class="fa-brands fa-whatsapp"></i>
                            <i class="fa-brands fa-instagram"></i>
                        </div>
                    </div>
                </div> 
        </footer>
        </div>

        <asp:Panel ID="loading_spinner" runat="server" CssClass="loading_spinner">
            <div class="spinner"></div>
        </asp:Panel>
    </form>
    <script src="<%=ResolveUrl("~/js/carrosselServico.js") %>" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~/js/menu_sanduiche.js") %>" type="text/javascript"></script>
</body>
</html>

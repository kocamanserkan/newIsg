<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ISTANIM.aspx.cs" Inherits="serkanISG.ISTANIM1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="header">

        <div class="header-right">


            <div class="user-info-dropdown">
                <div class="dropdown">
                    <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown">
                        <span class="user-icon">
                            <img src="vendors/images/photo1.jpg" alt="">
                        </span>
                        <asp:Label ID="lblAd" CssClass="user-name" runat="server" Text="Label"></asp:Label>

                    </a>
                    <div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
                        <a class="dropdown-item" href="profile.html"><i class="dw dw-user1"></i>Profilim</a>
                        <a class="dropdown-item" href="profile.html"><i class="dw dw-settings2"></i>Ayarlar</a>

                        <a class="dropdown-item" href="login.aspx"><i class="dw dw-logout"></i>Çıkış</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="left-side-bar">
        <div class="brand-logo">
            <a href="PersonelPaneli.aspx">
                <img src="vendors/images/logo.png" alt="" class="dark-logo">
                <img src="vendors/images/logo.png" alt="" class="light-logo">
            </a>
            <div class="close-sidebar" data-toggle="left-sidebar-close">
                <i class="ion-close-round"></i>
            </div>
        </div>
        <div class="menu-block customscroll">
            <div class="sidebar-menu">
                <ul id="accordion-menu">
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-house-1"></span><span class="mtext">Uygunsuzluk Modülü</span>
                        </a>
                        <ul class="submenu">
                            <li><a href="Uygunsuzluk.aspx">Uygunsuzluk İşlemleri</a></li>
                            <%--<li><a href="UygunsuzlukGiris.aspx">Uygunsuzluk Giriş</a></li>
                            <li><a href="PersonelListesi.aspx">Personel Listesi</a></li>--%>
                            <li><a href="ISTANIM.aspx">İŞ TANIM</a></li>

                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="mobile-menu-overlay"></div>


    <div class="pd-ltr-20 xs-pd-20-10" style="margin-left: 10%; width: 1230px;">
        <div class="min-height-200px">

            <!-- Simple Datatable start -->
            <div class="card-box mb-190">
                <div class="pd-20" style="margin-top: 100px">
                    <h4 class="text-blue h4 text-center">İŞ TANIM LİSTESİ</h4>
                </div>
            </div>
            <br />
            <ul>
                <li>
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Yeni İş Tanımı Ekle</button>
                  

                </li>

            </ul>
            <br />
            <asp:GridView ID="grdISTANIM" CssClass="data-table table stripe hover nowrap" AutoGenerateColumns="False" GridLines="None" runat="server">

                <Columns>

                    <asp:TemplateField HeaderText="Düzen">
                        <ItemTemplate>
                            <asp:Button ID="btn_Edit" CssClass="btn btn-primary" runat="server" Text="Düzenle" CommandName="Select" />
                            <asp:Button ID="btn_Sil" CssClass="btn btn-danger" runat="server" Text="Sil" CommandName="Select" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="ISID" HeaderText="İŞ ID'si" />
                    <asp:BoundField DataField="ISADI" HeaderText="İŞ ADI" />
                </Columns>

            </asp:GridView>

        </div>
        <div class="footer-wrap pd-20 mb-20 card-box">
            Uygunsuzluk Modülü By <a href="https://github.com/mavihub" target="_blank">Serkan Kocaman</a>
        </div>

    </div>

    <!-- Button trigger modal -->
    

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">İş tanımı ekle</h4>
                    <button type="button" id="kapa" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    
                </div>
                <div class="modal-body">
                    <label class="form-group-item" >İş Adı*</label>
                    <asp:TextBox class="form-control" ClientId="clientISADI" ID="txtISADI" runat="server"></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="ss"  ControlToValidate="txtISADI" runat="server"  ErrorMessage="Bu Alan Zorunludur"></asp:RequiredFieldValidator>
                      
                    <%--<input type="text" id="txtISADI" class="form-control" value="" />--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_Vazgec" class="btn btn-secondary" data-dismiss="modal">Vazgeç</button>
                    <asp:Button ID="btn" CssClass="btn btn-primary" OnClick="btn_Click" runat="server" Text="Ekle+" />
                   
                </div>
            </div>
        </div>
    </div>
    <script>
        $("#btn_Vazgec").click(function () {
           
            window.location.href = "https://localhost:44398/ISTANIM";

        })
        $("#kapa").click(function () {
           
            window.location.href = "https://localhost:44398/ISTANIM";

        })

    </script>

</asp:Content>

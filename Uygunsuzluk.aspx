<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" CodePage="28599" Debug="true" AutoEventWireup="true" CodeBehind="Uygunsuzluk.aspx.cs" Inherits="serkanISG.Uygunsuzluk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <meta charset="utf-8" />
    <style>
        .footer-wrap {
            margin-top: 35px;
            margin-left: 165px;
        }

        .none {
            background-color: red;
        }
    </style>

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
                            <li><a href="PersonelPaneli.aspx">Personel Paneli</a></li>
                            <li><a href="Uygunsuzluk.aspx">Uygunsuzluk İşlemleri</a></li>
                            <li><a href="PersonelListesi.aspx">Personel Listesi</a></li>

                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div>
        <div class="mobile-menu-overlay"></div>


        <div class="pd-ltr-20 xs-pd-20-10" style="margin-left: 10%; width: 1230px;">

            <div class="min-height-200px">

                <!-- Simple Datatable start -->
                <div class="card-box mb-190">
                    <div class="pd-20" style="margin-top: 100px">

                        <button class="btn btn-primary btn-sm scroll-click" data-toggle="modal" style="margin-left: 963px; width: 150px; margin-top: -23px;" data-target="#a" type="button">Güncelle</button>


                        <button class="btn btn-primary btn-sm scroll-click" data-toggle="modal" style="margin-left: 963px;" data-target="#bd-example-modal-lg" type="button">Uygunsuzluk Ekle</button>
                        <div class="modal fade bs-example-modal-lg" id="bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="myLargeModalLabel">Uygunsuzluk Giriş Formu</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group row">
                                            <label class="col-sm-12 col-md-2 col-form-label">Uygunsuzluk Türü</label>
                                            <div class="col-sm-12 col-md-10">
                                                <asp:DropDownList ID="ddlTur" CssClass="form-control" runat="server">
                                                    <asp:ListItem>Minör</asp:ListItem>
                                                    <asp:ListItem>Majör</asp:ListItem>
                                                    <asp:ListItem>Hayati</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-12 col-md-2 col-form-label">Birim</label>
                                            <div class="col-sm-12 col-md-10">
                                                <asp:DropDownList ID="ddlBirim" CssClass="form-control" runat="server">
                                                    <asp:ListItem>Yönetim Birimi</asp:ListItem>
                                                    <asp:ListItem>Üretim Planlama</asp:ListItem>
                                                    <asp:ListItem>Üretim Tesisi</asp:ListItem>
                                                    <asp:ListItem>Halkla İlişkiler</asp:ListItem>
                                                    <asp:ListItem>Ham Madde Kabul </asp:ListItem>
                                                    <asp:ListItem>Ürün Geliştirme </asp:ListItem>
                                                    <asp:ListItem>Ortak Alan </asp:ListItem>
                                                    <asp:ListItem>Yemekhane </asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-12 col-md-2 col-form-label">Tespit Tarihi</label>
                                            <div class="col-sm-12 col-md-10">
                                                <asp:TextBox ID="dtpTespitTarih" clasS="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                                <asp:RangeValidator
                                                    runat="server"
                                                    ID="timeValidator"
                                                    Type="Date"
                                                    ControlToValidate="dtpTespitTarih"
                                                    MaximumValue="2021/02/27"
                                                    Style="color: red; font-size: 14px"
                                                    MinimumValue="1000/12/28"
                                                    ErrorMessage="Uygunsuzluk tespit tarihi bugünden sonra olamaz." />

                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-12 col-md-2 col-form-label">Uygunsuz Durumu</label>
                                            <div class="col-sm-12 col-md-10">
                                                <asp:TextBox ID="txtUygnsuzDurum" class="form-control" TextMode="MultiLine" placeholder="Uygunsuz durumu açıklayınız." runat="server"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-12 col-md-2 col-form-label">Önerilen Aksiyon</label>
                                            <div class="col-sm-12 col-md-10">
                                                <asp:TextBox ID="txtAksiyon" class="form-control" TextMode="MultiLine" placeholder="Uygunsuz duruma karşı alınabilecek aksiyon önerileri.." runat="server"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-12 col-md-2 col-form-label">Tespit Eden</label>
                                            <div class="col-sm-12 col-md-10">
                                                <asp:DropDownList ID="ddlTespitEden" CssClass="form-control" runat="server"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-12 col-md-2 col-form-label">Sorumlu</label>
                                            <div class="col-sm-12 col-md-10">
                                                <asp:DropDownList ID="ddlSorumlu" CssClass="form-control" runat="server"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-12 col-md-2 col-form-label">Önerilen Termin Tarihi</label>
                                            <div class="col-sm-12 col-md-10">
                                                <asp:TextBox ID="dateTerminTarihi" class="form-control" TextMode="Date" placeholder="" runat="server"></asp:TextBox>
                                                <asp:RangeValidator
                                                    runat="server"
                                                    ID="val_termintarih"
                                                    Type="date"
                                                    ControlToValidate="datetermintarihi"
                                                    MaximumValue="2060/02/27"
                                                    Style="color: red; font-size: 14px"
                                                    MinimumValue="2021/02/27"
                                                    ErrorMessage=" önerilen termin tarihi bugünden sonra olamaz." />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
                                        <asp:Button ID="btnUygunsuzlukSave" OnClick="btnUygunsuzlukSave_Click" class="btn btn-primary" runat="server" Text="Uygunsuzluk Ekle" />
                                    </div>
                                </div>
                            </div>
                        </div>


                        <h4 class="text-blue h4">Uygunsuzluk Listesi</h4>
                    </div>

                    <%--GridView--%>

                    <div style="width: 100%; height: 400px; overflow: scroll">
                        <asp:GridView ID="grdUygunsuzlukListe" runat="server" CssClass="data-table table stripe hover nowrap" GridLines="None"  OnRowCancelingEdit="grdUygunsuzlukListe_RowCancelingEdit"
                            OnRowEditing="grdUygunsuzlukListe_RowEditing" OnRowUpdating="grdUygunsuzlukListe_RowUpdating" OnRowDeleting="grdUygunsuzlukListe_RowDeleting" OnSelectedIndexChanged="grdUygunsuzlukListe_SelectedIndexChanged">
                            <Columns>

                                <asp:TemplateField HeaderText="Seç ve Güncelle">
                                    <ItemTemplate>
                                        <%--<asp:LinkButton runat="server" ID="btn_Edit" Text="<i class='icon-camera-retro'></i> Düzenle" CommandName="Edit" CssClass="greenButton" />--%>
                                        <asp:LinkButton runat="server" ID="secc" Text="<i class='icon-copy fi-pencil'></i>"  CommandName="Select" CssClass="greenButton" OnClientClick="showModal();"  />


                                        <%--<asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Select" />--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                              <%--  <asp:ButtonField CommandName="Select" Text="Button" />--%>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-wrap pd-20 mb-20 card-box">
            Uygunsuzluk Modülü By <a href="https://github.com/mavihub" target="_blank">Serkan Kocaman</a>
        </div>
    </div>
    <%--MOdalllllllllllll--%>


    <div class="modal fade bs-example-modal-lg" id="a" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myLargeModalLabela">Uygunsuzluk Güncellleme Ekranı</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Uygunsuzluk ID</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:Label ID="label_ID" runat="server" Text="Uygunsuzluk ID"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Uygunsuzluk Türü</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:DropDownList ID="ddlTura" CssClass="form-control" runat="server">
                                <asp:ListItem>Minör</asp:ListItem>
                                <asp:ListItem>Majör</asp:ListItem>
                                <asp:ListItem>Hayati</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Durum</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:DropDownList ID="ddldurum" CssClass="form-control" runat="server">
                                <asp:ListItem>Aktif</asp:ListItem>
                                <asp:ListItem>Pasif</asp:ListItem>

                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Birim</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:DropDownList ID="ddlBirima" CssClass="form-control" runat="server">
                                <asp:ListItem>Yönetim Birimi</asp:ListItem>
                                <asp:ListItem>Üretim Planlama</asp:ListItem>
                                <asp:ListItem>Üretim Tesisi</asp:ListItem>
                                <asp:ListItem>Halkla İlişkiler</asp:ListItem>
                                <asp:ListItem>Ham Madde Kabul </asp:ListItem>
                                <asp:ListItem>Ürün Geliştirme </asp:ListItem>
                                <asp:ListItem>Ortak Alan </asp:ListItem>
                                <asp:ListItem>Yemekhane </asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Tespit Tarihi</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:TextBox ID="dtpTespitTariha" clasS="form-control" TextMode="Date" runat="server"></asp:TextBox>
                            <asp:RangeValidator
                                runat="server"
                                ID="timeValidatora"
                                Type="Date"
                                ControlToValidate="dtpTespitTariha"
                                MaximumValue="2021/03/01"
                                Style="color: red; font-size: 14px"
                                MinimumValue="2008/12/28"
                                ErrorMessage="Uygunsuzluk tespit tarihi bugünden sonra olamaz." />

                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Uygunsuz Durumu</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:TextBox ID="txtUygnsuzDuruma" class="form-control" TextMode="MultiLine" placeholder="Uygunsuz durumu açıklayınız." runat="server"></asp:TextBox>
                            <%--<input id="txtSICIL_NO" class="form-control" placeholder="Sicil numaranızı giriniz." type="text">--%>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Önerilen Aksiyon</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:TextBox ID="txtaksiyona" class="form-control" TextMode="MultiLine" placeholder="Uygunsuz duruma karşı alınabilecek aksiyon önerileri.." runat="server"></asp:TextBox>
                            <%--<input id="txtSICIL_NO" class="form-control" placeholder="Sicil numaranızı giriniz." type="text">--%>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Tespit Eden</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:DropDownList ID="ddlTespitedena" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Sorumlu</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:DropDownList ID="ddlSorumlua" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Önerilen Termin Tarihi</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:TextBox ID="dtpTerminTariha" class="form-control" TextMode="Date" runat="server"></asp:TextBox>
                            <asp:RangeValidator
                                runat="server"
                                ID="RangeValidator1"
                                Type="date"
                                ControlToValidate="dtpTerminTariha"
                                MaximumValue="2060/02/27"
                                Style="color: red; font-size: 14px"
                                MinimumValue="2021/03/01"
                                ErrorMessage=" Önerilen termin tarihi bugünden önce olamaz." />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
                    <%--<button type="button"  class="btn btn-primary">Uygunsuzluk Ekle</button>--%>
                    <asp:Button ID="Guncelle" OnClick="Guncelle_Click" class="btn btn-primary" runat="server" Text="Güncelle" />
                    <asp:Button ID="Sil" class="btn btn-primary" OnClick="Sil_Click" BackColor="#e61111" BorderColor="Red" runat="server" Text="Sil" />
                </div>
            </div>
        </div>
    </div>
    <button id="asdasd">Merhaba</button>
    <asp:Button ID="buttonAdd" runat="server" Text="Asp Button" />

    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= buttonAdd.ClientID %>').click(function () {

                alert("Asp Button");

                

            });

            function showModal() {
                alert('sdfsjhfsjk');
            }

    });
    </script>









</asp:Content>

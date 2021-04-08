<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="KategoriTanim.aspx.cs" Inherits="serkanISG.KategoriTanim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #snackbar {
            visibility: hidden;
            min-width: 250px;
            margin-left: -125px;
            background-color: #333;
            color: #fff;
            text-align: center;
            border-radius: 2px;
            padding: 16px;
            position: fixed;
            z-index: 1;
            left: 50%;
            bottom: 30px;
            font-size: 17px;
        }

            #snackbar.show {
                visibility: visible;
                -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
                animation: fadein 0.5s, fadeout 0.5s 2.5s;
            }

        @-webkit-keyframes fadein {
            from {
                bottom: 0;
                opacity: 0;
            }

            to {
                bottom: 30px;
                opacity: 1;
            }
        }

        @keyframes fadein {
            from {
                bottom: 0;
                opacity: 0;
            }

            to {
                bottom: 30px;
                opacity: 1;
            }
        }

        @-webkit-keyframes fadeout {
            from {
                bottom: 30px;
                opacity: 1;
            }

            to {
                bottom: 0;
                opacity: 0;
            }
        }

        @keyframes fadeout {
            from {
                bottom: 30px;
                opacity: 1;
            }

            to {
                bottom: 0;
                opacity: 0;
            }
        }
    </style>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    <%--<link href="Content/upload.css" rel="stylesheet" />--%>
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
                        <a class="dropdown-item" href="profile.aspx"><i class="dw dw-user1"></i>Profilim</a>


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
                            <span class="micon dw dw-house-1"></span><span class="mtext">Tanımlar</span>
                        </a>
                        <ul class="submenu">

                            <li><a href="PersonelPaneli.aspx">Personel Paneli</a></li>
                            <li><a href="Uygunsuzluk.aspx">Uygunsuzluk İşlemleri</a></li>
                            <li><a href="PersonelListesi.aspx">Personel Kayıt İşlemleri</a></li>
                            <li><a href="ISTANIMLARI.aspx">İş Tanımları</a></li>
                            <li><a href="Lokasyon.aspx">Lokasyon</a></li>
                            <li><a href="KategoriTanim.aspx">Kategori</a></li>
                             <li><a href="VardiyaTanim.aspx">Vardiya</a></li>


                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-house-1"></span><span class="mtext">Uygunsuzluk</span>
                        </a>
                        <ul class="submenu">


                            <li><a href="Uygunsuzluk.aspx">Uygunsuzluk İşlemleri</a></li>



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
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myyModal">Yeni Kategori Tanımı Ekle</button>


                </li>

            </ul>
            <br />
            <div style="width: 100%; height: 400px; overflow: scroll">
                <asp:GridView ID="grdKATEGORI" CssClass="data-table table stripe hover nowrap" AutoGenerateColumns="False" GridLines="None" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="Düzen">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" CssClass="btn btn-warning" ID="link" CausesValidation="false" CommandName="Select" CommandArgument='<%# Eval("ID_KATEGORI") %>' OnClick="link_Click">Düzenle</asp:LinkButton>
                                <asp:LinkButton runat="server" CssClass="btn btn-danger" ID="btn_sil" OnClientClick="return fnConfirmDelete();" CausesValidation="false" CommandArgument='<%# Eval("ID_KATEGORI") %>' OnClick="btn_sil_Click">Sil</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID_KATEGORI" HeaderText="KATEGORİ KODU" />
                        <asp:BoundField DataField="AD_KATEGORI" HeaderText="KATOGORİ ADI" />
                     
                    </Columns>
                </asp:GridView>
            </div>
            <div id="myModal" class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Kategori Tanım Düzenleme Ekranı</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Label2" runat="server" Text="Kategori Kodu:" />
                            &nbsp; 
                            <asp:Label ID="lbl_KategoriEdit" runat="server" Text="Label" />
                            <br />
                            <hr />

                            <asp:Label ID="Label1" runat="server" Text="Kategori Adı:">
                                                                        
                            </asp:Label><asp:TextBox CssClass="form-control" ID="txtKategoriAd_edit" runat="server"></asp:TextBox><br />
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
                            <asp:Button Text="Güncelle" CausesValidation="false" OnClientClick="fnConfirmUpdate();" ID="edit_Kaydet" class="btn btn-primary" OnClick="edit_Kaydet_Click" runat="server" />
                          
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="footer-wrap pd-20 mb-20 card-box">
            Uygunsuzluk Modülü By <a href="https://github.com/mavihub" target="_blank">Serkan Kocaman</a>
        </div>

    </div>



    <!-- Button trigger modal -->


    <!-- Modal -->
    <div class="modal fade" id="myyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">Kategori Tanım Ekranı</h4>
                    <button type="button" id="kapa" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                </div>
                <div class="modal-body">
                    <label class="form-group-item">Kategori Adı*</label>
                    <asp:TextBox class="form-control" ClientId="clientISADI" ID="txtKategoriAdi" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ss" ControlToValidate="txtKategoriAdi" ForeColor="red" runat="server" ErrorMessage="Bu Alan Zorunludur"></asp:RequiredFieldValidator>

                    <%--<input type="text" id="txtISADI" class="form-control" value="" />--%>
                </div>
                <div class="modal-footer">

                    <button type="button" id="btn_Vazgec" class="btn btn-secondary" data-dismiss="modal">Vazgeç</button>
                    <asp:Button ID="btnNewKategori" CssClass="btn btn-primary" OnClick="btnNewKategori_Click" margin-top="4px;" runat="server" Text="Ekle" />

                </div>
            </div>
        </div>
    </div>

    <%-- <script language="javascript" type="text/javascript">
           
        </script>--%>



    <%-- <button onclick="myFunction();">Show Snackbar</button>--%>
    
    <div id="snackbar" style="width: 20%; overflow: visible; margin-left: 60%; position: relative; min-height: 40%;">Kayıt Eklendi</div>


    <script>
        function myFunction(msg, olay) {
            if (olay == "succsess") {
                var x = document.getElementById("snackbar");
                x.style.backgroundColor = "green"
                x.style.fontSize = "25px";
                x.innerHTML = msg;

                x.className = "show";
                setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
                $("#snackbar").show()
            } else if (olay == "fail") {

                var x = document.getElementById("snackbar");
                x.style.backgroundColor = "red"
                x.innerHTML = msg;
                x.className = "show";
                setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
                $("#snackbar").show()
            }
            else {
                x.innerHTML = msg;

                var x = document.getElementById("snackbar");
                x.innerHTML = msg
                x.style.fontSize = "25px";
                x.className = "show";
                setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
                $("#snackbar").show()

            }
        }


    </script>



    <script>
        $("#btn_Vazgec").click(function () {

            window.location.href = "https://localhost:44398/KategoriTanim";

        })
        $("#kapa").click(function () {

            window.location.href = "https://localhost:44398/KategoriTanim";

        })




        function fnConfirmDelete() {
            return confirm("İş Tanımını silmek üzeresiniz. Onaylıyor musunuz?");
        }

        //function fnConfirmUpdate() {
        //    return confirm("İş Tanımını güncellemek üzeresiniz. Onaylıyor musunuz?");
        //}




    </script>






</asp:Content>

<%@ Page Title="İş Tanımları" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ISTANIMLARI.aspx.cs" Inherits="serkanISG.ISTANIMLARI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/MyCSS.css" rel="stylesheet" />
    <script src="../Scripts/MyFunctions.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>


    <%--başlama--%>
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

                <li style="float: left;">
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myyModal">Yeni İş Tanımı Ekle</button>

                </li>

                <li style="float: left;">
                    <asp:DropDownList ID="ddlAktiflik" AutoPostBack="true" OnSelectedIndexChanged="ddlAktiflik_SelectedIndexChanged" CssClass="form-control" Style="width: 200px; margin-left: 350%" runat="server">

                        <asp:ListItem Selected hidden Text="Listeleme Durumu" />
                        <asp:ListItem Text="Aktif" />
                        <asp:ListItem Text="Pasif" />
                    </asp:DropDownList>
                </li>
            </ul>
            <br />
            <div style="width: 100%; height: 400px; overflow: scroll">
                <asp:GridView ID="grdISTANIM" CssClass="data-table table stripe hover nowrap" AutoGenerateColumns="False" GridLines="None" runat="server">

                    <Columns>

                        <asp:TemplateField HeaderText="Düzen">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" CssClass="btn btn-warning" Text="<i class='icon-copy fi-pencil'></i>" ToolTip="Düzenle" ID="link" CausesValidation="false" CommandName="Select" CommandArgument='<%# Eval("ID_IS") %>' OnClick="link_Click"></asp:LinkButton>

                                <div class="pasif">
                                    <asp:LinkButton runat="server" Style="margin-left: 49px; margin-top: -64px;" CssClass="btn btn-danger" Text="<i class='fa fa-trash-o' aria-hidden='true'></i>" ToolTip="Sil" ID="btn_sil" OnClientClick="return fnConfirmDelete();" CausesValidation="false" CommandArgument='<%# Eval("ID_IS") %>' OnClick="btn_sil_Click"></asp:LinkButton>
                               </div>
                                <div style="display:none;" class="reload">
                    <asp:LinkButton runat="server" Style="margin-left: 49px; margin-top: -64px;  " CssClass="btn btn-success" Text="<i class='fa fa-refresh' aria-hidden='true'></i>" ToolTip="Aktif Et" ID="reload" Onclick="reload_Click" OnClientClick="return fnConfirmActive();" CausesValidation="false" CommandArgument='<%# Eval("ID_IS") %>'></asp:LinkButton>

                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID_IS" HeaderText="İŞ ID'si" />
                        <asp:BoundField DataField="AD_IS" HeaderText="İŞ ADI" />
                        <asp:BoundField DataField="DURUM_IS" HeaderText="Aktiflik" />

                    </Columns>

                </asp:GridView>
            </div>
            <div id="myModal" class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">İş Tanım Düzen Ekranı</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="card">
                                <div style="background-color: aquamarine" class="card-header">
                                    İş Tanımı  Bilgileri
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <asp:Label ID="Label2" runat="server" CssClass="col-form-label-lg" Text="İş Id'si:" />
                                        &nbsp; 
                                        
                                         <asp:Label ID="lblISid_edit" runat="server" CssClass="form-control" Text="Label" />
                                    </div>
                                    <div class="row">
                                         <asp:Label ID="Label1" CssClass="col-form-label-lg" runat="server" Text="İş Adı:">
              
                                    </asp:Label><asp:TextBox CssClass="form-control" ID="txtIsAdi_edit" runat="server"></asp:TextBox><br />
                                    </div>
                                    <div class="row">
                                        <asp:Label Text="Aktiflik" CssClass="col-form-label-lg" runat="server" />
                                        <asp:DropDownList id="Durum_edit" CssClass="form-control" runat="server">
                                            <asp:ListItem Text="Aktif" />
                                            <asp:ListItem Text="Pasif" />
                                        </asp:DropDownList>
                                    </div>
                                   
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
                            <asp:Button Text="Güncelle" CausesValidation="false" OnClientClick="fnConfirmUpdate();" ID="edit_Kaydet" class="btn btn-success" OnClick="edit_Kaydet_Click" runat="server" />

                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>



    <!-- Button trigger modal -->


    <!-- Modal -->
    <div class="modal fade" id="myyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">İş tanımı ekle</h4>
                    <button type="button" id="kapa" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                </div>
                <div class="modal-body">
                    <div class="card">
                        <div style="background-color: aquamarine" class="card-header">
                            İş Tanımı  Bilgileri
                        </div>
                        <div class="card-body">
                            <asp:TextBox class="form-control" ClientId="clientISADI" ID="txtISADI" runat="server"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="ss" ControlToValidate="txtISADI" runat="server" ErrorMessage="Bu Alan Zorunludur"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">

                    <button type="button" id="btn_Vazgec" class="btn btn-secondary" data-dismiss="modal">Vazgeç</button>
                    <asp:Button ID="btn" CssClass="btn btn-primary" OnClick="btn_Click" margin-top="4px;" runat="server" Text="Ekle" />

                </div>
            </div>
        </div>
    </div>


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

            window.location.href = "https://localhost:44398/TANIM/ISTANIMLARI";

        })
        $("#kapa").click(function () {

            window.location.href = "https://localhost:44398/TANIM/ISTANIMLARI";

        })


        if ($('#<%= ddlAktiflik.ClientID %>').val() == "Pasif") {
            $(".pasif").css("display", "none");
            $(".reload").css("display", "block");

        }

        function fnConfirmDelete() {
            return confirm("İş Tanımını silmek üzeresiniz. Onaylıyor musunuz?");
        }
        function fnConfirmActive() {
            return confirm("İş tanımını aktife almak istiyor musunuz?");
        }


    </script>


</asp:Content>

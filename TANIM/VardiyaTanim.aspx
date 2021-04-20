<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="VardiyaTanim.aspx.cs" Inherits="serkanISG.VardiyaTanim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script src="../Scripts/MyFunctions.js"></script>
    <link href="../Content/MyCSS.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>


    <div class="pd-ltr-20 xs-pd-20-10" style="margin-left: 10%; width: 1230px;">
        <div class="min-height-200px">

            <!-- Simple Datatable start -->
            <div class="card-box mb-190">
                <div class="pd-20" style="margin-top: 100px">
                    <h4 class="text-blue h4 text-center">VARDİYA  LİSTESİ</h4>
                </div>
            </div>
            <br />
            <ul>
                <li style="float: left">
                    <button type="button" id="AddItem" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myyModal">Yeni Vardiya Belirle</button>
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
                <asp:GridView ID="grdVardiya" CssClass="data-table table stripe hover nowrap" AutoGenerateColumns="False" GridLines="None" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="Düzen">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" CssClass="btn btn-warning" ID="link" Text="<i class='icon-copy fi-pencil'></i>" ToolTip="Düzenle" CausesValidation="false" CommandName="Select" CommandArgument='<%# Eval("ID_VARDIYA") %>' OnClick="link_Click"></asp:LinkButton>
                                <div class="pasif">
                                    <asp:LinkButton runat="server" style="margin-left: 53px;margin-top: -62px;" CssClass="btn btn-danger" ID="btn_sil" Text="<i class='fa fa-trash-o' aria-hidden='true'></i>" OnClientClick="return fnConfirmDelete();" CausesValidation="false" CommandArgument='<%# Eval("ID_VARDIYA") %>' OnClick="btn_sil_Click"></asp:LinkButton>
                                </div>
                                <div style="display: none;" class="reload">
                                    <asp:LinkButton runat="server" Style="margin-left: 49px; margin-top: -64px;" CssClass="btn btn-success" Text="<i class='fa fa-refresh' aria-hidden='true'></i>" ToolTip="Aktif Et" ID="reload" OnClick="reload_Click" OnClientClick="return fnConfirmActive();" CausesValidation="false" CommandArgument='<%# Eval("ID_VARDIYA") %>'></asp:LinkButton>

                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID_VARDIYA" HeaderText="VARDIYA KODU" />
                        <asp:BoundField DataField="AD_VARDIYA" HeaderText="VARDIYA ŞEKLİ" />
                        <asp:BoundField DataField="DURUM_VARDIYAa" HeaderText="Aktiflik" />

                    </Columns>
                </asp:GridView>
            </div>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Vardiya Tanım Ekranı</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                        </div>
                        <div class="modal-body">

                            <div class="row">
                                <div class="col-md-12">
                                    <asp:Label Text="Vardiya Kodu:" CssClass=" col-form-label-lg" runat="server" />
                                    &nbsp; 
                                    <asp:Label ID="lblVardiyaKodu" CssClass=" col-form-label-lg" runat="server" Text="Label"></asp:Label>
                                </div>
                            </div>
                            <br />
                            <label class="col-form-label-lg">Başlangıç*</label>

                            <div class="row">
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtBaslamaEdit" runat="server" CssClass=" form-control" TextMode="time" />
                                </div>
                            </div>
                            <br />
                            <label class="col-form-label-lg">Bitiş*</label>
                            <div class="row">
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtBitisEdit" runat="server" CssClass=" form-control" TextMode="time" />
                                </div>
                            </div>
                            <br />
                            <label class="col-form-label-lg">Durum*</label>

                            <div class="row">
                                <div class="col-md-10">
                                    <asp:DropDownList ID="ddlDurumEdit" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Aktif" />
                                        <asp:ListItem Text="Pasif" />
                                    </asp:DropDownList>
                                </div>
                            </div>



                        </div>
                        <div class="modal-footer">

                            <button type="button" id="btn_VVazgec" class="btn btn-secondary" data-dismiss="modal">Vazgeç</button>
                            <asp:Button ID="btnGuncelle" CausesValidation="false" CssClass="btn btn-success" OnClick="btnGuncelle_Click" margin-top="4px;" runat="server" Text="Değişiklikleri Kaydet" />

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
                    <h4 class="modal-title" id="myModalLabel">Vardiya Tanım  Ekranı</h4>
                    <button type="button" id="kapa" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                </div>
                <div class="modal-body">
                    <label class="form-group-item">Başlangıç*</label>
                    <div class="row">
                        <div class="col-md-10">
                            <asp:TextBox ID="txtbaslangicSaat" runat="server" CssClass=" form-control" TextMode="time" />
                        </div>
                    </div>
                    <br />
                    <label class="form-group-item">Bitiş*</label>
                    <div class="row">
                        <div class="col-md-10">
                            <asp:TextBox ID="txtBitisSaat" runat="server" CssClass=" form-control" TextMode="time" />
                        </div>
                    </div>

                    <br />
                    <br />


                </div>
                <div class="modal-footer">

                    <button type="button" id="btn_Vazgec" class="btn btn-secondary" data-dismiss="modal">Vazgeç</button>
                    <asp:Button ID="btnNewVardiya" CausesValidation="false" CssClass="btn btn-success" OnClick="btnNewVardiya_Click" margin-top="4px;" runat="server" Text="Ekle" />

                </div>
            </div>
        </div>
    </div>

    <div id="snackbar" style="width: 20%; overflow: visible; margin-left: 60%; position: relative; min-height: 40%;">Kayıt Eklendi</div>

    <script>



        $("#btn_Vazgec").click(function () {

            window.location.href = "https://localhost:44398/TANIM/VardiyaTanim";

        })
        $("#kapa").click(function () {

            window.location.href = "https://localhost:44398/TANIM/VardiyaTanim";

        })




        function fnConfirmDelete() {
            return confirm("Vardiya Tanımını silmek üzeresiniz. Onaylıyor musunuz?");
        }

        if ($('#<%= ddlAktiflik.ClientID %>').val() == "Pasif") {
            $(".pasif").css("display", "none");
            $(".reload").css("display", "block");

        }
        function fnConfirmActive() {
            return confirm("Vardiya tanımını aktife almak istiyor musunuz?");
        }



    </script>


</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="VardiyaTanim.aspx.cs" Inherits="serkanISG.VardiyaTanim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script src="Scripts/MyFunctions.js"></script>
    <link href="Content/MyCSS.css" rel="stylesheet" />
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
                <li>
                    <button type="button" id="AddItem" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myyModal">Yeni Vardiya Belirle</button>
                </li>
            </ul>
            <br />
            <div style="width: 100%; height: 400px; overflow: scroll">
                <asp:GridView ID="grdVardiya" CssClass="data-table table stripe hover nowrap" AutoGenerateColumns="False" GridLines="None" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="Düzen">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" CssClass="btn btn-warning" ID="link" CausesValidation="false" CommandName="Select" CommandArgument='<%# Eval("ID_VARDIYA") %>' OnClick="link_Click">Düzenle</asp:LinkButton>
                                <asp:LinkButton runat="server" CssClass="btn btn-danger" ID="btn_sil" OnClientClick="return fnConfirmDelete();" CausesValidation="false" CommandArgument='<%# Eval("ID_VARDIYA") %>' OnClick="btn_sil_Click">Sil</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID_VARDIYA" HeaderText="VARDIYA KODU" />
                        <asp:BoundField DataField="AD_VARDIYA" HeaderText="VARDIYA ŞEKLİ" />

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
                                <div class="col-md-4">
                                    <asp:Label Text="Vardiya Kodu:" CssClass=" col-form-label-lg" runat="server" />
                                    &nbsp;  
                                </div>
                                <div class="col-md-1">
                                    <asp:Label ID="lblVardiyaKodu" CssClass=" col-form-label-lg" runat="server" Text="Label"></asp:Label>
                                </div>

                            </div>
                            <br />
                            <label class="col-form-label-lg">Başlangıç*</label>
                            <div class="row">

                                <asp:TextBox ID="txtBaslamaEdit" runat="server" CssClass=" form-control" TextMode="time" />

                            </div>
                            <br />
                            <br />
                            <label class="col-form-label-lg">Bitiş*</label>
                            <div class="row">

                                <asp:TextBox ID="txtBitisEdit" runat="server" CssClass=" form-control" TextMode="time" />
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
                    <h4 class="modal-title" id="myModalLabel">Vardiya Tanım Ekranı</h4>
                    <button type="button" id="kapa" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                </div>
                <div class="modal-body">
                    <label class="form-group-item">Başlangıç*</label>
                    <div class="row">

                        <asp:TextBox ID="txtbaslangicSaat" runat="server" CssClass=" form-control" TextMode="time" />

                    </div>
                    <br />
                    <br />
                    <label class="form-group-item">Bitiş*</label>
                    <div class="row">
                        <asp:TextBox ID="txtBitisSaat" runat="server" CssClass=" form-control" TextMode="time" />
                    </div>
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

            window.location.href = "https://localhost:44398/VardiyaTanim";

        })
        $("#kapa").click(function () {

            window.location.href = "https://localhost:44398/VardiyaTanim";

        })




        function fnConfirmDelete() {
            return confirm("İş Tanımını silmek üzeresiniz. Onaylıyor musunuz?");
        }




    </script>


</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LOKASYON.aspx.cs" Inherits="serkanISG.LOKASYON" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    <script src="Scripts/upload.js"></script>

    <link href="Content/upload.css" rel="stylesheet" />



    <div class="pd-ltr-20 xs-pd-20-10" style="margin-left: 10%; width: 1230px;">
        <div class="min-height-200px">

            <!-- Simple Datatable start -->
            <div class="card-box mb-190">
                <div class="pd-20" style="margin-top: 100px">
                    <h4 class="text-blue h4 text-center">LOKASYON TANIM LİSTESİ</h4>
                </div>
            </div>
            <br />
            <ul>
                <li>
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" style="width: 210px;" data-target="#myyModal">Yeni Lokasyon Ekle</button>
                </li>
            </ul>
            <br />
            <div style="width: 100%; height: 400px; overflow: scroll">
                <asp:GridView ID="grdLOKASYON" CssClass="data-table table stripe hover nowrap" AutoGenerateColumns="False" GridLines="None" runat="server">

                    <Columns>

                        <asp:TemplateField HeaderText="Düzen">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" CssClass="btn btn-warning" ID="link" CausesValidation="false" CommandName="Select" CommandArgument='<%# Eval("ID_LOKASYON") %>' OnClick="link_Click">Düzenle</asp:LinkButton>
                                <asp:LinkButton runat="server" CssClass="btn btn-danger" ID="btn_sil" OnClientClick="return fnConfirmDelete();" CausesValidation="false" CommandArgument='<%# Eval("ID_LOKASYON") %>' OnClick="btn_sil_Click">Sil</asp:LinkButton>

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID_LOKASYON" HeaderText="LOKASYON ID'si" />
                        <asp:BoundField DataField="AD_LOKASYON" HeaderText="LOKASYON ADI" />
                        <asp:BoundField DataField="SEHIR_LOKASYON" HeaderText="ŞEHİR" />
                        <asp:BoundField DataField="ACIKLAMA_LOKASYON" HeaderText="AÇIKLAMA" />

                    </Columns>

                </asp:GridView>
            </div>
            <div id="myModal" class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Lokaston Güncelleme Ekranı</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <asp:TextBox ID="txtEditID" Style="display: none" runat="server"></asp:TextBox>
                                <div class="col-md-6">
                                    <label class="form-group-item">Lokasyon Adı*</label>
                                    <asp:TextBox class="form-control" ClientId="clientISADI" ID="txtLokasyonAd_Edit" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtLokasyonAd_Edit" runat="server" ErrorMessage="Bu Alan Zorunludur"></asp:RequiredFieldValidator>


                                </div>
                                <div class="col-md-6">
                                    <label class="form-group-item">Şehir</label>
                                    <asp:DropDownList CssClass="form-control" ID="ddlSehir_Edit" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="ddlSehir_Edit" runat="server" ErrorMessage="Bu Alan Zorunludur"></asp:RequiredFieldValidator>
                                </div>

                            </div>
                            <hr />
                            <label class="form-group-item">Açıklama</label>
                            <asp:TextBox class="form-control" TextMode="MultiLine" ClientId="clientISADI" ID="txt_Aciklama_Edit" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txt_Aciklama_Edit" runat="server" ErrorMessage="Bu Alan Zorunludur"></asp:RequiredFieldValidator>
                            <hr />

                            <label class="form-group-item">Kroki</label>
                            <div style="margin-left: 101px;" class="col-sm-4 imgUp">

                                <div class="imagePreview">
                                    <div style="height: 100%" id="a">
                                        <asp:Image ID="ass" Width="100%" Height="100%" runat="server" />
                                    </div>

                                </div>
                                <label style="width: 180px" id="deneme" class="btn btn-primary">
                                    <asp:FileUpload ID="imgEdit" runat="server" CssClass="uploadFile img" value="Upload Photo" Style="width: 0px; height: 0px; overflow: hidden;" />
                                    Kroki Güncelle
                                </label>

                                <!-- container -->
                            </div>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
                            <asp:Button Text="Güncelle" CausesValidation="false" OnClientClick="fnConfirmUpdate();" ID="edit_Kaydet" class="btn btn-success" Style="margin-top: 4px;" OnClick="edit_Kaydet_Click" runat="server" />

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
                    <h4 class="modal-title" id="myModalLabel">Lokasyon Ekle</h4>
                    <button type="button" id="kapa" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <label class="form-group-item">Lokasyon Adı*</label>
                            <asp:TextBox class="form-control" ClientId="clientISADI" ID="txtLOKASYON_AD" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-group-item">Şehir</label>
                            <asp:DropDownList CssClass="form-control" ID="ddlSehir" runat="server">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ddlSehir" runat="server" ErrorMessage="Bu Alan Zorunludur"></asp:RequiredFieldValidator>
                        </div>

                    </div>
                    <hr />
                    <label class="form-group-item">Açıklama</label>
                    <asp:TextBox class="form-control" TextMode="MultiLine" ClientId="clientISADI" ID="txtAciklama" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtLOKASYON_AD" runat="server" ErrorMessage="Bu Alan Zorunludur"></asp:RequiredFieldValidator>
                    <hr />
                    <div class="col-sm-2 imgUp">
                        <label class="form-group-item">Kroki</label>
                        <div class="imagePreview"></div>
                        <label style="width: 180px" class="btn btn-primary">
                            <asp:FileUpload ID="imgKroki" runat="server" CssClass="uploadFile img" value="Upload Photo" Style="width: 0px; height: 0px; overflow: hidden;" />
                            Kroki Yükle 
                        </label>

                        <!-- container -->
                    </div>
                </div>
                <div class="modal-footer">

                    <button type="button" id="btn_Vazgec" class="btn btn-secondary" data-dismiss="modal">Vazgeç</button>
                    <asp:Button ID="btnLokasyonSave" CausesValidation="false" CssClass="btn btn-success" OnClick="btnLokasyonSave_Click" runat="server" Text="Kaydet" />

                </div>
            </div>
        </div>
    </div>


    <script>
        $("#btn_Vazgec").click(function () {

            window.location.href = "https://localhost:44398/LOKASYON";

        })
        $("#kapa").click(function () {

            window.location.href = "https://localhost:44398/LOKASYON";

        })
        $("#deneme").click(function () {
            console.log("geldi");
            $("#a").hide();


        })





        function fnConfirmDelete() {
            return confirm("Lokasyonu silmek üzeresiniz. Onaylıyor musunuz?");
        }



    </script>


</asp:Content>

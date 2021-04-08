<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BirimTanim.aspx.cs" Inherits="serkanISG.BirimTanim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    <script src="Scripts/MyFunctions.js"></script>
    <link href="Content/MyCSS.css" rel="stylesheet" />
    <div class="pd-ltr-20 xs-pd-20-10" style="margin-left: 10%; width: 1230px;">
        <div class="min-height-200px">

            <!-- Simple Datatable start -->
            <div class="card-box mb-190">
                <div class="pd-20" style="margin-top: 100px">
                    <h4 class="text-blue h4 text-center">BİRİM TANIM LİSTESİ</h4>
                </div>
            </div>
            <br />
            <ul>
                <li>
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myyModal">Yeni Birim Tanımla</button>
                </li>
            </ul>
            <br />
            <div style="width: 100%; height: 400px; overflow: scroll">
                <asp:GridView ID="grdBIRIM" CssClass="data-table table stripe hover nowrap" AutoGenerateColumns="False" GridLines="None" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="Düzen">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" CssClass="btn btn-warning" ID="btn_edit_link" CausesValidation="false" CommandName="Select" CommandArgument='<%# Eval("ID_BIRIM") %>' OnClick="btn_edit_link_Click">Düzenle</asp:LinkButton>
                                <asp:LinkButton runat="server" CssClass="btn btn-danger" ID="btn_sil" OnClientClick="return fnConfirmDelete();" CausesValidation="false" CommandArgument='<%# Eval("ID_BIRIM") %>' OnClick="btn_sil_Click">Sil</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID_BIRIM" HeaderText="BİRİM ID'si" />
                        <asp:BoundField DataField="AD_BIRIM" HeaderText="BİRİM ADI" />
                    </Columns>
                </asp:GridView>
            </div>
             <!-- Modal düzenle -->
            <div id="myModal" class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Birim Tanım Düzen Ekranı</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Label2" CssClass=" col-form-label-lg" runat="server" Text="Birim Kodu:" />
                            &nbsp; 
                            <asp:Label ID="lblBirimEditID" CssClass=" col-form-label-lg" runat="server" Text="Label" />
                            <br />
                            <hr />

                            <asp:Label ID="Label1" CssClass=" col-form-label-lg" runat="server" Text="Birim Adı:">
                
                            </asp:Label><asp:TextBox CssClass="form-control" ID="txtBirimAdi_edit" runat="server"></asp:TextBox><br />
                        </div>
                        <div class="modal-footer">

                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
                            <asp:Button ID="edit_Kaydet" CausesValidation="False" CssClass=" btn btn-success"  onclick="edit_Kaydet_Click" Text="Güncelle" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
      
    </div>


    <!-- Modal Ekle -->
    <div class="modal fade" id="myyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">İş tanımı ekle</h4>
                    <button type="button" id="kapa" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                </div>
                <div class="modal-body">
                    <label class="form-group-item">Birim Adı*</label>
                    <asp:TextBox class="form-control" ClientId="clientISADI" ID="txtBirimAd" runat="server"></asp:TextBox>       
                    <asp:RequiredFieldValidator ID="ss" ForeColor="red" ControlToValidate="txtBirimAd" runat="server" ErrorMessage="Bu Alan Zorunludur*"></asp:RequiredFieldValidator>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_Vazgec" class="btn btn-secondary" data-dismiss="modal">Vazgeç</button>
                    <asp:Button ID="btnEKLE"  CausesValidation="true" CssClass="btn btn-primary" OnClick="btnEKLE_Click" margin-top="4px;" runat="server" Text="Ekle" />
                </div>
            </div>
        </div>
    </div>
    <div id="snackbar" style="width: 20%; overflow: visible; margin-left: 60%; position: relative; min-height: 40%;">Kayıt Eklendi</div>


    <script>
        $("#btn_Vazgec").click(function () {

            window.location.href = "https://localhost:44398/BirimTanim";

        })
        $("#kapa").click(function () {

            window.location.href = "https://localhost:44398/BirimTanim";

        })


        function fnConfirmDelete() {
            return confirm("İş Tanımını silmek üzeresiniz. Onaylıyor musunuz?");
        }

     

    </script>

</asp:Content>

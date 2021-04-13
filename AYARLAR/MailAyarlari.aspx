<%@ Page Title="" Language="C#" MasterPageFile="../Site.Master" AutoEventWireup="true" CodeBehind="MailAyarlari.aspx.cs" Inherits="serkanISG.AYARLAR.MailAyarlari" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    <link href="../Content/MyCSS.css" rel="stylesheet" />
    <script src="../Scripts/MyFunctions.js"></script>


    <div class="pd-ltr-20 xs-pd-20-10" style="margin-left: 10%; width: 1230px;">
        <div class="min-height-200px">

            <div class="card-box mb-190">
                <div class="pd-20" style="margin-top: 100px">
                    <h4 class="text-blue h4 text-center">Mail Ayarları
                    </h4>
                </div>
            </div>
             
            <div class="card">
                <div style="background-color: aquamarine" class="card-header">
                </div>
                <div class="card-body">
                    <asp:GridView ID="grdMODULS" CssClass="data-table table stripe hover nowrap" AutoGenerateColumns="False" GridLines="None" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="Düzen">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" CssClass="btn btn-warning" ID="btn_edit_link" CausesValidation="false" CommandName="Select" OnClick="btn_edit_link_Click" CommandArgument='<%# Eval("ID_MODUL") %>'>Düzenle</asp:LinkButton>

                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:BoundField DataField="AD_MODUL" HeaderText="MODÜL ADI" />
                              <asp:BoundField DataField="YENI_KAYIT" HeaderText="KAYIT EKLEME" />
                              <asp:BoundField DataField="GUNCELLEME_KAYIT" HeaderText="KAYIT GÜNCELLEME" />
                              <asp:BoundField DataField="SILME_KAYIT" HeaderText="KAYIT SİLME" />
                            <asp:BoundField  DataField="ID_MODUL" HeaderText="MODÜL KODU" />
                          
                        </Columns>
                    </asp:GridView>
                    <div class="modal fade" id="myyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" id="myModalLabel">Mail Ayarları</h4>
                                    <button type="button" id="kapa" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                                </div>
                                <div class="modal-body">
                                      <div class="row">
                                        <div class="col-md-3">
                                            <label class=" form-group-item">Modül Adı:</label>         
                                        </div>
                                          <div class="col-md-6">
                                              <asp:Label Text="text" ID="lblModulID" runat="server" />
                                          </div>
                                       
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-md-8">
                                            <label class=" form-group-item">Yeni kayıt işleminde mail gönderilsin mi?</label>
                                        </div>
                                        <div class="col-md-4">
                                          <asp:CheckBox ID="ckbCreate" CssClass="form-group-item" runat="server" />
                                        </div>
                                    </div>
                                    <hr />
                                     <div class="row">
                                        <div class="col-md-8">
                                            <label class="form-group-item">Güncelleme işleminde mail gönderilsin mi?</label>
                                        </div>
                                        <div class="col-md-4">
                                          <asp:CheckBox ID="ckbUpdate" CssClass=" custom-checkbox" runat="server" />
                                        </div>
                                    </div>
                                    <hr />
                                     <div class="row">
                                        <div class="col-md-8">
                                            <label class="form-group-item">Kayıt silme işleminde mail gönderilsin mi?</label>
                                        </div>
                                        <div class="col-md-4">
                                          <asp:CheckBox ID="ckbDelete" CssClass=" custom-checkbox" runat="server" />
                                        </div>
                                    </div>


                                </div>
                                <div class="modal-footer">
                                    <button type="button" id="btn_Vazgec" class="btn btn-secondary" data-dismiss="modal">Vazgeç</button>
                                    <asp:Button ID="btnUPdate" OnClick="btnUPdate_Click" CausesValidation="true" CssClass=" btn btn-success" margin-top="4px;" runat="server" Text="Güncelle" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            
        </div>
         
    </div>
    <div id="snackbar" style="width: 30%; overflow: visible; margin-left: 45%; margin-top:5%; position: relative; min-height: 50%;">Kayıt Eklendi</div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />                             
    <script>    




</script>





</asp:Content>

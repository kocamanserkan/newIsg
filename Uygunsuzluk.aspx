<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" CodePage="28599" Debug="true" AutoEventWireup="true" CodeBehind="Uygunsuzluk.aspx.cs" Inherits="serkanISG.Uygunsuzluk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>


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

    

        <div class="pd-ltr-20 xs-pd-20-10" style="margin-left: 10%; width: 1230px;">

            <div class="min-height-200px">

                <!-- Simple Datatable start -->
                <div class="card-box mb-190">
                    <div class="pd-20" style="margin-top: 100px">
                        <h4 style="text-align:center">Uygunsuzluk Listesi</h4>
                        <hr />
                  </div>
                    <div class="row">
                        <div class="col-md-2">
                            <button class="btn btn-primary" style="margin-left:30px" data-toggle="modal" data-target="#bd-example-modal-lg" type="button">Uygunsuzluk Ekle</button>
                        </div>
                        <div class="col-md-6">
                            
                        </div>
                        <div class=" align-right col-md-2">

                             
                            <asp:DropDownList ID="ddlAktiflik" AutoPostBack="true" OnSelectedIndexChanged="ddlAktiflik_SelectedIndexChanged"  CssClass="form-control" style="margin-left:100px; width:200px;" runat="server">
                         
                        <asp:ListItem Selected hidden Text="Listeleme Durumu" />
                        <asp:ListItem Text="Aktif" />
                        <asp:ListItem Text="Pasif" />
                    </asp:DropDownList>
                        </div>
                    </div>
                        
         
                    <br />
                        <div class="modal fade bs-example-modal-lg" id="bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="myLargeModalLabel">Uygunsuzluk Giriş Formu</h4>
                                        <button type="button" onclick="baseUrl();" class="close" data-dismiss="modal" aria-hidden="true">×</button>
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
                                                <asp:DropDownList ID="ddlBirim" AppendDataBoundItems="true" CssClass="form-control" runat="server">
                                                    <asp:ListItem Text="Seçiniz" />
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-12 col-md-2 col-form-label">Tespit Tarihi</label>
                                            <div class="col-sm-12 col-md-10">
                                                <asp:TextBox ID="dtpTespitTarih" clasS="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                           <%--     <asp:RangeValidator
                                                    runat="server"
                                                    ID="timeValidator"
                                                    Type="Date"
                                                    ControlToValidate="dtpTespitTarih"
                                                    MaximumValue="2021/02/27"
                                                    Style="color: red; font-size: 14px"
                                                    MinimumValue="1000/12/28"
                                                    ErrorMessage="Uygunsuzluk tespit tarihi bugünden sonra olamaz." />--%>

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
                                                <asp:DropDownList ID="ddlTespitEden" EnableViewState="true" AppendDataBoundItems="true" CssClass="form-control" runat="server">
                                                    <asp:ListItem Text="SEÇİNİZ" />
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-12 col-md-2 col-form-label">Sorumlu</label>
                                            <div class="col-sm-12 col-md-10">
                                                <asp:DropDownList ID="ddlSorumlu" AppendDataBoundItems="true" EnableViewState="true" CssClass="form-control" runat="server">
                                                  <asp:ListItem Text="SEÇİNİZ" />
                                                    </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-12 col-md-2 col-form-label">Önerilen Termin Tarihi</label>
                                            <div class="col-sm-12 col-md-10">
                                                <asp:TextBox ID="dateTerminTarihi" class="form-control" TextMode="Date" placeholder="" runat="server"></asp:TextBox>
                                               <%-- <asp:RangeValidator
                                                    runat="server"
                                                    ID="val_termintarih"
                                                    Type="date"
                                                    ControlToValidate="datetermintarihi"
                                                    MaximumValue="2060/02/27"
                                                    Style="color: red; font-size: 14px"
                                                    MinimumValue="2021/04/17"
                                                    ErrorMessage=" önerilen termin tarihi bugünden sonra olamaz." />--%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" onclick="baseUrl();" class="btn btn-secondary" data-dismiss="modal">Vazgeç</button>
                                        <asp:Button ID="btnUygunsuzlukSave"  OnClick="btnUygunsuzlukSave_Click" class="btn btn-success" runat="server" Text="Uygunsuzluk Ekle" />
                                    </div>
                                </div>
                            </div>
                        </div>


                      
                   

                    <%--GridView--%>
                           <asp:GridView ID="grdUygunsuz" CssClass="data-table table stripe hover nowrap" AutoGenerateColumns="False" GridLines="None" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="Düzen">
                            <ItemTemplate>
                                
                                <asp:LinkButton runat="server" CssClass="btn btn-warning" ID="link" CausesValidation="false" OnClick="link_Click" Text="<i class='icon-copy fi-pencil'></i>" ToolTip="Düzenle"  CommandName="Select" CommandArgument='<%# Eval("ID_UYGUNSUZLUK") %>'></asp:LinkButton>
                                <div class="as">
                                <asp:LinkButton runat="server" ClientIDMode="Inherit"  OnClick="btn_sil_Click"   Style="margin-left:53px; margin-top: -62px;" ToolTip="Sil"  CssClass="btn btn-danger" ID="btn_sil"  OnClientClick="return fnConfirmDelete();" CausesValidation="false"  Text="<i class='fa fa-trash-o' aria-hidden='true'></i>" CommandArgument='<%# Eval("ID_UYGUNSUZLUK") %>'></asp:LinkButton>
                                    </div>

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID_UYGUNSUZLUK" HeaderText="Uygunsuzluk Kodu" />
                        <asp:BoundField DataField="TUR" HeaderText="Türü" />
                        <asp:BoundField DataField="UYGUNSUZ_DURUM" HeaderText="Uygunsuz Durum" />
                         <asp:BoundField DataField="ONERI_AKSIYON" HeaderText="Önerilen Aksiyon" />
                        <asp:BoundField DataField="TESPIT_TARIH" HeaderText="Tespit Tarihi" />
                          <asp:BoundField DataField="TERMIN_TARIH" HeaderText="Termin Tarihi" />
                        <asp:BoundField DataField="SORUMLU_AD" HeaderText="Sorumlu Adı" />
                         <asp:BoundField DataField="BIRIM" HeaderText="Birim" />
                         <asp:BoundField DataField="TESPIT_EDEN_AD" HeaderText="Tespit Eden Ad" />
                         <asp:BoundField DataField="AKTIFLIK" HeaderText="Durum" />
                      
                       
                    </Columns>
                </asp:GridView>


                </div>
            </div>
           
        </div>
     
    <div id="snackbar" style="width: 20%; overflow: visible; margin-left: 45%; margin-top: 250px; position: relative; min-height: 30px;">Kayıt Eklendi</div>
    </div>
    <%--MOdalllllllllllll--%>
    
   
    <div class="modal fade bs-example-modal-lg" id="edit_Modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myLargeModalLabela">Uygunsuzluk Güncellleme Ekranı</h4>
                    <button type="button" onclick="baseUrl();" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Uygunsuzluk Kodu</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:Label ID="label_ID" runat="server" Text="Uygunsuzluk Kodu"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Uygunsuzluk Türü</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:DropDownList ID="ddlTur_edit" CssClass="form-control" runat="server">
                                <asp:ListItem>Minör</asp:ListItem>
                                <asp:ListItem>Majör</asp:ListItem>
                                <asp:ListItem>Hayati</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Durum</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:DropDownList ID="ddlDurum_Edit" CssClass="form-control" runat="server">
                                <asp:ListItem>Aktif</asp:ListItem>
                                <asp:ListItem>Pasif</asp:ListItem>

                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Birim</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:DropDownList ID="ddlBirim_edit" CssClass="form-control" runat="server">                 
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Tespit Tarihi</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:TextBox ID="dtpTespitTarih_Edit" clasS="form-control" TextMode="Date" runat="server"></asp:TextBox>
                           
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Uygunsuz Durumu</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:TextBox ID="txtUygnsuzDurum_Edit" class="form-control" TextMode="MultiLine" placeholder="Uygunsuz durumu açıklayınız." runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Önerilen Aksiyon</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:TextBox ID="txtAksiyon_Edit" class="form-control" TextMode="MultiLine" placeholder="Uygunsuz duruma karşı alınabilecek aksiyon önerileri.." runat="server"></asp:TextBox>
                           
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Tespit Eden</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:DropDownList ID="ddlTespiteden_edit" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Sorumlu</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:DropDownList ID="ddlSorumlu_edit" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Önerilen Termin Tarihi</label>
                        <div class="col-sm-12 col-md-10">
                            <asp:TextBox ID="dtpTerminTarih_edit" class="form-control" TextMode="Date" runat="server"></asp:TextBox>
                           
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" onclick="baseUrl();" class="btn btn-secondary" data-dismiss="modal">Vazgeç</button>
                    <asp:Button ID="Guncelle" class="btn btn-success" OnClick="Guncelle_Click" runat="server" Text="Güncelle" />
                  
                </div>
            </div>
        </div>

    </div>
  

    <script>
        function baseUrl() {

            window.location.href = "https://localhost:44398/Uygunsuzluk";
        }
        function fnConfirmDelete() {
            return confirm("Uygunsuzluk Kaydını silmek üzeresiniz. Onaylıyor musunuz?");
        }
     

        if ($('#<%= ddlAktiflik.ClientID %>').val() == "Pasif") {
            $(".as").css("display", "none");

        }


    </script>
      <script>

          var isChanged = false;
          $(function () {
              $('#ddlAktiflik').focusin(function () {
                  if (!isChanged) {
                      // this removes the first item which is your placeholder if it is never changed
                      $(this).find('option:first').remove();
                  }
              });
              $('#ddlAktiflik').change(function () {
                  // this marks the selection to have changed
                  isChanged = true;
              });
              $('#ddlAktiflik').focusout(function () {
                  if (!isChanged) {
                      // if the control loses focus and there is no change in selection, return the first item
                      $(this).prepend('<option selected="selected" value="0">Listeleme Durumu</option>');
                  }
              });
          });
      </script>





</asp:Content>

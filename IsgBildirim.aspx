<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IsgBildirim.aspx.cs" Inherits="serkanISG.IsgBildirim" %>
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
                    <h4 class="text-blue h4 text-center">İŞ TANIM LİSTESİ</h4>
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
                <asp:GridView ID="grdBildirim" CssClass="data-table table stripe hover nowrap" AutoGenerateColumns="False" GridLines="None" runat="server">

                    <Columns>

                        <asp:TemplateField HeaderText="Düzen">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" CssClass="btn btn-warning" ID="link" CausesValidation="false" CommandName="Select" CommandArgument='<%# Eval("ID_BILDIRIM") %>' OnClick="link_Click">Düzenle</asp:LinkButton>
                                <asp:LinkButton runat="server" CssClass="btn btn-danger" ID="btn_sil" OnClientClick="return fnConfirmDelete();" CausesValidation="false" CommandArgument='<%# Eval("ID_BILDIRIM") %>' OnClick="btn_sil_Click">Sil</asp:LinkButton>

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID_BILDIRIM" HeaderText="BBİLDİRİM KODU" />
                        <asp:BoundField DataField="TarihSaat" HeaderText="TARİH ve SAAT" />
                        <asp:BoundField DataField="PERSONEL_AD" HeaderText="PERSONEL ADI" />
                        <asp:BoundField DataField="KATEGORI" HeaderText="KATEGORİ" />
                        <asp:BoundField DataField="ACIKLAMA" HeaderText="AÇIKLAMA" />
                        <asp:BoundField DataField="ONLEMBOOL" HeaderText="ÖNLEM GEREKSİNİMİ" />
                        <asp:BoundField DataField="LOKASYON" HeaderText="LOKASYON" />
                        <asp:BoundField DataField="BIRIM" HeaderText="BİRİM" />
                        <asp:BoundField DataField="DURUM" HeaderText="DURUM" />
                 
                    </Columns>

                </asp:GridView>
            </div>
            <div id="myModal" class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Bildirim Güncelleme Ekranı</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <asp:TextBox ID="TextBox1" style="display:none" runat="server"></asp:TextBox>
                                <div class="col-md-6">
                                    <label class="form-group-item">Lokasyon Adı*</label>
                                    <asp:TextBox class="form-control" ClientId="clientISADI" ID="TextBox2" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtLokasyonAd_Edit" runat="server" ErrorMessage="Bu Alan Zorunludur"></asp:RequiredFieldValidator>


                                </div>
                                <div class="col-md-6">
                                    <label class="form-group-item">Şehir</label>
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="ddlSehir_Edit" runat="server" ErrorMessage="Bu Alan Zorunludur"></asp:RequiredFieldValidator>
                                </div>

                            </div>
                            <hr />
                            <label class="form-group-item">Açıklama</label>
                            <asp:TextBox class="form-control" TextMode="MultiLine" ClientId="clientISADI" ID="TextBox3" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="txt_Aciklama_Edit" runat="server" ErrorMessage="Bu Alan Zorunludur"></asp:RequiredFieldValidator>
                            <hr />
                            <%--<div class="mb-3">
                        <label for="formFile" class="form-label">Kroki</label>
                        <input class="form-control" type="file" id="formFile">
                    </div>--%>
                            <label class="form-group-item">Kroki</label>
                            <div style="margin-left: 101px;" class="col-sm-4 imgUp">
                                
                                <div class="imagePreview">
                                    <div style="height:100%" id ="a">
                                          <asp:Image ID="Image1" Width="100%" Height="100%" runat="server" />
                                    </div>
                                    
                                </div>
                                <label style="width:180px" id="deneme" class="btn btn-primary">
                                    <asp:FileUpload ID="FileUpload1"  runat="server" CssClass="uploadFile img" value="Upload Photo" Style="width: 0px; height: 0px; overflow: hidden;" />
                                    Kroki Güncelle <%--<input type="file" class="uploadFile img" value="Upload Photo" style="width: 0px; height: 0px; overflow: hidden;">--%>
                                </label>
                           
                                <!-- container -->
                            </div>



                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
                            <asp:Button Text="Güncelle" CausesValidation="false" OnClientClick="fnConfirmUpdate();" ID="Button1" class="btn btn-success" style="margin-top: 4px;" OnClick="edit_Kaydet_Click" runat="server" />
                            <%--    <button type="button" id="deneme" onclick="serkan();" class="btn btn-primary">Save changes</button>--%>
                            <%--<asp:Button Text="Kaydet" ID="btnEditSave" OnClick="btnEditSave_Click"   CssClass="btn btn-primary" runat="server" />--%>
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
                    <h4 class="modal-title" id="myModalLabel">Bildirim Ekle</h4>
                    <button type="button" id="kapa" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-3">
                            <label class="form-group-item">Tarih ve Saat</label>
                            <asp:TextBox class="form-control datepicker" TextMode="date"  ID="dtpTarih" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="dateTarih" runat="server" ErrorMessage="Bu Alan Zorunludur"></asp:RequiredFieldValidator>
                        </div>
                         <div class="col-md-3">
                            <label class="form-group-item">Tarih ve Saat</label>
                            <asp:TextBox class="form-control datepicker" TextMode="date"  ID="dtpSaat" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="dtpSaat" runat="server" ErrorMessage="Bu Alan Zorunludur"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-6">
                            <label class="form-group-item">Vardiya</label>
                            <asp:DropDownList runat="server">
                                <asp:ListItem Text="text1" />
                                <asp:ListItem Text="text2" />
                            </asp:DropDownList>
                            < class="form-control datepicker" TextMode="date"  ID="ddlVardiya" runat="server"></>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="dtpSaat" runat="server" ErrorMessage="Bu Alan Zorunludur"></asp:RequiredFieldValidator>
                        </div>
                       
                    </div>
                    <hr />
                    <label class="form-group-item">Açıklama</label>
                    <asp:TextBox class="form-control" TextMode="MultiLine" ClientId="clientISADI" ID="TextBox5" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="txtLOKASYON_AD" runat="server" ErrorMessage="Bu Alan Zorunludur"></asp:RequiredFieldValidator>
                    <hr />
                


                    <div class="col-sm-2 imgUp">
                        <label class="form-group-item">Kroki</label>
                        <div class="imagePreview"></div>
                        <label style="width: 180px" class="btn btn-primary">
                            <asp:FileUpload ID="FileUpload2" runat="server" CssClass="uploadFile img" value="Upload Photo" Style="width: 0px; height: 0px; overflow: hidden;" />
                            Kroki Yükle <%--<input type="file" class="uploadFile img" value="Upload Photo" style="width: 0px; height: 0px; overflow: hidden;">--%>
                        </label>

                        <!-- container -->
                    </div>
                </div>
                <div class="modal-footer">

                    <button type="button" id="btn_Vazgec" class="btn btn-secondary" data-dismiss="modal">Vazgeç</button>
                    <asp:Button ID="Button2" CausesValidation="false" CssClass="btn btn-success" OnClick="btnLokasyonSave_Click" runat="server" Text="Kaydet" />

                </div>
            </div>
        </div>
    </div>
    <%-- <script language="javascript" type="text/javascript">
           
        </script>--%>


    <script>
        $("#btn_Vazgec").click(function () {

            window.location.href = "https://localhost:44398/IsgBildirim";

        })
        $("#kapa").click(function () {

            window.location.href = "https://localhost:44398/IsgBildirim";

        })
        $("#deneme").click(function () {
            console.log("geldi");
            $("#a").hide();


        })









        function fnConfirmDelete() {
            return confirm("Lokasyonu silmek üzeresiniz. Onaylıyor musunuz?");
        }

        //function fnConfirmUpdate() {
        //    return confirm("İş Tanımını güncellemek üzeresiniz. Onaylıyor musunuz?");
        //}






    </script>
















</asp:Content>

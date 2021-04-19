<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IsgBildirim.aspx.cs" Inherits="serkanISG.IsgBildirim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script src="Scripts/MyFunctions.js"></script>
    <link href="Content/MyCSS.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>



    <style>
        body {
            background-color: #f5f5f5;
        }

        .imagePreview {
            width: 100%;
            height: 180px;
            background-position: center center;
            background: url(http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg);
            background-color: #fff;
            background-size: cover;
            background-repeat: no-repeat;
            display: inline-block;
            box-shadow: 0px -3px 6px 2px rgba(0,0,0,0.2);
        }

        .btn-primary {
            display: block;
            border-radius: 0px;
            box-shadow: 0px 4px 6px 2px rgba(0,0,0,0.2);
            margin-top: -5px;
        }

        .imgUp {
            margin-bottom: 15px;
        }

        .del {
            position: absolute;
            top: 0px;
            right: 15px;
            width: 30px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            background-color: rgba(255,255,255,0.6);
            cursor: pointer;
        }

        .imgAdd {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background-color: #4bd7ef;
            color: #fff;
            box-shadow: 0px 0px 2px 1px rgba(0,0,0,0.2);
            text-align: center;
            line-height: 30px;
            margin-top: 0px;
            cursor: pointer;
            font-size: 15px;
        }
    </style>
    <div class="pd-ltr-20 xs-pd-20-10" style="margin-left: 10%; width: 1230px;">

        <div class="min-height-200px">

            <!-- Simple Datatable start -->
            <div class="card-box mb-190">
                <div class="pd-20" style="margin-top: 100px">
                    <h4 class="text-blue h4 text-center">Seviye-1 İsg Bildirim Listesi</h4>
                </div>
            </div>
            <br />
            <ul>
                <li  style="float:left;">

                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myyModal">Bildirim Ekle</button>
                                    
                </li>
                <li style="float:left;" >
                    <asp:DropDownList ID="ddlAktiflik" AutoPostBack="true"  OnSelectedIndexChanged="ddlAktiflik_SelectedIndexChanged"  CssClass="form-control" style="width:200px; margin-left: 840px;" runat="server">
                         
                        <asp:ListItem Selected hidden Text="Listeleme Durumu" />
                        <asp:ListItem Text="Aktif" />
                        <asp:ListItem Text="Pasif" />
                    </asp:DropDownList>
                </li>
            </ul>
            <br />
            <%--  GRIDVIEW--%>
            <div style="width: 100%; height: 480px; overflow: scroll">
                <asp:GridView ID="grdBILDIRIM" CssClass="data-table table stripe hover nowrap" AutoGenerateColumns="False" GridLines="None" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="Düzen">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" CssClass="btn btn-warning" ID="btn_edit_link" CausesValidation="false" Text="<i class='icon-copy fi-pencil'></i>" CommandName="Select" CommandArgument='<%# Eval("ID_BILDIRIM") %>' OnClick="btn_edit_link_Click"></asp:LinkButton>
                                <asp:LinkButton runat="server" CssClass="btn btn-danger" Style="margin-left: 50px; margin-top: -64px;" ID="btn_sil" OnClientClick="return fnConfirmDelete();"  Text="<i class='fa fa-trash-o' aria-hidden='true'></i>" CausesValidation="false" CommandArgument='<%# Eval("ID_BILDIRIM") %>' OnClick="btn_sil_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID_BILDIRIM" HeaderText="Bildirim Kodu" />
                        <asp:BoundField DataField="TARIHSAAT" HeaderText="Tarih ve Saat" />
                        <asp:BoundField DataField="MUDAHIL_PERSONEL" HeaderText="Personel Adı" />
                        <asp:BoundField DataField="KATEGORI" HeaderText="Kategori" />
                        <asp:BoundField DataField="ACIKLAMA" HeaderText="Açıklama" />
                        <asp:BoundField DataField="ONLEMBOOL" HeaderText="Önlem Gereksinimi" />
                        <asp:BoundField DataField="BILDIRIM_DURUM" HeaderText="Bildirim Durumu" />
                        <asp:BoundField DataField="BIRIM" HeaderText="Birim" />
                        <asp:BoundField DataField="LOKASYON" HeaderText="Lokasyon" />
                        <asp:BoundField DataField="DURUM" HeaderText="Durumu" />
                        <asp:BoundField DataField="PERSONEL_AD" HeaderText="Oluşturan" />
                        <asp:BoundField DataField="DURUM" HeaderText="Aktiflik" />
                    </Columns>
                </asp:GridView>
            </div>
            <!-- Modal düzenle -->
            <div id="myModal" class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Bildirim Düzen Ekranı</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <%--ASda--%>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div style="background-color: aquamarine" class="card-header">
                                            Bildirim Bilgileri
                                        </div>
                                        <div class="card-body">

                                            <div class="row">
                                                <div class="col-md-6">
                                                    <asp:Label ID="Label1" CssClass=" col-form-label-lg" runat="server" Text="Tarih ve Saat" />
                                                    <asp:TextBox ID="txtTarih_Edit" runat="server" CssClass="form-control" Width="200px" TextMode="date" />
                                                    <asp:TextBox ID="txtSaat_Edit" runat="server" CssClass="form-control" Width="200px" TextMode="time" />
                                                </div>
                                                <div class="col-md-6">
                                                    <asp:Label ID="Label2" CssClass=" col-form-label-lg" runat="server" Text="Vardiya" />
                                                    <asp:DropDownList ID="ddlVardiya_Edit" CssClass="form-control" runat="server"></asp:DropDownList>
                                                    <br />
                                                    <asp:Label ID="IDsecret" Enabled="false"  style="display:block" CssClass="form-control"  runat="server" />
                                                </div>
                                            </div>
                                            <hr />
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <asp:Label ID="Label12" CssClass=" col-form-label-lg" runat="server" Text="Bildirim Yapan" />
                                                    <asp:DropDownList ID="ddlBildirimYapan_Edit" CssClass="form-control" runat="server"></asp:DropDownList>
                                                </div>
                                                <div class="col-md-6">
                                                    <asp:Label ID="Label13" CssClass=" col-form-label-lg" runat="server" Text="Birim" />
                                                    <asp:DropDownList ID="ddlBirim_Edit" CssClass="form-control" runat="server"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <asp:Label ID="Label14" CssClass=" col-form-label-lg" runat="server" Text="Kategori" />
                                                    <asp:DropDownList ID="ddlKategori_Edit" CssClass="form-control" runat="server"></asp:DropDownList>
                                                </div>
                                                <div class="col-md-6">
                                                    <asp:Label ID="Label15" CssClass=" col-form-label-lg" runat="server" Text="Lokasyon" />
                                                    <asp:DropDownList ID="ddl_Lokasyon_Edit" CssClass="form-control" runat="server"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <hr />
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <asp:Label ID="Label16" CssClass=" col-form-label-lg" runat="server" Text="Önlem Gereksinimi" />
                                                    <asp:DropDownList ID="ddlOnlemBool_edit" CssClass=" form-control" runat="server">
                                                        <asp:ListItem Text="Hayır" />
                                                        <asp:ListItem Text="Evet" />
                                                    </asp:DropDownList>
                                                </div>
                                                   <div class="col-md-6">
                                                    <asp:Label ID="Label21" CssClass=" col-form-label-lg" runat="server" Text="Durum" />
                                                    <asp:DropDownList ID="ddlDurumEdit" CssClass=" form-control" runat="server">
                                                        <asp:ListItem Text="Aktif" />
                                                        <asp:ListItem Text="Pasif" />
                                                    </asp:DropDownList>
                                                </div>

                                            </div>
                                            <hr />
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:Label ID="ss" CssClass=" col-form-label-lg" runat="server" Text="Bildirim Metni" />
                                                    <asp:TextBox ID="txtBildirimMetin_Edit" Height="90px" placeholder="Açıklamanızı bu alana giriniz.." CssClass=" form-control" TextMode="multiline" runat="server" />
                                                </div>

                                            </div>
                                            <br />
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:Label ID="Label18" CssClass="col-form-label-lg" runat="server" Text="Önerilen Aksiyon" />
                                                    <asp:TextBox ID="txtAksiyon_Edit" placeholder="Varsa aksiyon önerinizi bu alana giriniz..." Height="90px" CssClass=" form-control" TextMode="multiline" runat="server" />
                                                </div>
                                            </div>
                                            <hr />
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="card">
                                                        <div style="background-color: aquamarine" class="card-header">
                                                            Görsel İçerik
                                                        </div>
                                                        <div class="card-body">
                                                            <br>
                                                            <div style="margin-left: 101px;" class="col-sm-4 imgUp">

                                                                <div class="imagePreview">
                                                                    <div style="height: 100%" id="photoEdit">
                                                                        <asp:Image ID="ass" Width="100%" Height="100%" runat="server" />
                                                                    </div>

                                                                </div>
                                                                <label style="width: 180px" id="deneme" class="btn btn-primary">
                                                                    <asp:FileUpload ID="imgEdit" runat="server" CssClass="uploadFile img" value="Upload Photo" Style="width: 0px; height: 0px; overflow: hidden;" />
                                                                    Görsek İçeriği Güncelle
                                                                </label>

                                                                <!-- container -->
                                                            </div>
                                                            <!-- container -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr />
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="card">
                                                        <div style="background-color: aquamarine" class="card-header">
                                                            Müdahil Personel
                                                        </div>
                                                        <div class="card-body">

                                                            <asp:DropDownList CssClass=" form-control" ID="ddlMudahilPersonel_edit" runat="server">
                                                            </asp:DropDownList>
                                                            <br />

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">

                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
                            <asp:Button ID="edit_Kaydet" OnClick="edit_Kaydet_Click" CausesValidation="False" CssClass=" btn btn-success" Text="Güncelle" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>





        <!-- Modal Ekle -->
        <div class="modal fade" id="myyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div style="background-color: #0056b3; color: aliceblue" class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Bildirim Kayıt Ekranı</h4>
                        <button type="button" id="kapa" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div style="background-color: aquamarine" class="card-header">
                                        Bildirim Bilgileri
                                    </div>
                                    <div class="card-body">

                                        <div class="row">
                                            <div class="col-md-6">
                                                <asp:Label ID="Label3" CssClass=" col-form-label-lg" runat="server" Text="Tarih ve Saat" />
                                                <asp:TextBox ID="txtTarih" runat="server" CssClass="form-control" Width="200px" TextMode="date" />
                                                <asp:TextBox ID="txtSaat" runat="server" CssClass="form-control" Width="200px" TextMode="time" />
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Label ID="Label4"  CssClass=" col-form-label-lg" runat="server" Text="Vardiya" />
                                                <asp:DropDownList ID="ddlVardiya" AppendDataBoundItems="true" CssClass="form-control" runat="server">
                                                    <asp:ListItem Text="Seçiniz" />
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="row">
                                            <div class="col-md-6">
                                                <asp:Label ID="Label5" CssClass=" col-form-label-lg" runat="server" Text="Bildirim Yapan" />
                                                <asp:DropDownList ID="ddlBildirimYapan" AppendDataBoundItems="true" CssClass="form-control" runat="server">
                                                     <asp:ListItem Text="Seçiniz" />
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Label ID="Label6" CssClass=" col-form-label-lg" runat="server" Text="Birim" />
                                                <asp:DropDownList ID="ddlBirim" AppendDataBoundItems="true" CssClass="form-control" runat="server">
                                                     <asp:ListItem Text="Seçiniz" />
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-6">
                                                <asp:Label ID="Label7" CssClass=" col-form-label-lg" runat="server" Text="Kategori" />
                                                <asp:DropDownList ID="ddlKategori" AppendDataBoundItems="true" CssClass="form-control" runat="server">
                                                     <asp:ListItem Text="Seçiniz" />
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Label ID="Label8" CssClass=" col-form-label-lg" runat="server" Text="Lokasyon" />
                                           
                                                <asp:DropDownList ID="ddlLokasyon" CssClass="form-control" runat="server">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="row">
                                            <div class="col-md-6">
                                                <asp:Label ID="Label9" CssClass=" col-form-label-lg" runat="server" Text="Önlem Gereksinimi" />
                                                <asp:DropDownList ID="ddlOnlemBool" AppendDataBoundItems="true" CssClass=" form-control" runat="server">
                                                     <asp:ListItem Value=-1 Text="Seçiniz" />
                                                    <asp:ListItem Text="Hayır" />
                                                    <asp:ListItem Text="Evet" />
                                                </asp:DropDownList>
                                            </div>

                                        </div>
                                        <hr />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <asp:Label ID="Label10" CssClass=" col-form-label-lg" runat="server" Text="Bildirim Metni" />
                                                <asp:TextBox ID="txtBildirimMetin" Height="90px" placeholder="Açıklamanızı bu alana giriniz.." CssClass=" form-control" TextMode="multiline" runat="server" />
                                            </div>

                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <asp:Label ID="Label11" CssClass="col-form-label-lg" runat="server" Text="Önerilen Aksiyon" />
                                                <asp:TextBox ID="txtAksiyon" placeholder="Varsa aksiyon önerinizi bu alana giriniz..." Height="90px" CssClass=" form-control" TextMode="multiline" runat="server" />
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="card">
                                                    <div style="background-color: aquamarine" class="card-header">
                                                        Görsel İçerik
                                                    </div>
                                                    <div class="card-body">
                                                        <br>
                                                        <div class="container">
                                                            <div class="row">
                                                                <div class="col-sm-2 imgUp">
                                                                    <div class="imagePreview"></div>
                                                                    <label class="btn btn-primary">
                                                                        Yükle
                                                                    <asp:FileUpload ID="imgBildirim" runat="server" CssClass="uploadFile img" value="Upload Photo" Style="width: 0px; height: 0px; overflow: hidden;" />
                                                                    </label>
                                                                </div>
                                                                <i class="fa fa-minus imgAdd"></i>
                                                            </div>
                                                            <!-- row -->
                                                        </div>
                                                        <!-- container -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="card">
                                                    <div style="background-color: aquamarine" class="card-header">
                                                        Müdahil Personel
                                                    </div>
                                                    <div class="card-body">

                                                        <asp:DropDownList Style="display: none" CssClass=" form-control" ID="ddlMudahilPerson" runat="server">
                                                        </asp:DropDownList>
                                                        <br />
                                                        <a href="#" id="a" class="btn btn-danger">Personel Müdahil Et</a>
                                                        <a href="#" id="b" style="display: none" class="btn btn-danger">İptal</a>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="card">
                                                    <div style="background-color: aquamarine" class="card-header">

                                                        <label style="font-size: 18px">Uygunsuzluk</label>
                                                        <%-- <input type="checkbox" class=" custom-checkbox" id="kontrol"  value="" />--%>
                                                        <asp:CheckBox class=" check-mark" ID="kontrol" Text="" runat="server" />
                                                    </div>
                                                    <div class="card-body">

                                                        <div style="display: none" id="UygunsuzlukEkran">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <asp:Label ID="Label17" CssClass="col-form-label-lg" runat="server" Text="Uygunsuz Durum" />
                                                                    <asp:TextBox ID="txtUygunsuzDurum" Height="80px" placeholder="Uygunsuz Durumu Açıklayınız.." onkeyup="countChar(this)" CssClass="form-control" TextMode="Multiline" runat="server"></asp:TextBox>
                                                                    <div style="display: none" id="charNum">10 Karekter Kaldı</div>
                                                                </div>
                                                            </div>
                                                            <br />
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <asp:Label ID="Label19" CssClass="col-form-label-lg" runat="server" Text="Termin Tarihi" />
                                                                    <asp:TextBox ID="txtTerminTarih" CssClass="form-control" TextMode="date" runat="server"></asp:TextBox>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <asp:Label ID="Label20" CssClass="col-form-label-lg" runat="server" Text="Sorumlu Personel" />
                                                                    <asp:DropDownList ID="ddlSorumluPersonel" CssClass="form-control" runat="server">
                                                                        <asp:ListItem Text="Ali" />
                                                                        <asp:ListItem Text="mehmet" />
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <br />
                                                            <br />
                                                            <div class="row">
                                                                <div class="col-md-3">
                                                                    <label id="cancel" class="btn btn-danger">
                                                                        Vazgeç
                                                                   
                                                                    </label>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                  
                        <button type="button" id="btn_Vazgec" class="btn btn-secondary" data-dismiss="modal">Vazgeç</button>
                        <asp:Button ID="btnEKLE" CausesValidation="true" Width="30%" OnClick="btnEKLE_Click" CssClass="btn btn-success" margin-top="4px;" runat="server" Text="Bildir" />
                    </div>
                </div>
            </div>

        </div>
        </div>
        <div id="snackbar" style="width: 20%; overflow: visible; margin-left: 40%; margin-bottom: 10px; position: relative; min-height: 30px;">Kayıt Eklendi</div>
        <script>

            $('#<%= kontrol.ClientID %>').click(function () {



                if ($('#<%= kontrol.ClientID %>')[0].checked == false) {
                $("#UygunsuzlukEkran").hide();
                $('#<%= txtUygunsuzDurum.ClientID %>').val("");
                $('#<%= txtTerminTarih.ClientID %>').val("");
                $('#<%= ddlSorumluPersonel.ClientID %>').val("");
                $('#charNum').val("");
                $('#charNum').hide();
            }
            else {
                $("#UygunsuzlukEkran").show();
            }

            $("#cancel").click(function () {
                $("#UygunsuzlukEkran").hide();
                $('#<%= kontrol.ClientID %>').prop('checked', false);
                $('#<%= txtUygunsuzDurum.ClientID %>').val("");
                $('#<%= txtTerminTarih.ClientID %>').val("");
                $('#charNum').val("");
                $('#charNum').hide();


            });


        });

            function countChar(val) {
                $('#charNum').show();
                var len = val.value.length;
                if (len >= 10000) {
                    val.value = val.value.substring(50, 10000);
                } else {
                    $('#charNum').text(10 - len + " " + "Karekter Kaldı");
                    var a = 10 - len
                    if (a < 0) {

                        $('#charNum').text("Karekter Limiti Aşıldı");
                        $('#charNum').css("color", "red")

                    }
                    else {
                        $('#charNum').css("color", "black")
                    }
                }


            }



            $("#deneme").click(function () {
                console.log("geldi");
                $("#photoEdit").hide();


            })








            $("#btn_Vazgec").click(function () {

                window.location.href = "https://localhost:44398/IsgBildirim";

            })
            $("#kapa").click(function () {

                window.location.href = "https://localhost:44398/IsgBildirim";

            })


            function fnConfirmDelete() {
                return confirm("Bildirimi silmek üzeresiniz. Onaylıyor musunuz?");
            }

            $("#a").click(function () {

                var dll = $('#<%= ddlMudahilPerson.ClientID %>')
            var butonGetir = $("#a");
            var butonCancel = $("#b");

            dll.show();
            butonGetir.hide();
            butonCancel.show();
        })

            $("#b").click(function () {

                var dll = $('#<%= ddlMudahilPerson.ClientID %>')
            var butonGetir = $("#a");
            var butonCancel = $("#b");

            dll.hide();
            butonCancel.hide();
            butonGetir.show();

        })
        </script>



        <script>
            $(".imgAdd").click(function () {
                $(this).closest(".row").find('.imgAdd').before('<div class="col-sm-2 imgUp"><div class="imagePreview"></div><label class="btn btn-primary">Upload<input type="file" class="uploadFile img" value="Upload Photo" style="width:0px;height:0px;overflow:hidden;"></label><i class="fa fa-times del"></i></div>');
            });
            $(document).on("click", "i.del", function () {
                $(this).parent().remove();
            });
            $(function () {
                $(document).on("change", ".uploadFile", function () {
                    var uploadFile = $(this);
                    var files = !!this.files ? this.files : [];
                    if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support

                    if (/^image/.test(files[0].type)) { // only image file
                        var reader = new FileReader(); // instance of the FileReader
                        reader.readAsDataURL(files[0]); // read the local file

                        reader.onloadend = function () { // set image data as background of div
                            //alert(uploadFile.closest(".upimage").find('.imagePreview').length);
                            uploadFile.closest(".imgUp").find('.imagePreview').css("background-image", "url(" + this.result + ")");
                        }
                    }

                });
            });

        </script>
</asp:Content>

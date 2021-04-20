<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KayitOl.aspx.cs" Inherits="serkanISG.KayitOl" %>

<!DOCTYPE html>

<html>
<head>
    <!-- Basic Page Info -->
    <meta charset="utf-8">
    <title>Kayıt Ol</title>

    <!-- Site favicon -->
    <link rel="apple-touch-icon" sizes="180x180" href="vendors/images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="vendors/images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="vendors/images/favicon-16x16.png">

    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="vendors/styles/core.css">
    <link rel="stylesheet" type="text/css" href="vendors/styles/icon-font.min.css">
    <link rel="stylesheet" type="text/css" href="src/plugins/jquery-steps/jquery.steps.css">
    <link rel="stylesheet" type="text/css" href="vendors/styles/style.css">


    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'UA-119386393-1');
    </script>
</head>
<body>

    <form id="form1" runat="server">



        <div class="mobile-menu-overlay"></div>

        <div class="main-container">
            <div class="pd-ltr-20 xs-pd-20-10">
                <div style="width: 800px;   margin-left: 14%;" class="min-height-200px">
                    <div class="page-header">
                        <div class="row">
                            <div class="col-md-6 col-sm-12">
                            </div>
                            <div class="col-md-6 col-sm-12 text-right">
                            </div>
                        </div>

                        <div class="pd-20 card-box mb-30">
                            <div class="clearfix">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h4 class="text-blue h4">Kayıt Formu</h4>
                                    </div>
                                     <div class="col-md-6">
                                          <a style="float:right" class="btn btn-secondary" href="giris.aspx">Giriş Ekranına Dön</a>
                                    </div>
                                </div>
                              
                            </div>
                            <hr />
                            <br />
                            <div class="wizard-content">
                                <section class="tab-wizard wizard-circle wizard">
                                    <h5>Kişisel Bilgiler</h5>
                                    <section>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>İsim :</label>
                                                    <asp:TextBox ID="txtAD" class="form-control" placeholder="İsminizi giriniz." runat="server"></asp:TextBox>
                                                    <%-- <%--<input class="form-control" id=txtAD type="text" placeholder="İsminizi giriniz.">--%>
                                                    <asp:RegularExpressionValidator ID="rev_AD"
                                                        ControlToValidate="txtAD"
                                                        Style="color: red; font-size: 14px"
                                                        ValidationExpression="^[a-zA-Z''-'\s]{2,40}$"
                                                        ErrorMessage="İsim en az 2 en çok 40 harften oluşabilir."
                                                        runat="server" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Soyisim :</label>
                                                    <asp:TextBox ID="txtSOYAD" class="form-control" placeholder="Soyisminizi giriniz." runat="server"></asp:TextBox>
                                                    <%--<input class="form-control" id="txtSOYAD" placeholder="Soyisminizi giriniz." type="text">--%>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                                        ControlToValidate="txtsoyAD"
                                                        Style="color: red; font-size: 14px"
                                                        ValidationExpression="^[a-zA-Z''-'\s]{2,40}$"
                                                        ErrorMessage="Soyisim en az 2 en çok 40 harften oluşabilir."
                                                        runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>T.C. Kimlik Numarası :</label>
                                                    <asp:TextBox ID="txtTCKN" class="form-control" placeholder="T.C. kimlik numaranızı giriniz." runat="server"></asp:TextBox>
                                                    <%--<input id="txtTCKN" class="form-control"  placeholder="T.C kimlik numaranızı giriniz." type="text">--%>
                                                    <asp:RegularExpressionValidator ID="rev_TCKN"
                                                        ControlToValidate="txtTCKN"
                                                        Style="color: red; font-size: 14px"
                                                        ValidationExpression="^\d{11}"
                                                        ErrorMessage="T.C. kimlik numarası 11 adet rakamdan oluşmalıdır."
                                                        runat="server" />
                                                </div>
                                            </div>

                                        </div>

                                    </section>
                                    <!-- Step 2 -->
                                    <h5>İş Bilgileri</h5>
                                    <section>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>İş Tanımı :</label>
                                                    <asp:DropDownList ID="ddlIS" AppendDataBoundItems="true" CssClass="form-control" runat="server">
                                                        <asp:ListItem Text="SEÇİNİZ" />
                                                    </asp:DropDownList>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                                                        ControlToValidate="ddlIS"
                                                        Style="color: red; display:none; font-size: 14px"
                                                        ErrorMessage="s "
                                                        runat="server" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Sicil Numarası</label>

                                                    <asp:TextBox ID="txtSICIL_NO" class="form-control" placeholder="Sicil numaranızı giriniz." runat="server"></asp:TextBox>
                                                    <%--<input id="txtSICIL_NO" class="form-control" placeholder="Sicil numaranızı giriniz." type="text">--%>
                                                    <asp:RegularExpressionValidator ID="rev_SICILNO"
                                                        ControlToValidate="txtSICIL_NO"
                                                        Style="color: red; font-size: 14px"
                                                        ValidationExpression="\d{6}"
                                                        ErrorMessage="Sicil numarası 6 adet rakamdan oluşmalıdır "
                                                        runat="server" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>İş Başlangıç Tarihi :</label>
                                                    <asp:TextBox ID="dtpIS_BASLANGIC_TARIH" class="form-control" TextMode="Date" placeholder="a." runat="server"></asp:TextBox>
                                                    <%--<input class="form-control"  type="date">--%>
                                                    <asp:RangeValidator
                                                        runat="server"
                                                        ID="timeValidator"
                                                        Type="Date"
                                                        ControlToValidate="dtpIS_BASLANGIC_TARIH"
                                                        MaximumValue="2021/04/23"
                                                        Style="color: red; font-size: 14px"
                                                        MinimumValue="1000/12/28"
                                                        ErrorMessage="İşe başlama tarihiniz bugünden sonra olamaz." />
                                                    <asp:CustomValidator ID="CustomValidator1"
                                                        ControlToValidate="dtpIS_BASLANGIC_TARIH"
                                                        runat="server" ErrorMessage="CustomValidator"></asp:CustomValidator>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                    <!-- Step 3 -->
                                    <h5>İletişim</h5>
                                    <section>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Kullanıcı Adı:</label>
                                                    <asp:TextBox ID="txtKULLANICI_ADI" class="form-control" placeholder="Kullanıcı adınızı giriniz." runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ErrorMessage="Bu alan zorunludur" Color="red" ControlToValidate="txtKULLANICI_ADI" runat="server" />
                                                </div>
                                                <div class="form-group">
                                                    <label>Email :</label>
                                                    <asp:TextBox ID="txtEMAIL" class="form-control" TextMode="Email" placeholder="E-mailinizi giriniz." runat="server"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="rev_EMAIL"
                                                        ControlToValidate="txtEMAIL"
                                                        Style="color: red; font-size: 14px"
                                                        ValidationExpression="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"
                                                        ErrorMessage="Mail adresiniz ornek@ornek.com şeklinde olmalıdır."
                                                        runat="server" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Şifre</label>
                                                    <asp:TextBox ID="txtPAROLA" class="form-control" TextMode="Password" placeholder="Şifrenizi giriniz" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="Bu alan zorunludur*" ControlToValidate="txtPAROLA" runat="server" />

                                                </div>
                                                <div class="form-group">
                                                    <label>Şifre Tekrar</label>
                                                    <asp:TextBox ID="txtPAROLA_Kontrol" class="form-control" TextMode="Password" placeholder="Şifrenizi tekrar giriniz" runat="server"></asp:TextBox>
                                                    <asp:CompareValidator ID="comparePAROLA"
                                                        ControlToValidate="txtPAROLA"
                                                        ControlToCompare="txtPAROLA_Kontrol"
                                                        Operator="Equal"
                                                        Style="color: red; font-size: 14px"
                                                        runat="server"
                                                        ErrorMessage="Şifreler uyuşmuyor." />
                                                </div>
                                            </div>
                                        </div>
                                    </section>

                                </section>
                            </div>
                        </div>


                        <!-- success Popup html Start -->
                        <div class="modal fade" id="success-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-body text-center font-18">
                                        <h3 class="mb-20">Bilgileriniz Kaydedilmiştir!</h3>
                                        <div class="mb-30 text-center">
                                            <img src="vendors/images/success.png">
                                        </div>
                                     Sisteme Giriş Yapabilirsiniz
                                    </div>
                                    <div class="modal-footer justify-content-center">
                                        <button type="button" class="btn btn-primary" data-dismiss="modal">Tamam</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- success Popup html End -->
                    </div>

                </div>
            </div>
              <script src="Scripts/jquery-3.4.1.min.js"></script>
            <script>
                $('#<%= txtAD.ClientID %>').attr("title","Bu alan zorunludur")
            </script>

            <!-- js -->
            <script src="vendors/scripts/core.js"></script>
            <script src="vendors/scripts/script.min.js"></script>
            <script src="vendors/scripts/process.js"></script>
            <script src="vendors/scripts/layout-settings.js"></script>
            <script src="src/plugins/jquery-steps/jquery.steps.js"></script>
            <script src="vendors/scripts/steps-setting.js"></script>
        </div>
    </form>
</body>
</html>

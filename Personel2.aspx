<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Personel2.aspx.cs" Inherits="serkanISG.Personel2" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v20.2, Version=20.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v20.2, Version=20.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Personel</title>
    <style>
        * {
            padding: 0;
            margin: auto;
        }

        .hero {
            height: 100%;
            width: 100%;
            background-image: linear-gradient(rgba(0,0,0,0.4),rgba(0,0,0,0.4)),url(images/isg.jpg);
            background-position: center;
            background-size: cover;
            position: absolute;
        }

        .left-menu {
            width: 200px;
            height: 200px;
            background-color: aliceblue;
            width: 200px;
            height: 370px;
            background-color: aliceblue;
            margin: 20px;
            margin-top: 20px;
            margin-top: 90px;
            margin-left: 46px;
            background: rgb(2,0,36);
            background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(120,0,19,1) 100%, rgba(255,0,0,1) 100%, rgba(145,27,27,1) 100%, rgba(94,94,94,1) 100%);
            border-radius: 20px;
        }

        #btnKayitListesi {
            margin-top: 42px;
            margin-left: 42px;
            width: 116px;
            height: 40px;
            border-radius: 19px;
            background: #354a61;
        }

        #btnUygunsuzlukGiris {
            margin-top: 42px;
            margin-left: 42px;
            width: 116px;
            height: 40px;
            border-radius: 19px;
            background: #354a61;
        }

        .PersonelListe {
            width: 1122px;
            height: 230px;
            background-color: #098cff;
            margin-top: -375px;
            margin-left: 290px;
            background: transparent;
            /*visibility: hidden*/
        }

        #uygun {
            width: 726px;
            height: 478px;
            background-color: #dee9f4;
            margin-top: -323px;
            margin-left: 427px;
            border-radius: 10rem;
        }

        .none {
            visibility: hidden
        }

        #form {
        }

        .auto-style1 {
            width: 85%;
            height: 421px;
        }

        .auto-style2 {
            height: 117px;
            background-color: #006600;
        }

        .auto-style4 {
            font-size: xx-large;
        }

        .auto-style5 {
            font-size: larger;
        }

        .auto-style7 {
            height: 117px;
            width: 713px;
            text-align: left;
            background-color: #08550800
        }

        .auto-style8 {
            width: 713px;
            height: 121px;
        }

        .auto-style9 {
            height: 314px;
        }

        .auto-style10 {
            width: 713px;
            height: 314px;
            text-align: left;
        }

        .auto-style11 {
            height: 121px;
        }

        .auto-style16 {
            width: 804px;
            height: 527px;
        }

        .auto-style17 {
            width: 100%;
        }

        .newStyle1 {
            font-family: Bahnschrift;
        }

        .auto-style18 {
            font-family: Bahnschrift;
            width: 242px;
        }

        .auto-style19 {
            font-family: Bahnschrift;
            width: 242px;
            height: 30px;
        }

        .auto-style20 {
            height: 30px;
        }

        .auto-style21 {
            width: 216px;
        }

        .auto-style22 {
            height: 30px;
            width: 216px;
        }

        #user {
            width: 224px;
            height: 148px;
            position: absolute;
            background-color: yellowgreen;
            margin-top: 12px;
            top: 26px;
            right: 57px;
            background: transparent;
        }

        #userPP {
            position: relative;
            right: -124px;
        }

        .userBtn {
            padding: 3px;
            margin: 6px;
            top: -3px;
            position: relative;
            background-color: #945555;
            border-radius: 5px;
        }

        #txtUserAd {
            position: relative;
            top: -62px;
            left: -28px;
            background: transparent;
            border-top: 0px;
            border-right: 0px;
            border-left: 0px;
            text-align: center;
            
        }
    </style>
</head>



<body>
    <form id="form1" runat="server">
        <div class="hero">
            <section id="user">
                <img id="userPP" src="images/user.png" alt="user photo" />
                <asp:TextBox ID="txtUserAd" Enabled="false" placeholder="Kullanıcı Adı" runat="server"></asp:TextBox>
                <button id="btnUserBilgi" class="userBtn" type="button">Bilgilerimi Görüntle</button>
                <button id="btnExit" class="userBtn" type="button">Çıkış</button>
            </section>
            <section class="left-menu">
                <button id="btnKayitListesi" onclick="onoff()" type="button">Kayıt Listesi Gizle</button>
                <button id="btnUygunsuzlukGiris" type="button">Uygunsuzluk Ekle</button>


            </section>
            <section id="pi" class="PersonelListe">
                <asp:GridView ID="gridPersonelListe" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" Width="1109px" Height="175px">
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
            </section>
            <div id="uygun" class="auto-style16">

                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2"></td>
                        <td class="auto-style7">
                            <h2><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <span class="auto-style4">&nbsp;</span><span class="auto-style5">Uygunsuzluk Giriş Formu</span></strong></h2>
                        </td>
                        <td class="auto-style2"></td>
                    </tr>
                    <tr>
                        <td class="auto-style9"></td>
                        <td aria-multiline="True" class="auto-style10">
                            <table class="auto-style17">
                                <tr>
                                    <td class="auto-style18">Uygunsuzluk Türü:</td>
                                    <td class="auto-style21">
                                        <asp:DropDownList ID="ddlTUR" runat="server" Width="211px">
                                            <asp:ListItem>Minör</asp:ListItem>
                                            <asp:ListItem>Majör</asp:ListItem>
                                            <asp:ListItem>Hayati</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style18">Birim:</td>
                                    <td class="auto-style21">
                                        <asp:DropDownList ID="ddlBirim" runat="server" Width="211px">
                                            <asp:ListItem>İnsan Kaynakları</asp:ListItem>
                                            <asp:ListItem>Üretim</asp:ListItem>
                                            <asp:ListItem>Pazarlama</asp:ListItem>
                                            <asp:ListItem>Ürün Geliştirme</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style19">Uygunsuzluk Tespit Tarihi:</td>
                                    <td class="auto-style22">
                                        <asp:TextBox ID="dateTespiTarih" TextMode="Date" runat="server" Width="203px"></asp:TextBox>
                                    </td>
                                    <td class="auto-style20">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style18">Sorumlu:</td>
                                    <td class="auto-style21">
                                        <asp:DropDownList ID="ddlSorumlu" runat="server" Width="211px">
                                        </asp:DropDownList>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style18">Uygunsuzluk Durumu:</td>
                                    <td class="auto-style21">
                                        <asp:TextBox ID="txtUygunsuzlukDurumu" TextMode="MultiLine" runat="server" Width="203px"></asp:TextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style18">Aksiyon:</td>
                                    <td class="auto-style21">
                                        <asp:TextBox ID="txtAksiyon" TextMode="MultiLine" runat="server" Width="203px"></asp:TextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style18">Termin Tarihi:</td>
                                    <td class="auto-style21">
                                        <asp:TextBox ID="dateTerminTarih" TextMode="Date" runat="server" Width="203px"></asp:TextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style18">Tespit Eden:</td>
                                    <td class="auto-style21">
                                        <asp:DropDownList ID="ddlTespitEden" runat="server" Width="211px">
                                        </asp:DropDownList>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style18">&nbsp;</td>
                                    <td class="auto-style21">
                                        <asp:Button ID="btnKaydet" runat="server" Text="Uygunsuzluk Kaydet" Width="140px" OnClick="btnKaydet_Click" />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style18">&nbsp;</td>
                                    <td class="auto-style21">
                                        <asp:Button ID="btnVazgec" runat="server" Text="Vazgeç" Width="140px" OnClick="btnVazgec_Click" />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                        <td class="auto-style9"></td>
                    </tr>
                    <tr>
                        <td class="auto-style11"></td>
                        <td class="auto-style8"></td>
                        <td class="auto-style11"></td>
                    </tr>
                </table>

            </div>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script>







                function onoff() {
                    if (document.getElementById("btnKayitListesi").innerHTML == "Kayıt Listesi Gizle") {

                        document.getElementById("btnKayitListesi").innerHTML = "Kayıt Listesi Göster";
                    }
                    else {

                        document.getElementById("btnKayitListesi").innerHTML = "Kayıt Listesi Gizle";

                    }
                }




                $(document).ready(function () {
                    $("#btnKayitListesi").click(function () {
                        $("#pi").toggleClass("none");
                    });
                });


                $(document).ready(function () {
                    $("#btnUygunsuzlukGiris").click(function () {
                        $("#uygun").toggleClass("none");
                    });
                });







            </script>
        </div>



    </form>
</body>
</html>

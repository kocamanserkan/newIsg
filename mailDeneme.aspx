<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mailDeneme.aspx.cs" Inherits="serkanISG.mailDeneme" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <label>Mail Gönderilecek Kişi</label>
            <asp:DropDownList ID="mailListe" runat="server">
            </asp:DropDownList>
            <asp:Button ID="send" OnClick="send_Click" CssClass="" Text="Gönder" runat="server" />
        </div>
    </form>



    <table width="100%" border="0" cellspacing="0">
        <tbody>
            <tr>
                <td align="center" valign="top" style="background-color: #f0f0f0; padding: 20px">
                    <table width="100%" border="0" cellspacing="0" style="box-sizing: border-box;">
                        <tbody>
                            <tr>
                                <td style="background-color: #4791d2; border-bottom: 2px solid #367fbe; height: 6px;"></td>
                            </tr>
                            <tr>
                                <td style="background-color: #fff; text-align: left; padding: 20px;">
                                    <p style="font-family: Tahoma; font-size: 12px">
                                        Sayın "+ddlMudahilPerson.Text+",<br />
                                        Seviye 1 İSG Bildiriminde Müdahil Personel Olarak Atandınız.
                                    </p>
                                    <table style="width: 100%; border-width: 1px; border-style: solid; border-collapse: collapse; font-size: 10pt; font-family: Tahoma;" bordercolor="black">
                                        <tbody>
                                            <tr style="width: 100%; border: 1px solid black; border-collapse: collapse; background-color: #FFFFFF;">
                                                <td style="width: 20%; border: 1px solid black; border-collapse: collapse; text-align: left; font-weight: bold;">Tarih ve Saat</td>
                                                <td style="width: 80%; border: 1px solid black; border-collapse: collapse; text-align: left;">"+Date+"</td>
                                            </tr>
                                            <tr style="width: 100%; border: 1px solid black; border-collapse: collapse; background-color: #F7FBFF;">
                                                <td style="width: 20%; border: 1px solid black; border-collapse: collapse; text-align: left; font-weight: bold;">Lokasyon</td>
                                                <td style="width: 80%; border: 1px solid black; border-collapse: collapse; text-align: left;">"+ddlLokasyon.Text+"</td>
                                            </tr>
                                            <tr style="width: 100%; border: 1px solid black; border-collapse: collapse; background-color: #FFFFFF;">
                                                <td style="width: 20%; border: 1px solid black; border-collapse: collapse; text-align: left; font-weight: bold;">Birim</td>
                                                <td style="width: 80%; border: 1px solid black; border-collapse: collapse; text-align: left;">"+ddlBirim.Text+"</td>
                                            </tr>
                                            <tr style="width: 100%; border: 1px solid black; border-collapse: collapse; background-color: #F7FBFF;">
                                                <td style="width: 20%; border: 1px solid black; border-collapse: collapse; text-align: left; font-weight: bold;">Kategori</td>
                                                <td style="width: 80%; border: 1px solid black; border-collapse: collapse; text-align: left;">"+ddlKategori.Text+"</td>
                                            </tr>
                                            <tr style="width: 100%; border: 1px solid black; border-collapse: collapse; background-color: #FFFFFF;">
                                                <td style="width: 20%; border: 1px solid black; border-collapse: collapse; text-align: left; font-weight: bold;">Vardiya</td>
                                                <td style="width: 80%; border: 1px solid black; border-collapse: collapse; text-align: left;">"+ddlVardiya.Text+"</td>
                                            </tr>
                                            <tr style="width: 100%; border: 1px solid black; border-collapse: collapse; background-color: #FFFFFF;">
                                                <td style="width: 20%; border: 1px solid black; border-collapse: collapse; text-align: left; font-weight: bold;">Bildiren Personel</td>
                                                <td style="width: 80%; border: 1px solid black; border-collapse: collapse; text-align: left;">ddlBildirimYapan.Text</td>
                                            </tr>
                                            <tr style="width: 100%; border: 1px solid black; border-collapse: collapse; background-color: #FFFFFF;">
                                                <td style="width: 20%; border: 1px solid black; border-collapse: collapse; text-align: left; font-weight: bold;">Bildirim Metni</td>
                                                <td style="width: 80%; border: 1px solid black; border-collapse: collapse; text-align: left;">+"txtBildirimMetin.Text"+</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #4791d2; border-top: 2px solid #367fbe; height: 6px;"></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>








</body>
</html>

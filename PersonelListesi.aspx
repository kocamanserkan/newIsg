<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PersonelListesi.aspx.cs" Inherits="serkanISG.PersonelListesi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



  

    <div class="pd-ltr-20 xs-pd-20-10" style="margin-left: 10%; width: 1230px;">
        <div class="min-height-200px">

            <!-- Simple Datatable start -->
            <div class="card-box mb-190">
                <div class="pd-20" style="margin-top: 100px">
                    <h4 class="text-blue h4">Personel Kayıt Listesi</h4>

                </div>
                <div>
                    <%--<asp:GridView ID="GridView1" CssClass="data-table table stripe hover nowrap" Gridlines="None" runat="server">
                        <Columns>
                            <asp:ButtonField Text="Button" />
                            <asp:ButtonField Text="Button" />
                        </Columns>
                    </asp:GridView>--%>
                    <asp:GridView ID="grdPersonelListesi" runat="server" CssClass="data-table table stripe hover nowrap" gridlines="None" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="grdPersonelListesi_RowCancelingEdit"
                        OnRowEditing="grdPersonelListesi_RowEditing" OnRowUpdating="grdPersonelListesi_RowUpdating" OnRowDeleting="grdPersonelListesi_RowDeleting">
                        <Columns>
                            <asp:TemplateField HeaderText="Düzenle" > 
                                <ItemTemplate>
                                   <%--<asp:LinkButton runat="server" ID="btn_Edit" Text="<i class='icon-camera-retro'></i> Düzenle" CommandName="Edit" CssClass="greenButton" />--%>
                                   <asp:LinkButton runat="server" ID="btn_Edit" Text="<i class='icon-copy fi-pencil'></i>" CommandName="Edit" CssClass="greenButton" />
                                    <%--<asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />--%>
                                   
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Button ID="btn_Update" runat="server" Text="OK" CommandName="Update" />
                                     <asp:Button ID="btn_sil" runat="server" Text="Sil" CommandName="Delete" />
                                    <asp:Button ID="btn_Cancel" runat="server" Text="İptal" CommandName="Cancel" />
                                  
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_ID"  style="width: 30px;" runat="server" Text='<%#Eval("ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ad">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_ad" runat="server" Text='<%#Eval("Ad") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_ad" style="border-color:red;" runat="server" Width="80px" Text='<%#Eval("Ad") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Soyad">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Soyad" runat="server" Text='<%#Eval("Soyad") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Soyad" Width="80px" style="border-color:red;" runat="server" Text='<%#Eval("Soyad") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Kullanıcı Adı">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_username" runat="server" Text='<%#Eval("Kullanıcı Adı") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_username" Width="80px" style="border-color:red;" runat="server" Text='<%#Eval("Kullanıcı Adı") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Şifre">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_sifre"  runat="server" Text='<%#Eval("Şifre") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_sifre" Width="50px" style="border-color:red;" runat="server" Text='<%#Eval("Şifre") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                              <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_email" runat="server" Text='<%#Eval("E-mail") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_email" runat="server" style="border-color:red;" Text='<%#Eval("E-mail") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                           

                             
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

        </div>
        <div class="footer-wrap pd-20 mb-20 card-box">
            Uygunsuzluk Modülü By <a href="https://github.com/mavihub" target="_blank">Serkan Kocaman</a>
        </div>

    </div>












</asp:Content>

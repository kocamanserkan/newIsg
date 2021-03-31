<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="serkanISG.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="login-header box-shadow">
        <div class="container-fluid d-flex justify-content-between align-items-center">
            <div class="brand-logo">
                <a href="login.aspx">
                    <img src="vendors/images/logo.png" alt="">
                </a>
            </div>
            <div class="login-menu">
                <ul>
                    <li><a href="Register.aspx">Kayıt Ol</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6 col-lg-7">
                    <img src="vendors/images/login-page-img.png" alt="">
                </div>
                <div class="col-md-6 col-lg-5">
                    <div class="login-box bg-white box-shadow border-radius-10">
                        <div class="login-title">
                            <h2 class="text-center text-primary">Uygunsuzluk Giriş</h2>
                        </div>
                        <div class="input-group custom">
                            <%--<input  type="text" class="form-control form-control-lg" placeholder="Kullanıcı Adı"></asp:TextBox>--%>
                            <asp:TextBox ID="txtKULLANICIADI" Class="form-control form-control-lg" runat="server" placeholder="Kullanıcı Adı"></asp:TextBox>
                            <div class="input-group-append custom">
                                <span class="input-group-text"><i class="icon-copy dw dw-user1"></i></span>
                            </div>
                        </div>
                        <div class="input-group custom">
                            <asp:TextBox ID="txtPAROLA" runat="server" type="password" class="form-control form-control-lg" placeholder="**********"></asp:TextBox>
                            <%-- <input type="password" class="form-control form-control-lg" placeholder="**********">--%>
                            <div class="input-group-append custom">
                                
                                <span class="input-group-text"><i class="dw dw-padlock1"></i></span>
                            </div>
                        </div>
                        <div class="row pb-30">
                            <div class="col-6">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="customCheck1">
                                    <label class="custom-control-label" for="customCheck1">Beni Hatırla</label>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="input-group mb-0">
                                    <asp:Button ID="btnGiris" runat="server" OnClick="btnGiris_Click" CssClass="btn btn-primary btn-lg btn-block" Text="Giriş Yap" />
                                </div>
                                <div class="font-16 weight-600 pt-10 pb-10 text-center" data-color="#707373">Veya</div>
                                <div class="input-group mb-0">
                                    <a class="btn btn-outline-primary btn-lg btn-block" href="Register.aspx">Kayıt Ol</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
</asp:Content>

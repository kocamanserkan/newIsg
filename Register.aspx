<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="serkanISG.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%--		<div class="pre-loader">
		<div class="pre-loader-box">
			<div class="loader-logo"><img src="vendors/images/deskapp-logo.svg" alt=""></div>
			<div class='loader-progress' id="progress_div">
				<div class='bar' id='bar1'></div>
			</div>
			<div class='percent' id='percent1'>0%</div>
			<div class="loading-text">
				Loading...
			</div>
		</div>
	</div>--%>



    <div class="pd-20 card-box mb-30">
        <div class="clearfix">
            <div class="pull-left">
                <h4 class="text-blue h4">Kullanıcı Kayıt Ekranı</h4>

            </div>
            <div class="pull-right">
                <asp:Button ID="btnLoginEkran" onclick="btnLoginEkran_Click" class="btn btn-primary btn-sm scroll-click" rel="content-y" data-toggle="collapse" runat="server" Text="Giriş Yap" />
                	<%--<a href="login.aspx" class="btn btn-primary btn-sm scroll-click" rel="content-y"  data-toggle="collapse" role="button">Giriş Yap</a>--%>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label">İsim</label>
            <div class="col-sm-12 col-md-10">
                <asp:TextBox ID="txtAD" class="form-control" placeholder="İsminizi giriniz." runat="server"></asp:TextBox>
                <%-- <%--<input class="form-control" id=txtAD type="text" placeholder="İsminizi giriniz.">--%>
                <asp:RegularExpressionValidator ID="rev_AD"
                   ControlToValidate="txtAD"
                    Style="color: red; font-size: 14px"
                    ValidationExpression="^[a-zA-Z''-'\s]{2,40}$"
                    ErrorMessage="İsim en az 2 en çok 40 harften oluşabilir."
                    runat="server" />
                <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                   ControlToValidate="txtAD"
                    Style="color: red; font-size: 14px"
                    ValidationExpression=".{42,}"
                    ErrorMessage="İsim en az 2 harften oluşabilir."
                    runat="server" />
                --%>
               

            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label">Soyisim</label>
            <div class="col-sm-12 col-md-10">
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
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label">T.C. Kimlik Numarası</label>
            <div class="col-sm-12 col-md-10">
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
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label">Sicil Numarası</label>
            <div class="col-sm-12 col-md-10">
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
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label">İş Başlangıç Tarihi</label>
            <div class="col-sm-12 col-md-10">
                <asp:TextBox ID="dtpIS_BASLANGIC_TARIH" class="form-control" TextMode="Date" placeholder="a." runat="server"></asp:TextBox>
                <%--<input class="form-control"  type="date">--%>
                  <asp:RangeValidator
                                            runat="server"
                                            ID="timeValidator"
                                            Type="Date"
                                            ControlToValidate="dtpIS_BASLANGIC_TARIH"
                                            MaximumValue="2021/03/01"
                                            Style="color: red; font-size: 14px"
                                            MinimumValue="1000/12/28"
                                            ErrorMessage="İşe başlama tarihiniz bugünden sonra olamaz."/>
                <asp:CustomValidator ID="CustomValidator1" 
                    ControlToValidate="dtpIS_BASLANGIC_TARIH"
                    runat="server" ErrorMessage="CustomValidator"></asp:CustomValidator>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label">İş Tanımı</label>
            <div class="col-sm-12 col-md-10">
                <asp:DropDownList ID="ddlIS" CssClass="form-control" runat="server"></asp:DropDownList>
                <%--<input id="txtIS" class="form-control"  type="text">--%>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label">Kullanıcı Adı</label>
            <div class="col-sm-12 col-md-10">
                <asp:TextBox ID="txtKULLANICI_ADI" class="form-control" placeholder="Kullanıcı adınızı giriniz." runat="server"></asp:TextBox>
                <%--<input class="form-control" id="txtKULLANICI_ADI" placeholder="Kullanıcı adınızı giriniz." type="text">--%>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label">E-Mail</label>
            <div class="col-sm-12 col-md-10">
               
              <asp:TextBox ID="txtEMAIL" class="form-control" TextMode="Email" placeholder="E-mailinizi giriniz." runat="server"></asp:TextBox>
                 <asp:RegularExpressionValidator ID="rev_EMAIL"
                                            ControlToValidate="txtEMAIL"
                                            Style="color: red; font-size: 14px"
                                            ValidationExpression="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"
                                            ErrorMessage="Mail adresiniz ornek@ornek.com şeklinde olmalıdır."
                                            runat="server" />
                <%--<input class="form-control" id="txtEMAIL" placeholder="E-mailinizi giriniz." type="text">--%>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label">Şifre</label>
            <div class="col-sm-12 col-md-10">
                <asp:TextBox ID="txtPAROLA" class="form-control" TextMode="Password" placeholder="Şifrenizi giriniz" runat="server"></asp:TextBox>
                <%--<input id="txtPAROLA" class="form-control" placeholder="Şifrenizi giriniz." type="password">--%>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label">Şifre Doğrulaması</label>
            <div class="col-sm-12 col-md-10">
                <asp:TextBox ID="txtPAROLA_Kontrol" class="form-control" TextMode="Password" placeholder="Şifrenizi tekrar giriniz" runat="server"></asp:TextBox>
                 <asp:CompareValidator ID="comparePAROLA" 
                                            ControlToValidate="txtPAROLA"
                                            ControlToCompare="txtPAROLA_Kontrol"
                                            Operator="Equal"
                                            Style="color: red; font-size: 14px"
                                            runat="server"
                                            ErrorMessage="Şifreler uyuşmuyor."/>
                <%--<input class="form-control" id="txtPAROLA_Kontrol" placeholder="Şifrenizi tekrar giriniz." type="password">--%>
            </div>
        </div>
        <div class="form-group row">

            <div class="col-sm-12 col-md-10">
                <%--<button class="btn btn-primary btn-sm scroll-click"  text="hop" type="button"/>--%>
                <asp:Button ID="bntGiris" class="btn btn-primary btn-sm scroll-click" OnClick="btnSave_Click" runat="server" Text="Kayıt Ol" />
            </div>
        </div>

        <div class="collapse collapse-box" id="basic-form1">
            <div class="code-box">
                <div class="clearfix">
                    <a href="javascript:;" class="btn btn-primary btn-sm code-copy pull-left" data-clipboard-target="#copy-pre"><i class="fa fa-clipboard"></i>Copy Code</a>
                    <a href="#basic-form1" class="btn btn-primary btn-sm pull-right" rel="content-y" data-toggle="collapse" role="button"><i class="fa fa-eye-slash"></i>Hide Code</a>
                </div>
                <pre><code class="xml copy-pre" id="copy-pre">
							</code></pre>
            </div>
        </div>
    </div>
















</asp:Content>

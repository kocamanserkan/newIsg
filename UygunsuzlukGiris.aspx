<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UygunsuzlukGiris.aspx.cs" Inherits="serkanISG.UygunsuzlukGiris" %>

<%@ Register Assembly="DevExpress.Web.v20.2, Version=20.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 

    <asp:TextBox ID="kontrolDate" TextMode="Date" Visible="false" runat="server"></asp:TextBox>
    

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
                <h4 class="text-blue h4">Uygunsuzluk Giriş Formu</h4>

            </div>
            <div class="pull-right">
                <asp:Button ID="btnVazgec" onclick="btnVazgec_Click" class="btn btn-primary btn-sm scroll-click" rel="content-y" data-toggle="collapse" runat="server" Text="Vazgeç" />
                <%--<a href="login.aspx" class="btn btn-primary btn-sm scroll-click" rel="content-y"  data-toggle="collapse" role="button">Giriş Yap</a>--%>
            </div>
        </div>
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
                <asp:DropDownList ID="ddlBirim" CssClass="form-control" runat="server">
                    <asp:ListItem>Yönetim Birimi</asp:ListItem>
                    <asp:ListItem>Üretim Planlama</asp:ListItem>
                    <asp:ListItem>Üretim Tesisi</asp:ListItem>
                    <asp:ListItem>Halkla İlişkiler</asp:ListItem>
                    <asp:ListItem>Ham Madde Kabul </asp:ListItem>
                    <asp:ListItem>Ürün Geliştirme </asp:ListItem>
                    <asp:ListItem>Ortak Alan </asp:ListItem>
                    <asp:ListItem>Yemekhane </asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label">Tespit Tarihi</label>
            <div class="col-sm-12 col-md-10">
                <asp:TextBox ID="dtpTespitTarih" clasS="form-control" textmode="Date" runat="server"></asp:TextBox>
                 <asp:RangeValidator
                                            runat="server"
                                            ID="timeValidator"
                                            Type="Date"
                                            ControlToValidate="dtpTespitTarih"
                                            MaximumValue="2021/02/27"
                                            Style="color: red; font-size: 14px"
                                            MinimumValue="1000/12/28"
                                            ErrorMessage="Uygunsuzluk tespit tarihi bugünden sonra olamaz."/>
               
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label">Uygunsuz Durumu</label>
            <div class="col-sm-12 col-md-10">
                <asp:TextBox ID="txtUygnsuzDurum" class="form-control" textmode="MultiLine" placeholder="Uygunsuz durumu açıklayınız." runat="server"></asp:TextBox>
                <%--<input id="txtSICIL_NO" class="form-control" placeholder="Sicil numaranızı giriniz." type="text">--%>
            </div>
        </div>
         <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label">Önerilen Aksiyon</label>
            <div class="col-sm-12 col-md-10">
                <asp:TextBox ID="txtAksiyon" class="form-control" textmode="MultiLine" placeholder="Uygunsuz duruma karşı alınabilecek aksiyon önerileri.." runat="server"></asp:TextBox>
                <%--<input id="txtSICIL_NO" class="form-control" placeholder="Sicil numaranızı giriniz." type="text">--%>
            </div>
        </div>
         <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label">Tespit Eden</label>
            <div class="col-sm-12 col-md-10">
                <asp:DropDownList ID="ddlTespitEden" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label">Sorumlu</label>
            <div class="col-sm-12 col-md-10">
                <asp:DropDownList ID="ddlSorumlu" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label">Önerilen Termin Tarihi</label>
            <div class="col-sm-12 col-md-10">
                <asp:TextBox ID="dateTerminTarihi" class="form-control" TextMode="Date" placeholder="" runat="server"></asp:TextBox>
                 <asp:rangevalidator
                                            runat="server"
                                            id="val_termintarih"
                                            type="date"
                                            controltovalidate="datetermintarihi"
                                            maximumvalue="2060/02/27"
                                            style="color: red; font-size: 14px"
                                            minimumvalue= "2021/02/27" 
                                            errormessage=" önerilen termin tarihi bugünden sonra olamaz."/>
 <%--<asp:CompareValidator 
                    ID="CompareValidator1"
                    runat="server"
                    ControlToValidate="dateTerminTarihi"
                    ControlToCompare="kontrolDate"
                    Operator="GreaterThanEqual"
                    ErrorMessage="aasoıdajosd">
                   
                </asp:CompareValidator>--%>             
            </div>
        </div>
      

        <div class="form-group row">

            <div class="col-sm-12 col-md-10">
                <%--<button class="btn btn-primary btn-sm scroll-click"  text="hop" type="button"/>--%>
                <asp:Button ID="btnUygunsuzlukSave" class="btn btn-primary btn-sm scroll-click"  OnClick="btnUygunsuzlukSave_Click" runat="server" Text="Uygunsuzluk Bildir" />
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

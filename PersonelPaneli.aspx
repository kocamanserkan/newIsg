<%@ Page Title="Personel Paneli" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PersonelPaneli.aspx.cs" Inherits="serkanISG.PersonelPaneli" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
		<meta charset="utf-8">
     <div class="pre-loader">
		<div class="pre-loader-box">
			<div class="loader-logo"><img src="vendors/images/logo.png" alt=""></div>
			<div class='loader-progress' id="progress_div">
				<div class='bar' id='bar1'></div>
			</div>
			<div class='percent' id='percent1'>0%</div>
			<div class="loading-text">
				Uygunsuzluk Modülü Yükleniyor...
			</div>
		</div>
	</div> 
    <style>	
		#txtUsername{

			border: 0px;
		}
    </style>

	<div class="header">
		
		<div class="header-right">
			
			
			<div class="user-info-dropdown">
				<div class="dropdown">
					<a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown">
						<span class="user-icon">
							<img src="vendors/images/photo1.jpg" alt="">
						</span>
                       
                        <asp:Label CssClass="user-name"  ID="txtFullAd" runat="server" Text=""></asp:Label>
						<%--<span class="user-name">Serkan Kocaman</span>--%>
					</a>
					<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
						<a class="dropdown-item" href="Profil.aspx"><i class="dw dw-user1"></i> Profilim</a>
						<a class="dropdown-item" href="Profil.aspx"><i class="dw dw-settings2"></i> Profil Ayarları</a>
						
						<a class="dropdown-item" href="login.aspx"><i class="dw dw-logout"></i> Çıkış</a>
					</div>
				</div>
			</div>
			
		</div>
	</div>


	<div class="left-side-bar">
		<div class="brand-logo">
			<a href="PersonelPaneli.aspx">
				<img src="vendors/images/logo.png" alt="" class="dark-logo">
				<img src="vendors/images/logo.png" alt="" class="light-logo">
			</a>
			<div class="close-sidebar" data-toggle="left-sidebar-close">
				<i class="ion-close-round"></i>
			</div>
		</div>
        
		<div class="menu-block customscroll">
			<div class="sidebar-menu">
				<ul id="accordion-menu">
					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon dw dw-house-1"></span><span class="mtext">Uygunsuzluk Modülü</span>
						</a>
						<ul class="submenu">
							<li><a href="Uygunsuzluk">Uygunsuzluk İşlemleri</a></li>
							<%--<li><a href="UygunsuzlukGiris">Uygunsuzluk Giriş</a></li>--%>
						<%--	<li><a href="PersonelListesi.aspx">Uygunsuzluk Takip</a></li>--%>
							<li><a href="PersonelListesi.aspx">Kullanıcı Listesi</a></li>
						
						</ul>
					
					</li>
					
				
				</ul>
			</div>
		</div>
	</div>
	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="pd-ltr-20">
			<div class="card-box pd-20 height-100-p mb-30">
				<div class="row align-items-center">
					<div class="col-md-4">
						<img src="vendors/images/banner-img.png" alt="">
					</div>
					<div class="col-md-8">
						<h4 class="font-20 weight-500 mb-10 text-capitalize">
							Hoş geldin <div class="weight-600 font-30 text-blue">
								<asp:Label ID="lblAD" CssClass="weight-600 font-30 text-blue" runat="server" Text="Label"></asp:Label>
							           </div>
                            
						</h4>
						<p class="font-18 max-width-600">Uygunsuzluk Modülü, personellerin iş güvenliği ve sağlığına olumsuz yönde etki edebilecek faktörleri raporladığı ve takip ettiği bir platformdur.   </p>
					</div>
				</div>
			</div>
			
			
			
			<div class="footer-wrap pd-20 mb-20 card-box">
				Uygunsuzluk Modülü <a href="https://github.com/mavihub" target="_blank">Serkan Kocaman</a>
			</div>
		</div>
	</div>





   

  </asp:Content>






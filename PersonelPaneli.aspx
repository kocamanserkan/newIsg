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






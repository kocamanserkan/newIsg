<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profil.aspx.cs" Inherits="serkanISG.Profil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <div class="main-container">
        <div class="pd-ltr-20 xs-pd-20-10" style="width: 1016px; margin-left: -124px;">
            <div class="min-height-200px">

                <div class="row">
                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 mb-30">
                        <div class="pd-20 card-box height-100-p" style="text-align: center;">
                            <div class="profile-photo">

                                <img src="vendors/images/photo1.jpg" alt="" class="avatar-photo">
                            </div>

                            <asp:Label ID="lbl_ad" class="text-center h5 mb-0" runat="server" Text="İsim Soyisim"></asp:Label>
                            <br />
                            <asp:Label ID="lbl_meslek" class="text-center text-muted font-14" runat="server" Text="İsim Soyisim"></asp:Label>

                            <div class="profile-info">
                                <h5 class="mb-20 h5 text-blue">İletişim Bilgileri</h5>
                                <ul>
                                    <li>
                                        <span>Kullanıcı Adı:</span>
                                        <asp:Label ID="lbl_Kullaniciad" runat="server" Text="asdojad@gmail.com"></asp:Label>
                                    </li>
                                    <li>
                                        <span>Sicil Numarası:</span>
                                        <asp:Label ID="lbl_sicil" runat="server" Text="54445"></asp:Label>
                                    </li>
                                    <li>
                                        <span>T.C. Kimlik Numarası</span>
                                        <asp:Label ID="lbl_tc" runat="server" Text="545454545445"></asp:Label>
                                    </li>
                                    <li>
                                        <span>E-mail</span>
                                        <asp:Label ID="lbl_mail" runat="server" Text="545454545445"></asp:Label>
                                    </li>
                                    <li>
                                        <span>İş Başlangıç Tarihi</span>
                                        <asp:Label ID="lbl_isbaslama" runat="server" Text="545454545445"></asp:Label>
                                    </li>

                                </ul>
                            </div>
                            <div class="profile-social">
                                <h5 class="mb-20 h5 text-blue">Sosyal Medya</h5>
                                <ul class="clearfix">
                                    <li><a href="#" class="btn" data-bgcolor="#3b5998" data-color="#ffffff"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#" class="btn" data-bgcolor="#1da1f2" data-color="#ffffff"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#" class="btn" data-bgcolor="#007bb5" data-color="#ffffff"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="#" class="btn" data-bgcolor="#f46f30" data-color="#ffffff"><i class="fa fa-instagram"></i></a></li>

                                </ul>
                            </div>

                        </div>
                    </div>
                    <div class="col-xl-8 col-lg-8 col-md-8 col-sm-12 mb-30">
                        <div class="card-box height-100-p overflow-hidden">
                            <div class="profile-tab height-100-p">
                                <div class="tab height-100-p">
                                    <ul class="nav nav-tabs customtab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-toggle="tab" href="#timeline" role="tab">Alakalı Uygunsuzluklarım</a>
                                        </li>

                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="tab" href="#setting" role="tab">Profil Ayarı</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <!-- Timeline Tab start -->
                                        <div class="tab-pane fade show active" id="timeline" role="tabpanel">
                                            <div class="pd-20">
                                                <div class="profile-timeline">
                                                    <div class="timeline-month">
                                                        <h5>August, 2020</h5>
                                                    </div>
                                                    <div class="profile-timeline-list">
                                                        <ul>
                                                            <li>
                                                                <div class="date">12 Aug</div>
                                                                <div class="task-name"><i class="ion-android-alarm-clock"></i>Task Added</div>
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                                                <div class="task-time">09:30 am</div>
                                                            </li>
                                                            <li>
                                                                <div class="date">10 Aug</div>
                                                                <div class="task-name"><i class="ion-ios-chatboxes"></i>Task Added</div>
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                                                <div class="task-time">09:30 am</div>
                                                            </li>
                                                            <li>
                                                                <div class="date">10 Aug</div>
                                                                <div class="task-name"><i class="ion-ios-clock"></i>Event Added</div>
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                                                <div class="task-time">09:30 am</div>
                                                            </li>
                                                            <li>
                                                                <div class="date">10 Aug</div>
                                                                <div class="task-name"><i class="ion-ios-clock"></i>Event Added</div>
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                                                <div class="task-time">09:30 am</div>
                                                            </li>
                                                        </ul>
                                                    </div>



                                                </div>
                                            </div>
                                        </div>
                                        <!-- Timeline Tab End -->
                                        <!-- Tasks Tab start -->
                                        <div class="tab-pane fade" id="tasks" role="tabpanel">
                                            <div class="pd-20 profile-task-wrap">
                                                <div class="container pd-0">
                                                    <!-- Open Task start -->
                                                    <div class="task-title row align-items-center">
                                                        <div class="col-md-8 col-sm-12">
                                                            <h5>Open Tasks (4 Left)</h5>
                                                        </div>
                                                        <div class="col-md-4 col-sm-12 text-right">
                                                            <a href="task-add" data-toggle="modal" data-target="#task-add" class="bg-light-blue btn text-blue weight-500"><i class="ion-plus-round"></i>Add</a>
                                                        </div>
                                                    </div>
                                                    <div class="profile-task-list pb-30">
                                                        <ul>
                                                            <li>
                                                                <div class="custom-control custom-checkbox mb-5">
                                                                    <input type="checkbox" class="custom-control-input" id="task-1">
                                                                    <label class="custom-control-label" for="task-1"></label>
                                                                </div>
                                                                <div class="task-type">Email</div>
                                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Id ea earum.
																<div class="task-assign">
                                                                    Assigned to Ferdinand M.
                                                                    <div class="due-date">due date <span>22 February 2019</span></div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="custom-control custom-checkbox mb-5">
                                                                    <input type="checkbox" class="custom-control-input" id="task-2">
                                                                    <label class="custom-control-label" for="task-2"></label>
                                                                </div>
                                                                <div class="task-type">Email</div>
                                                                Lorem ipsum dolor sit amet.
																<div class="task-assign">
                                                                    Assigned to Ferdinand M.
                                                                    <div class="due-date">due date <span>22 February 2019</span></div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="custom-control custom-checkbox mb-5">
                                                                    <input type="checkbox" class="custom-control-input" id="task-3">
                                                                    <label class="custom-control-label" for="task-3"></label>
                                                                </div>
                                                                <div class="task-type">Email</div>
                                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
																<div class="task-assign">
                                                                    Assigned to Ferdinand M.
                                                                    <div class="due-date">due date <span>22 February 2019</span></div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="custom-control custom-checkbox mb-5">
                                                                    <input type="checkbox" class="custom-control-input" id="task-4">
                                                                    <label class="custom-control-label" for="task-4"></label>
                                                                </div>
                                                                <div class="task-type">Email</div>
                                                                Lorem ipsum dolor sit amet. Id ea earum.
																<div class="task-assign">
                                                                    Assigned to Ferdinand M.
                                                                    <div class="due-date">due date <span>22 February 2019</span></div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <!-- Open Task End -->

                                                    <!-- Close Task start -->
                                                    <!-- add task popup start -->

                                                    <!-- add task popup End -->
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Tasks Tab End -->
                                        <!-- Setting Tab start -->
                                        <div class="tab-pane fade height-100-p" id="setting" role="tabpanel">
                                            <div class="profile-setting">
                                                <form>
                                                    <ul class="profile-edit-list row">
                                                        <li class="weight-500 col-md-6">
                                                            <h4 class="text-blue h5 mb-20">Kişisel Bilgilerinizi Düzenleyin</h4>
                                                            <div class="form-group">
                                                                <label>İsim</label>

                                                                <asp:TextBox ID="txt_isim" class="form-control form-control-lg" runat="server"></asp:TextBox>
                                                            </div>

                                                            <div class="form-group">
                                                                <label>T.C. Kimlik Numarası</label>
                                                                <asp:TextBox ID="txt_tckn" class="form-control form-control-lg" runat="server"></asp:TextBox>
                                                                <%--  <input id="txt_tckn" class="form-control form-control-lg" type="text">--%>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Sicil Numarası</label>
                                                                <asp:TextBox ID="txtSicil" class="form-control form-control-lg" runat="server"></asp:TextBox>
                                                                <%--       <input id="txtSicil" class="form-control form-control-lg" type="text">--%>
                                                            </div>

                                                            <div class="form-group">
                                                                <label>Meslek</label>
                                                                <asp:DropDownList ID="ddlMeslek" class="selectpicker form-control form-control-lg" data-style="btn-outline-secondary btn-lg" runat="server"></asp:DropDownList>

                                                            </div>

                                                            <div class="form-group">
                                                                <label>Kullanıcı Adı</label>
                                                                <asp:TextBox ID="txtKullaniciAd" class="form-control form-control-lg" runat="server"></asp:TextBox>

                                                            </div>
                                                            <div class="form-group">
                                                                <label>E mail</label>
                                                                <asp:TextBox ID="txtEmail" class="form-control form-control-lg" runat="server"></asp:TextBox>
                                                            </div>

                                                            <div class="form-group">
                                                                <label>Şifre*</label>
                                                                <asp:TextBox ID="txtSifre" class="form-control form-control-lg" type="password" placeholder="*******" runat="server"></asp:TextBox>

                                                            </div>
                                                            <div class="form-group">
                                                                <label>Şifre Tekrar*</label>
                                                               <asp:TextBox ID="txtSifre2" class="form-control form-control-lg" type="password" placeholder="*******" runat="server"></asp:TextBox>
                                                            </div>

                                                            <div class="form-group mb-0">
                                                                <input type="submit" class="btn btn-primary" value="Bilgilerimi Güncelle+">
                                                            </div>

                                                        </li>
                                                    </ul>
                                                </form>
                                            </div>
                                        </div>
                                        <!-- Setting Tab End -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-wrap pd-20 mb-20 card-box">
                Uygunsuzluk Modülü By <a href="https://github.com/mavihub" target="_blank">Serkan Kocaman</a>
            </div>
        </div>
    </div>







</asp:Content>

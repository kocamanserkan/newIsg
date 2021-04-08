<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="devEx.aspx.cs" Inherits="serkanISG.devEx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="ISID" HeaderText="İş ID'si" />
                <asp:BoundField DataField="ISADI" HeaderText="İŞ Adı" />
                <asp:TemplateField HeaderText=" show edit pop up">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" CssClass="btn btn-danger" ID="link" CommandName="Select" CommandArgument='<%# Eval("ISID") %>' OnClick="link_Click">Düzenle</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>




        <asp:Button ID="lnk_delete" Text="sil" runat="server" OnClientClick="return fnConfirmDelete();" OnClick="lnk_delete_Click" />

        <script language="javascript" type="text/javascript">
            function fnConfirmDelete() {
                return confirm("Are you sure you want to delete this?");
            }
        </script>




        <div id="myModal" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <asp:Label ID="Label1" runat="server" Text="name:"></asp:Label><asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox><br />
                        <asp:Label ID="Label2" runat="server" Text="id:" /><asp:Label ID="Label3" runat="server" Text="Label" />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <%--   <button type="button" class="btn btn-primary">Save changes</button>--%>
                        <asp:Button Text="Kaydet" ID="Savee" CssClass="btn btn-primary" OnClick="Savee_Click" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

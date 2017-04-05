<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Cheshire._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row">
            <!--- slide bar-->
            <div id="slidebar">
                <a href="#cuoitrang" name="dautrang"></a>
                <ul>
                    <div class="slide">
                        <img src="img/slide0.jpg" style="width:100%; height:300px" />

                    </div>
                    <div class="slide">
                        <img src="img/slide1.png" style="width:100%; height:300px" />

                    </div>
                    <div class="slide">
                        <img src="img/slide2.jpg" style="width:100%; height:300px" />
                    </div>
                    <div class="slide">
                        <img src="img/slide3.jpg" style="width:100%; height:300px" />
                    </div>
                    <div class="slide">
                        <img src="img/slide4.jpg" style="width:100%; height:300px" />
                    </div>
                </ul>
            </div>
        </div>
        <!--- end slide bar-->
        
    <form id="form1" runat="server">
        <div class="row">
            <div class="title">♪ Sách bán chạy nhất </div>
            <asp:DataList ID="DataListBestSellers" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" Width="100%" OnItemCommand="DataListBestSellers_ItemCommand">
                <ItemTemplate>
                    <div class="">
                        <div class="thumbnail" style="margin-left:10px; margin-right:10px;">
                            <img src='<%#Eval("imgSach") %>' style="width:220px" alt="...">
                            <div class="caption" style="text-align:center">
                                <p>
                                    <asp:Label runat="server" id="lblMa" Visible="false" Text='<%#Eval("idSach") %>' />
                                    <a href='/sach.aspx?book=<%#Eval("idSach") %>'>
                                        <asp:Label ID="lblTen" Text='<%#Eval("tenSach") %>' runat="server" />
                                    </a>
                                </p>
                                <asp:Button Text="Thêm vào giỏ" CommandName="ibtMua" runat="server" class="btn btn-primary" />
                                <asp:Label ID="lblGia" Text='<%#Eval("giaSach") %>' runat="server" style="font-size:larger; margin-left:8%; font-weight:bold"/>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>

        <div class="row">
            <div class="title">♪ Sách mới</div>
            <asp:DataList ID="DataListNewBooks" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" Width="100%" OnItemCommand="DataListNewBooks_ItemCommand">
                <ItemTemplate>
                    <div class="">
                        <div class="thumbnail" style="margin-left:10px; margin-right:10px;">
                            <img src='<%#Eval("imgSach") %>' style="width:220px" alt="...">
                            <div class="caption" style="text-align:center">
                                <p>
                                    <asp:Label runat="server" id="lblMa" Visible="false" Text='<%#Eval("idSach") %>' />
                                    <a href='/sach.aspx?book=<%#Eval("idSach") %>'>
                                        <asp:Label ID="lblTen" Text='<%#Eval("tenSach") %>' runat="server" />
                                    </a>
                                </p>
                                <asp:Button Text="Thêm vào giỏ" CommandName="ibtMua" runat="server" class="btn btn-primary" />
                                <asp:Label ID="lblGia" Text='<%#Eval("giaSach") %>' runat="server" style="font-size:larger; margin-left:8%; font-weight:bold"/>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div class="row">
            <div class="title">♪ Sách nổi bật</div>
            <asp:DataList ID="DataListFeatureBooks" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" Width="100%" OnItemCommand="DataListFeatureBooks_ItemCommand">
                <ItemTemplate>
                    <div class="">
                        <div class="thumbnail" style="margin-left:10px; margin-right:10px;">
                            <img src='<%#Eval("imgSach") %>' style="width:220px" alt="...">
                            <div class="caption" style="text-align:center">
                                <p>
                                    <asp:Label runat="server" id="lblMa" Visible="false" Text='<%#Eval("idSach") %>' />
                                    <a href='/sach.aspx?book=<%#Eval("idSach") %>'>
                                        <asp:Label ID="lblTen" Text='<%#Eval("tenSach") %>' runat="server" />
                                    </a>
                                </p>
                                <asp:Button Text="Thêm vào giỏ" CommandName="ibtMua" runat="server" class="btn btn-primary" />
                                <asp:Label ID="lblGia" Text='<%#Eval("giaSach") %>' runat="server" style="font-size:larger; margin-left:8%; font-weight:bold"/>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </form>
    
</asp:Content>



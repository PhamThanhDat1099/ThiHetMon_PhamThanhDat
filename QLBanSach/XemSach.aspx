<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="XemSach.aspx.cs" Inherits="QLBanSach.XemSach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <h2>Trang xem sách</h2>
    <hr />

    <div class="form-inline">
        Chọn chủ đề:
        <asp:DropDownList ID="ddlChuDe" runat="server"
            DataSourceID="odsChuDe" DataTextField="TenCD" DataValueField="MaCD"
            CssClass="form-control" AutoPostBack="True">
        </asp:DropDownList>
    </div>

    <div class="row mt-2">
        <asp:Repeater ID="rptSach" runat="server" DataSourceID="odsSach">
            <ItemTemplate>
                <div class="col-md-4 text-center">
                    <img src="/Bia_sach/<%# Eval("Hinh") %>" style="width: 250px" />
                    <br />
                    <asp:Label ID="lbTen" runat="server" Text='<%# Eval("TenSach") %>'></asp:Label>  
                    <br />
                    Giá bán  
                    <asp:Label ID="lbGia" runat="server" ForeColor="#ff6600"
    Text='<%# Eval("KhuyenMai") != DBNull.Value && Convert.ToBoolean(Eval("KhuyenMai")) ? 
    (Convert.ToInt32(Eval("DonGia")) * 0.8).ToString("#,##0") + " đồng" : 
    Convert.ToInt32(Eval("DonGia")).ToString("#,##0") + " đồng" %>'>
</asp:Label>
  
                    <br />
                    <a href="XemChiTiet.aspx?MaSach=<%# Eval("MaSach") %>" class="btn btn-success">Xem chi tiết</a>
                    <a href="ThemVaoGio.aspx?MaSach=<%# Eval("MaSach") %>" class="btn btn-primary">Đặt mua</a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <!-- ObjectDataSource lấy danh sách chủ đề -->
    <asp:ObjectDataSource ID="odsChuDe" runat="server"
        SelectMethod="getAll"
        TypeName="QLBanSach.Models.ChuDeDAO"></asp:ObjectDataSource>

    <!-- ObjectDataSource lấy danh sách sách theo chủ đề -->
   <asp:ObjectDataSource ID="odsSach" runat="server" 
    SelectMethod="getByChuDe" TypeName="QLBanSach.Models.SachDAO">
    <SelectParameters>
        <asp:ControlParameter ControlID="ddlChuDe" Name="maCD" PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>


</asp:Content>


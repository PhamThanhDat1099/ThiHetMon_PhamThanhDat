<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ThemSach.aspx.cs" Inherits="QLBanSach.ThemSach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <h2>Thêm Sách</h2>
    <hr />

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />

   

    <div class="form-group">
        <label>Tên sách:</label>
        <asp:TextBox ID="txtTenSach" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvTenSach" runat="server" ControlToValidate="txtTenSach"
            ErrorMessage="Tên sách không được để trống" ForeColor="Red" Display="Dynamic" />
    </div>

    <div class="form-group">
        <label>Đơn giá:</label>
        <asp:TextBox ID="txtDonGia" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvDonGia" runat="server" ControlToValidate="txtDonGia"
            ErrorMessage="Đơn giá không được để trống" ForeColor="Red" Display="Dynamic" />
        <asp:RangeValidator ID="rvDonGia" runat="server" ControlToValidate="txtDonGia"
            MinimumValue="1" MaximumValue="100000000" Type="Integer"
            ErrorMessage="Đơn giá phải là số nguyên dương" ForeColor="Red" Display="Dynamic" />
    </div>
     <div class="form-group">
        <label>Chủ đề:</label>
        <asp:DropDownList ID="ddlChuDe" runat="server" CssClass="form-control"></asp:DropDownList>
    </div>

    <div class="form-group">
        <label>Hình ảnh:</label>
        <asp:FileUpload ID="fuHinh" runat="server" CssClass="form-control" />
        <asp:RequiredFieldValidator ID="rfvHinh" runat="server" ControlToValidate="fuHinh"
            ErrorMessage="Bạn cần chọn ảnh bìa" ForeColor="Red" Display="Dynamic" />
    </div>

    <div class="form-group">
        <asp:CheckBox ID="chkKhuyenMai" runat="server" Text="Khuyến mãi" />
    </div>

    <asp:Button ID="btnThem" runat="server" Text="Thêm Sách" CssClass="btn btn-primary" OnClick="btnThem_Click" />

    <asp:Label ID="lblThongBao" runat="server" ForeColor="Green"></asp:Label>

</asp:Content>

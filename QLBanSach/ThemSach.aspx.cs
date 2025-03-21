using QLBanSach.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBanSach
{
    public partial class ThemSach : System.Web.UI.Page
    {
        ChuDeDAO chudeDAO = new ChuDeDAO();
        SachDAO sachDAO = new SachDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadChuDe();
            }
        }

        private void LoadChuDe()
        {
            List<ChuDe> dsChuDe = chudeDAO.getAll();
            ddlChuDe.DataSource = dsChuDe;
            ddlChuDe.DataTextField = "TenCD";
            ddlChuDe.DataValueField = "MaCD";
            ddlChuDe.DataBind();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) 
            {
                try
                {
                 
                    string tenSach = txtTenSach.Text.Trim();
                    int donGia = Convert.ToInt32(txtDonGia.Text);
                    int maCD = Convert.ToInt32(ddlChuDe.SelectedValue);
                    bool khuyenMai = chkKhuyenMai.Checked;
                    string tenHinh = "";

                
                    if (fuHinh.HasFile)
                    {
                        tenHinh = fuHinh.FileName;
                        string path = Server.MapPath("~/Bia_sach/") + tenHinh;
                        fuHinh.SaveAs(path); 
                    }

                 
                    Sach sach = new Sach
                    {
                        TenSach = tenSach,
                        Dongia = donGia,
                        MaCD = maCD,
                        Hinh = tenHinh,
                        KhuyenMai = khuyenMai,
                        NgayCapNhat = DateTime.Now
                    };

                   
                    int ketQua = sachDAO.Insert(sach);

                    if (ketQua > 0)
                    {
                        lblThongBao.Text = "Thêm sách thành công!";
                    }
                    else
                    {
                        lblThongBao.Text = "Thêm sách thất bại!";
                    }
                }
                catch (Exception ex)
                {
                    lblThongBao.Text = "Lỗi: " + ex.Message;
                }
            }
        }
    }
}
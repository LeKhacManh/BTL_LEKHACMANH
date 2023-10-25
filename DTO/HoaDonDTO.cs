using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class HoaDonDTO
    {
        public int MaHoaDonBan { get; set; }
        public string MaKhachHang { get; set; }
        public DateTime NgayBan { get; set; }
        public float ThanhTien { get; set; }
        public int status { get; set; }
        public List<ChiTietHoaDonDTO> list_json_chitietdonhangban { get; set; }
    }
    public class ChiTietHoaDonDTO
    {
        public int MaChiTietHoaDon { get; set; }
        public int MaHoaDonBan { get; set; }
        public string MaHang { get; set; }
        public int SoLuong { get; set; }
        public float GiaBan { get; set; }

        
    }
}

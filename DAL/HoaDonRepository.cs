using DAL;
using DTO;


namespace DAL


{
    public class HoaDonRepository: IHoaDonRepository
    {
        private IDatabaseHelper _dbHelper;
        public HoaDonRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        public HoaDonDTO GetDatabyID(string id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "hoadonID",
                     "@MaHoaDonBan", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<HoaDonDTO>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Create(HoaDonDTO model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "hoadonCreate",
                "@NgayBan", model.NgayBan,
                "@MaKhachHang", model.MaKhachHang,
                "@ThanhTien", model.ThanhTien,
                "@list_json_chitietdonhangban", model.list_json_chitietdonhangban != null ? MessageConvert.SerializeObject(model.list_json_chitietdonhangban) : null) ;
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Update(HoaDonDTO model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "hoadonUpdate",
                "@MaHoaDonBan", model.MaHoaDonBan,
                "@NgayBan", model.NgayBan,
                "@MaKhachHang", model.MaKhachHang,
                "@ThanhTien", model.ThanhTien,
                "@list_json_chitietdonhangban", model.list_json_chitietdonhangban != null ? MessageConvert.SerializeObject(model.list_json_chitietdonhangban) : null);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<ThongKeKhachDTO> Search(int pageIndex, int pageSize, out long total, string ten_khach, DateTime? fr_NgayTao, DateTime? to_NgayTao)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_thong_ke_khach",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@ten_khach", ten_khach,
                    "@fr_NgayTao", fr_NgayTao,
                    "@to_NgayTao", to_NgayTao
                     );
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<ThongKeKhachDTO>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public bool Delete(string MaHoaDon)
        {
            string msgError = "";
            bool kq; // Khởi tạo mặc định là false
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedure(out msgError, "XoaHoaDonBan",
                     "@MaHoaDonBan", MaHoaDon);
                // Kiểm tra kết quả trả về từ hàm ExecuteScalarSProcedureWithTransaction
                if (Convert.ToInt32(result) > 0)
                {
                    kq = true; // Xóa thành công, đặt kq thành true
                }
                else
                {
                    kq = false;
                }
                return kq;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}

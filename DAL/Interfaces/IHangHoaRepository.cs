using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;

namespace DAL.Interfaces
{
    public partial interface IHangHoaRepository
    {
        HangHoaDTO GetDataById(string id);
        bool Create(HangHoaDTO model);
        bool Update(HangHoaDTO model);
        bool Delete(int id);
        public List<ThongKeKhachModel> Search(int pageIndex, int pageSize, out long total, string ten_khach, DateTime? fr_NgayTao, DateTime? to_NgayTao);
    }
}

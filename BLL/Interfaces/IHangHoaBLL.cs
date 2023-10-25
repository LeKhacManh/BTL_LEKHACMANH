using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public partial interface IHangHoaBLL
    {
        HangHoaDTO GetDatabyID(string id);
        bool Create(HangHoaDTO model);
        bool Update(HangHoaDTO model);
        bool Delete(int id);
    }
}

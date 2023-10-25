using BLL.Interfaces;
using DAL.Interfaces;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class HangHoaBLL : IHangHoaBLL
    {
        private IHangHoaRepository _res;
        public HangHoaBLL(IHangHoaRepository res)
        {
            _res = res;
        }

        public HangHoaDTO GetDatabyID(string id)
        {
            return _res.GetDataById(id);
        }
        public bool Create(HangHoaDTO model)
        {
            return _res.Create(model);
        }
        public bool Update(HangHoaDTO model)
        {
            return _res.Update(model);
        }
        public bool Delete(int id)
        {
            return _res.Delete(id);
        }

    }
}

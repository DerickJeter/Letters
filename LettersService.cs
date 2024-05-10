using Sabio.Data;
using Sabio.Data.Providers;
using Sabio.Models;
using Sabio.Models.Domain;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sabio.Services
{
    public class LettersService : ILettersService
    {
        IDataProvider _data = null;
        public LettersService(IDataProvider data)
        {
            _data = data;
        }
        public Paged<Letters> GetAllPagination(int pageIndex, int pageSize)
        {
            Paged<Letters> pagedList = null;
            List<Letters> lettersList = null;
            int totalCount = 0;

            string procName = "[dbo].[Letters_Pagination]";
            _data.ExecuteCmd(procName, delegate (SqlParameterCollection parameterCollection)
            {
                parameterCollection.AddWithValue("@pageIndex", pageIndex);
                parameterCollection.AddWithValue("@pageSize", pageSize);
            },
            delegate (IDataReader reader, short set)
            {
                int index = 0;
                Letters letters = Mapper(reader, ref index);
                if (totalCount==0) totalCount = reader.GetSafeInt32(index++);
                if (lettersList == null)
                {
                    lettersList = new List<Letters>();
                }
                lettersList.Add(letters);
            });
            if (lettersList != null)
            {
                pagedList = new Paged<Letters>(lettersList, pageIndex, pageSize, totalCount);
            }
            return pagedList;
        }

        private static Letters Mapper(IDataReader reader, ref int index)
        {
            Letters letters = new Letters();

            letters.Id = reader.GetSafeInt32(index++);
            letters.Letter = reader.GetSafeString(index++);
            letters.Image = reader.GetSafeString(index++);
            letters.Sound = reader.GetSafeString(index++);

            return letters;
        }
    }
}

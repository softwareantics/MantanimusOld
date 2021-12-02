// <copyright file="IUserAccountDatabase.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.API.Database
{
    using Mantanimus.API.Models;

    public interface IUserAccountDatabase
    {
        void SaveChanges();

        bool TryAdd(UserAccount userAccount);

        bool TryGet(string username, out UserAccount userAccount);

        bool TryGet(long id, out UserAccount userAccount);

        void Update(UserAccount userAccount);
    }
}
// <copyright file="UserAccountDatabase.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.API.Database
{
    using System;
    using Mantanimus.API.Models;
    using Mantanimus.API.Security;
    using Microsoft.EntityFrameworkCore;

    public sealed class UserAccountDatabase : DbContext, IUserAccountDatabase
    {
        public UserAccountDatabase(DbContextOptions<UserAccountDatabase> options, IPasswordHasher hasher)
            : base(options)
        {
            this.UserAccounts.Add(new UserAccount()
            {
                FirstName = "Mathew",
                LastName = "O'LastName",
                Email = "mathew.olastname@gmail.com",
                Username = "tdkr80",
                Hash = hasher.Hash("MyPassword!@12"),
            });

            this.SaveChanges();
        }

        public DbSet<UserAccount> UserAccounts { get; set; }

        void IUserAccountDatabase.SaveChanges()
        {
            this.SaveChanges();
        }

        public bool TryAdd(UserAccount userAccount)
        {
            if (userAccount == null)
            {
                throw new ArgumentNullException(nameof(userAccount), $"The specified {nameof(userAccount)} parameter cannot be null.");
            }

            foreach (UserAccount user in this.UserAccounts)
            {
                if (user.Username == userAccount.Username ||
                    user.Email == userAccount.Email)
                {
                    return false;
                }
            }

            this.UserAccounts.Add(userAccount);

            return true;
        }

        public bool TryGet(string username, out UserAccount userAccount)
        {
            if (string.IsNullOrWhiteSpace(username))
            {
                throw new ArgumentNullException(nameof(username), $"The specified {nameof(username)} parameter cannot be null, empty or consist of only whitespace characters.");
            }

            foreach (UserAccount user in this.UserAccounts)
            {
                if (user.Username == username)
                {
                    userAccount = user;

                    return true;
                }
            }

            userAccount = null;

            return false;
        }

        public bool TryGet(long id, out UserAccount userAccount)
        {
            foreach (UserAccount user in this.UserAccounts)
            {
                if (user.ID == id)
                {
                    userAccount = user;

                    return true;
                }
            }

            userAccount = null;

            return false;
        }

        public void Update(UserAccount userAccount)
        {
            if (userAccount == null)
            {
                throw new ArgumentNullException(nameof(userAccount), $"The specified {nameof(userAccount)} parameter cannot be null.");
            }

            this.UserAccounts.Update(userAccount);
        }
    }
}
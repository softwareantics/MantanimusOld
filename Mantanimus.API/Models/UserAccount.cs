// <copyright file="UserAccount.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.API.Models
{
    using System;

    public sealed class UserAccount
    {
        public string Email { get; set; }

        public string FirstName { get; set; }

        public string Hash { get; set; }

        public long ID { get; set; }

        public DateTime LastLoginAttemptTime { get; set; }

        public DateTime LastLoginTime { get; set; }

        public string LastName { get; set; }

        public bool LoggedIn { get; set; }

        public int LoginAttempts { get; set; }

        public string Token { get; set; }

        public DateTime TokenTime { get; set; }

        public string Username { get; set; }
    }
}
// <copyright file="BcryptPasswordHasher.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.API.Security.Bcrypt
{
    using System;
    using BCrypt.Net;

    public sealed class BcryptPasswordHasher : IPasswordHasher
    {
        public string Hash(string password)
        {
            if (string.IsNullOrWhiteSpace(password))
            {
                throw new ArgumentNullException(nameof(password), $"The specified {nameof(password)} parameter cannot be null, empty or consist of only whitespace characters.");
            }

            return BCrypt.HashPassword(password);
        }
    }
}
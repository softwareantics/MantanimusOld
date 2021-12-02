// <copyright file="BcryptPasswordVerifier.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.API.Security.Bcrypt
{
    using System;
    using BCrypt.Net;

    public sealed class BcryptPasswordVerifier : IPasswordVerifier
    {
        public bool Verify(string password, string hash)
        {
            if (string.IsNullOrWhiteSpace(password))
            {
                throw new ArgumentNullException(nameof(password), $"The specified {nameof(password)} parameter cannot be null, empty or consist of only whitespace characters.");
            }

            if (string.IsNullOrWhiteSpace(hash))
            {
                throw new ArgumentNullException(nameof(hash), $"The specified {nameof(hash)} parameter cannot be null, empty or consist of only whitespace characters.");
            }

            return BCrypt.Verify(password, hash);
        }
    }
}
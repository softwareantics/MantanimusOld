// <copyright file="RNGCryptoSecureTokenFactory.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.API.Security.RNG
{
    using System;
    using System.Security.Cryptography;

    public sealed class RNGCryptoSecureTokenFactory : ISecureTokenFactory
    {
        private readonly RNGCryptoServiceProvider serviceProvider;

        public RNGCryptoSecureTokenFactory()
        {
            this.serviceProvider = new RNGCryptoServiceProvider();
        }

        public string CreateToken(uint length = 15)
        {
            if (length > 19)
            {
                throw new ArgumentOutOfRangeException(nameof(length), length, $"The specified {nameof(length)} parameter must be less than 19, which corresponds to the maximum number of digits a 64-bit integer can contain.");
            }

            byte[] buffer = new byte[length];
            this.serviceProvider.GetBytes(buffer);

            return BitConverter.ToInt64(buffer).ToString();
        }
    }
}
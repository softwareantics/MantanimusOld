// <copyright file="IPasswordVerifier.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.API.Security
{
    public interface IPasswordVerifier
    {
        bool Verify(string password, string hash);
    }
}
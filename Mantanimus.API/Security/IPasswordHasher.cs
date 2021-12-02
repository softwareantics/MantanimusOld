// <copyright file="IPasswordHasher.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.API.Security
{
    public interface IPasswordHasher
    {
        string Hash(string password);
    }
}
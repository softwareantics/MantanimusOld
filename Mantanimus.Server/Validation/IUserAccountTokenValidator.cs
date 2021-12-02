// <copyright file="IUserAccountTokenValidator.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.Server.Users
{
    using System.Threading.Tasks;
    using Mantanimus.Server.Requests;

    public interface IUserAccountTokenValidator
    {
        Task<bool> Validate(ValidationRequest request);
    }
}
// <copyright file="IUserAccountTokenValidator.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.API.Validation
{
    using Mantanimus.API.Requests;

    public interface IUserAccountTokenValidator
    {
        bool Validate(ValidationRequest request);
    }
}
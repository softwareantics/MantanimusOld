// <copyright file="IUserAccountAuthenticator.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.API.Authentication
{
    using Mantanimus.API.Requests;
    using Mantanimus.API.Responses;

    public interface IUserAccountAuthenticator
    {
        AuthenticationResponse Authenticate(AuthenticationRequest request);
    }
}
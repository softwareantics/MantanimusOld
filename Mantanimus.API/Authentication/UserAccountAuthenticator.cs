// <copyright file="UserAccountAuthenticator.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.API.Authentication
{
    using System;
    using Mantanimus.API.Database;
    using Mantanimus.API.Models;
    using Mantanimus.API.Requests;
    using Mantanimus.API.Responses;
    using Mantanimus.API.Security;

    public sealed class UserAccountAuthenticator : IUserAccountAuthenticator
    {
        private const int MaximumLoginAttempts = 5;

        private const int MaximumLoginTimeOut = 10;

        private readonly IUserAccountDatabase database;

        private readonly ISecureTokenFactory factory;

        private readonly IPasswordVerifier verifier;

        public UserAccountAuthenticator(IUserAccountDatabase database, ISecureTokenFactory factory, IPasswordVerifier verifier)
        {
            this.database = database ?? throw new ArgumentNullException(nameof(database), $"The specified {nameof(database)} parameter cannot be null.");
            this.factory = factory ?? throw new ArgumentNullException(nameof(factory), $"The specified {nameof(factory)} parameter cannot be null.");
            this.verifier = verifier ?? throw new ArgumentNullException(nameof(verifier), $"The specified {nameof(verifier)} parameter cannot be null.");
        }

        public AuthenticationResponse Authenticate(AuthenticationRequest request)
        {
            if (request == null)
            {
                throw new ArgumentNullException(nameof(request), $"The specified {nameof(request)} parameter cannot be null.");
            }

            if (!this.database.TryGet(request.Username, out UserAccount userAccount))
            {
                return new AuthenticationResponse(AuthenticationResponseCode.InvalidCredentials);
            }

            if (userAccount.LoginAttempts == MaximumLoginAttempts &&
                userAccount.LastLoginAttemptTime.AddMinutes(MaximumLoginTimeOut) > DateTime.Now)
            {
                return new AuthenticationResponse(AuthenticationResponseCode.MaxLoginAttempts)
                {
                    WaitTime = userAccount.LastLoginAttemptTime.AddMinutes(MaximumLoginTimeOut) - DateTime.Now,
                };
            }

            userAccount.LoginAttempts++;
            userAccount.LastLoginAttemptTime = DateTime.Now;

            this.database.Update(userAccount);
            this.database.SaveChanges();

            if (!this.verifier.Verify(request.Password, userAccount.Hash))
            {
                return new AuthenticationResponse(AuthenticationResponseCode.InvalidCredentials);
            }

            if (userAccount.LoggedIn)
            {
                return new AuthenticationResponse(AuthenticationResponseCode.AlreadyLoggedIn);
            }

            userAccount.LoginAttempts = 0;
            userAccount.LastLoginAttemptTime = DateTime.MinValue;

            userAccount.Token = this.factory.CreateToken();
            userAccount.TokenTime = DateTime.Now;

            this.database.Update(userAccount);
            this.database.SaveChanges();

            return new AuthenticationResponse(AuthenticationResponseCode.Authenticated)
            {
                Identifier = userAccount.ID,
                Token = userAccount.Token,
            };
        }
    }
}
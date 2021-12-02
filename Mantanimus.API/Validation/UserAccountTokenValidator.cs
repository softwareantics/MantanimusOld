// <copyright file="UserAccountTokenValidator.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.API.Validation
{
    using System;
    using Mantanimus.API.Database;
    using Mantanimus.API.Models;
    using Mantanimus.API.Requests;

    public sealed class UserAccountTokenValidator : IUserAccountTokenValidator
    {
        private const int TokenExpiryTime = 15;

        private readonly IUserAccountDatabase database;

        public UserAccountTokenValidator(IUserAccountDatabase database)
        {
            this.database = database ?? throw new ArgumentNullException(nameof(database), $"The specified {nameof(database)} parameter cannot be null.");
        }

        public bool Validate(ValidationRequest request)
        {
            if (request == null)
            {
                throw new ArgumentNullException(nameof(request), $"The specified {nameof(request)} parameter cannot be null.");
            }

            if (!this.database.TryGet(request.Identifier, out UserAccount userAccount))
            {
                return false;
            }

            if (userAccount.Token == request.Token && userAccount.TokenTime.AddSeconds(TokenExpiryTime) > DateTime.Now)
            {
                userAccount.Token = string.Empty;
                userAccount.TokenTime = DateTime.MinValue;

                userAccount.LoggedIn = true;
                userAccount.LastLoginTime = DateTime.Now;

                this.database.Update(userAccount);
                this.database.SaveChanges();

                return true;
            }

            return false;
        }
    }
}
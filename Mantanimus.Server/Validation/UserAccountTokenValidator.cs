// <copyright file="UserAccountTokenValidator.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.Server.Validation
{
    using System;
    using System.Net.Http;
    using System.Threading.Tasks;
    using Mantanimus.Server.Requests;
    using Mantanimus.Server.Users;

    public sealed class UserAccountTokenValidator : IUserAccountTokenValidator
    {
        public async Task<bool> Validate(ValidationRequest request)
        {
            using (HttpResponseMessage response = await ApiHelper.ApiClient.PostAsJsonAsync("UserAccounts/validate", request))
            {
                if (response.IsSuccessStatusCode)
                {
                    return await response.Content.ReadAsAsync<bool>().ConfigureAwait(false);
                }
                else
                {
                    throw new Exception(response.ReasonPhrase);
                }
            }
        }
    }
}
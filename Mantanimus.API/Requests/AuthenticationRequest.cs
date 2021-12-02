// <copyright file="AuthenticationRequest.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.API.Requests
{
    using System;
    using System.Text.Json.Serialization;

    public sealed class AuthenticationRequest
    {
        public AuthenticationRequest(string username, string password)
        {
            if (string.IsNullOrWhiteSpace(username))
            {
                throw new ArgumentNullException(nameof(username), $"The specified {nameof(username)} parameter cannot be null, empty or consist of only whitespace characters.");
            }

            if (string.IsNullOrWhiteSpace(password))
            {
                throw new ArgumentNullException(nameof(password), $"The specified {nameof(password)} parameter cannot be null, empty or consist of only whitespace characters.");
            }

            this.Username = username;
            this.Password = password;
        }

        [JsonPropertyName("password")]
        public string Password { get; init; }

        [JsonPropertyName("username")]
        public string Username { get; init; }
    }
}
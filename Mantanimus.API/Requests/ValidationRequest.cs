// <copyright file="ValidationRequest.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.API.Requests
{
    using System;
    using System.Text.Json.Serialization;

    public sealed class ValidationRequest
    {
        public ValidationRequest(long identifier, string token)
        {
            if (string.IsNullOrWhiteSpace(token))
            {
                throw new ArgumentNullException(nameof(token), $"The specified {nameof(token)} parameter cannot be null, empty or consist of only whitespace characters.");
            }

            this.Identifier = identifier;
            this.Token = token;
        }

        [JsonPropertyName("identifier")]
        public long Identifier { get; init; }

        [JsonPropertyName("token")]
        public string Token { get; init; }
    }
}
// <copyright file="AuthenticationResponse.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.API.Responses
{
    using System;
    using System.Text.Json.Serialization;

    public enum AuthenticationResponseCode
    {
        InvalidCredentials = 0,

        AlreadyLoggedIn = 1,

        MaxLoginAttempts = 2,

        Authenticated = 3,
    }

    public sealed class AuthenticationResponse
    {
        public AuthenticationResponse(AuthenticationResponseCode code)
        {
            this.Code = code;
        }

        [JsonPropertyName("code")]
        public AuthenticationResponseCode Code { get; init; }

        [JsonPropertyName("identifier")]
        public long Identifier { get; init; }

        [JsonPropertyName("token")]
        public string Token { get; init; }

        [JsonPropertyName("wait_time")]
        public TimeSpan WaitTime { get; init; }
    }
}
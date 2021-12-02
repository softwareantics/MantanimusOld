// <copyright file="ValidationRequest.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.Server.Requests
{
    using System.Runtime.Serialization;

    public sealed class ValidationRequest
    {
        //// TODO: Change to init, use C# 9, .NET 5, nullable. Make constructor as well.

        [DataMember(Name = "identifier")]
        public long Identifier { get; set; }

        [DataMember(Name = "token")]
        public string Token { get; set; }
    }
}
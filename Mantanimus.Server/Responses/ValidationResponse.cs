// <copyright file="ValidationResponse.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.Server.Responses
{
    using System.Runtime.Serialization;

    public sealed class ValidationResponse
    {
        [DataMember(Name = "is_valid")]
        public bool IsValid { get; set; }
    }
}
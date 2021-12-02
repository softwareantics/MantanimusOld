// <copyright file="ValidationRequestPacketHandler.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.Server.Handlers
{
    using System;
    using System.Threading.Tasks;
    using Mantanimus.Server.Requests;
    using Mantanimus.Server.Responses;
    using Mantanimus.Server.Users;
    using Networker.Common;
    using Networker.Common.Abstractions;

    public sealed class ValidationRequestPacketHandler : PacketHandlerBase<ValidationRequest>
    {
        private readonly IUserAccountTokenValidator validator;

        public ValidationRequestPacketHandler(IUserAccountTokenValidator validator)
        {
            this.validator = validator ?? throw new ArgumentNullException(nameof(validator), $"The specified {nameof(validator)} parameter cannot be null.");
        }

        public override Task Process(ValidationRequest packet, IPacketContext context)
        {
            return Task.Run(() =>
            {
                context.Sender.Send(new ValidationResponse()
                {
                    IsValid = this.validator.Validate(packet).Result,
                });
            });
        }
    }
}
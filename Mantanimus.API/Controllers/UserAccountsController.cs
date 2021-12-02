namespace Mantanimus.API.Controllers
{
    using System;
    using Mantanimus.API.Authentication;
    using Mantanimus.API.Requests;
    using Mantanimus.API.Responses;
    using Mantanimus.API.Validation;
    using Microsoft.AspNetCore.Mvc;

    [Route("api/[controller]")]
    [ApiController]
    public class UserAccountsController : ControllerBase
    {
        private readonly IUserAccountAuthenticator authenticator;

        private readonly IUserAccountTokenValidator validator;

        public UserAccountsController(IUserAccountAuthenticator authenticator, IUserAccountTokenValidator validator)
        {
            this.authenticator = authenticator ?? throw new ArgumentNullException(nameof(authenticator), $"The specified {nameof(authenticator)} parameter cannot be null.");
            this.validator = validator ?? throw new ArgumentNullException(nameof(validator), $"The specified {nameof(validator)} parameter cannot be null.");
        }

        [HttpPost("authenticate")]
        public AuthenticationResponse Authenticate(AuthenticationRequest request)
        {
            return this.authenticator.Authenticate(request);
        }

        [HttpPost("validate")]
        public bool Validate(ValidationRequest request)
        {
            return this.validator.Validate(request);
        }
    }
}
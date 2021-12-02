// <copyright file="Startup.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.API
{
    using System;
    using Mantanimus.API.Authentication;
    using Mantanimus.API.Database;
    using Mantanimus.API.Security;
    using Mantanimus.API.Security.Bcrypt;
    using Mantanimus.API.Security.RNG;
    using Mantanimus.API.Validation;
    using Microsoft.AspNetCore.Builder;
    using Microsoft.AspNetCore.Hosting;
    using Microsoft.EntityFrameworkCore;
    using Microsoft.Extensions.Configuration;
    using Microsoft.Extensions.DependencyInjection;
    using Microsoft.Extensions.Hosting;
    using Microsoft.OpenApi.Models;

    public sealed class Startup
    {
        public Startup(IConfiguration configuration)
        {
            this.Configuration = configuration ?? throw new ArgumentNullException(nameof(configuration), $"The specified {nameof(configuration)} parameter cannot be null.");
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder application, IWebHostEnvironment environment)
        {
            if (application == null)
            {
                throw new ArgumentNullException(nameof(application), $"The specified {nameof(application)} parameter cannot be null.");
            }

            if (environment == null)
            {
                throw new ArgumentNullException(nameof(environment), $"The specified {nameof(environment)} parameter cannot be null.");
            }

            if (environment.IsDevelopment())
            {
                application.UseDeveloperExceptionPage();
                application.UseSwagger();
                application.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "WebApplication1 v1"));
            }

            application.UseHttpsRedirection();
            application.UseRouting();
            application.UseAuthorization();

            application.UseEndpoints(endpoints => endpoints.MapControllers());
        }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            if (services == null)
            {
                throw new ArgumentNullException(nameof(services), $"The specified {nameof(services)} parameter cannot be null.");
            }

            services.AddDbContext<IUserAccountDatabase, UserAccountDatabase>(o => o.UseInMemoryDatabase("UserAccounts"), ServiceLifetime.Singleton);

            services.AddSingleton<IPasswordHasher, BcryptPasswordHasher>();
            services.AddSingleton<IPasswordVerifier, BcryptPasswordVerifier>();
            services.AddSingleton<ISecureTokenFactory, RNGCryptoSecureTokenFactory>();

            services.AddSingleton<IUserAccountAuthenticator, UserAccountAuthenticator>();
            services.AddSingleton<IUserAccountTokenValidator, UserAccountTokenValidator>();

            services.AddControllers();
            services.AddSwaggerGen(c => c.SwaggerDoc("v1", new OpenApiInfo { Title = "WebApplication1", Version = "v1" }));
        }
    }
}
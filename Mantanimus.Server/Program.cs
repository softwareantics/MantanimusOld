// <copyright file="Program.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.Server
{
    using System;
    using Mantanimus.Server.Handlers;
    using Mantanimus.Server.Requests;
    using Mantanimus.Server.Users;
    using Mantanimus.Server.Validation;
    using Microsoft.Extensions.DependencyInjection;
    using Microsoft.Extensions.Logging;
    using Networker.Extensions.Json;
    using Networker.Server;
    using Networker.Server.Abstractions;

    internal static class Program
    {
        private static IServiceCollection ConfigureServices()
        {
            var serivces = new ServiceCollection();

            serivces.AddSingleton<IUserAccountTokenValidator, UserAccountTokenValidator>();

            return serivces;
        }

        private static void Main(string[] args)
        {
            const int Port = 59875;

            IServer server = new ServerBuilder()
                .UseTcp(Port)
                .ConfigureLogging(x => x.AddConsole())
                .SetServiceCollection(ConfigureServices())
                .RegisterPacketHandler<ValidationRequest, ValidationRequestPacketHandler>()
                .UseJson()
                .Build();

            server.Start();

            while (server.Information.IsRunning)
            {
                if (Console.ReadKey().Key == ConsoleKey.Escape)
                {
                    server.Stop();
                }
            }
        }
    }
}
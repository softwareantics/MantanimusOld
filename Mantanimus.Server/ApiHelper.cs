// <copyright file="ApiHelper.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace Mantanimus.Server
{
    using System;
    using System.Net.Http;
    using System.Net.Http.Headers;

    public static class ApiHelper
    {
        static ApiHelper()
        {
            ApiClient = new HttpClient
            {
                BaseAddress = new Uri("https://localhost:44302/api/"),
            };

            ApiClient.DefaultRequestHeaders.Accept.Clear();
            ApiClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        }

        public static HttpClient ApiClient { get; private set; }
    }
}
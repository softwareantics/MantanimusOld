// <copyright file="RegexExport.cs" company="Software Antics">
//     Copyright (c) Software Antics. All rights reserved.
// </copyright>

namespace GMRegex
{
    using System.Runtime.InteropServices;
    using System.Text.RegularExpressions;
    using RGiesecke.DllExport;

    /// <summary>
    ///   Provides external functions for handling regular expression patterns within Game Maker.
    /// </summary>
    public static class RegexExport
    {
        /// <summary>
        ///   Determines whether the specified <paramref name="input"/> matches the specified regex <paramref name="pattern"/>.
        /// </summary>
        /// <param name="input">
        ///   The input string to search for a match.
        /// </param>
        /// <param name="pattern">
        ///   The regular expression pattern to match.
        /// </param>
        /// <returns>
        ///   Returns a value of 1, if successful; otherwise, 0.
        /// </returns>
        [DllExport("IsMatch", CallingConvention.Cdecl)]
        public static double IsMatch(string input, string pattern)
        {
            var regex = new Regex(pattern);
            return regex.IsMatch(input) ? 1 : 0;
        }
    }
}
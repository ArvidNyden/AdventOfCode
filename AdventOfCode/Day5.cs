using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Diagnostics;
using System.Text;
using System.Linq;

namespace AdventOfCode
{
    [TestClass]
    public class Day5
    {
        [TestMethod]
        public void Part1()
        {
            var input = "reyedfim";
            var code = "";
            for (int i = 0; code.Length <= 8; i++)
            {
                var hash = CalculateMD5Hash(input + i);

                if (hash.StartsWith("00000"))
                    code += hash.Substring(5, 1);
            }
        }
        [TestMethod]
        public void Part2()
        {
            var input = "reyedfim";
            String[] code = new String[8];
            for (int i = 0; code.Length <= 8; i++)
            {
                var hash = CalculateMD5Hash(input + i);

                if (!hash.StartsWith("00000"))
                    continue;

                var position = hash.Substring(5, 1);
                var c = hash.Substring(6, 1);

                if (int.TryParse(position, out var resPos))
                    if (resPos < 8 && code[resPos] == null)
                        code[resPos] = c;

                if (!code.Contains(null))
                    Assert.IsNotNull(code); // Done
            }
        }

        public string CalculateMD5Hash(string input)

        {
            // step 1, calculate MD5 hash from input

            var md5 = System.Security.Cryptography.MD5.Create();

            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);

            byte[] hash = md5.ComputeHash(inputBytes);

            // step 2, convert byte array to hex string

            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < hash.Length; i++)

            {

                sb.Append(hash[i].ToString("X2"));

            }

            return sb.ToString();

        }
    }

}

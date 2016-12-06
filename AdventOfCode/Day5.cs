using Microsoft.VisualStudio.TestTools.UnitTesting;
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
            for (var i = 0; code.Length <= 8; i++)
            {
                var hash = CalculateMd5Hash(input + i);

                if (hash.StartsWith("00000"))
                    code += hash.Substring(5, 1);
            }
        }
        [TestMethod]
        public void Part2()
        {
            const string input = "reyedfim";
            var code = new string[8];
            for (var i = 0; code.Length <= 8; i++)
            {
                var hash = CalculateMd5Hash(input + i);

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

        public string CalculateMd5Hash(string input)

        {
            // step 1, calculate MD5 hash from input

            var md5 = System.Security.Cryptography.MD5.Create();

            var inputBytes = Encoding.ASCII.GetBytes(input);

            var hash = md5.ComputeHash(inputBytes);

            // step 2, convert byte array to hex string

            var sb = new StringBuilder();

            foreach (var t in hash)
            {
                sb.Append(t.ToString("X2"));
            }

            return sb.ToString();

        }
    }

}

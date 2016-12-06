using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Diagnostics;
using System.Text;
using System.Linq;

namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethodDay6()
        {
            string[] lines = System.IO.File.ReadAllLines("day5.txt");
            var code = "";
            for(int i = 0; i < lines.First().Length; i++)
            {
                code += lines
                    .Select(s => s[i])
                    .GroupBy(x => x)
                    .OrderBy(x => x.Count())
                    .First()
                    .Key;
            }

            Debug.Write($"Asnwer: {code}");
        }
        [TestMethod]
        public void TestMethodDay5()
        {
            var input = "reyedfim";
            var code = "";
            var md5 = System.Security.Cryptography.MD5.Create();
            for (int i = 0;code.Length <= 8;i++)
            {
                var hash = CalculateMD5Hash(input + i);

                if (hash.StartsWith("00000"))
                    code += hash.Substring(5, 1);
            }
        }
        [TestMethod]
        public void TestMethodDay5_2()
        {
            var input = "reyedfim";
            String[] code = new String[8];
            var md5 = System.Security.Cryptography.MD5.Create();
            for (int i = 0; code.Length <= 8; i++)
            {
                var hash = CalculateMD5Hash(input + i);

                if (hash.StartsWith("00000"))
                {
                    var position = hash.Substring(5, 1);
                    var c = hash.Substring(6, 1);
                    if (int.TryParse(position, out var resPos))
                    {
                        if (resPos < 8 && code[resPos] == null)
                            code[resPos] = c;
                    }
                    if (!code.Contains(null))
                    {
                        Console.WriteLine("Success: " + code);
                    }
                }
            }
        }

        [TestMethod]
        public void TestMethodDay4()
        {

            string[] lines = System.IO.File.ReadAllLines("day4.txt");

            foreach(var line in lines)
            {
                var intCode = Int32.Parse(line.Substring(line.Length - 10, 3));

                var test = line.Substring(0, line.Length - 11);

                var result = "";
                foreach (var t in test.ToCharArray())
                {
                    if (t == '-')
                    {
                        result += " ";
                        continue;
                    }
                    var newStr = t;
                    for (var i = 0; i < intCode; i++)
                    {
                        newStr = MoveForward(newStr);
                    }

                    result += newStr.ToString();
                }

                if (result.Contains("nort") || result.Contains("pole"))
                {
                    Console.WriteLine($"{result} {intCode}");
                }
            }

            Assert.AreEqual(MoveForward('b'), 'c');
            Assert.AreEqual(MoveForward('z'), 'a');
        }

        public char MoveForward(char str)
        {
            char letter = str;

            if (letter == 'z')
                return 'a';
            else
                return (char)(letter + 1);
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

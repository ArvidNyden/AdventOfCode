using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace AdventOfCode
{
    [TestClass]
    public class Day4
    {
        [TestMethod]
        public void Part2()
        {
            foreach(var line in System.IO.File.ReadAllLines("input/day4.txt"))
            {
                var intCode = Int32.Parse(line.Substring(line.Length - 10, 3));

                var result = "";
                foreach (var t in line.Substring(0, line.Length - 11).ToCharArray())
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
                    Assert.IsNotNull(intCode); // Done!
            }
        }
        public char MoveForward(char str)
        {
            var letter = str;

            if (letter == 'z')
                return 'a';
            else
                return (char)(letter + 1);
        }
    }
    
}

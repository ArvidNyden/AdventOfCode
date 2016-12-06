using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Linq;

namespace AdventOfCode
{
    [TestClass]
    public class Day6
    {
        [TestMethod]
        public void Part1()
        {
            var lines = System.IO.File.ReadAllLines("input/day5.txt");
            var code = "";
            for (var i = 0; i < lines.First().Length; i++)
                code += lines .Select(s => s[i]).GroupBy(x => x).OrderByDescending(x => x.Count()).First().Key;

            Assert.IsNotNull(code);
        }
        [TestMethod]
        public void Part2()
        {
            var lines = System.IO.File.ReadAllLines("input/day5.txt");
            var code = "";
            for (var i = 0; i < lines.First().Length; i++)
                code += lines.Select(s => s[i]).GroupBy(x => x).OrderBy(x => x.Count()).First().Key;

            Assert.IsNotNull(code);
        }
    }
}

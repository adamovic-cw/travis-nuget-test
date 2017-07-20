using NUnit.Framework;
using System;
using Travis.Nuget.Example;

namespace Travis.Nuget.Example.Test
{
    [TestFixture()]
    public class Test
    {
        [Test()]
        public void TestCase()
        {
            ImmutableClass name = new ImmutableClass("dummy");   
        }
    }
}

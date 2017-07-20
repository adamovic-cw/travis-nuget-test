using System;

namespace Travis.Nuget.Example
{
	/// <summary>
	/// Test class.
	/// </summary>
	public class ImmutableClass
    {

        public ImmutableClass(string name)
        {
            _name = name;
        }

		private readonly string _name;

		public string Name { get { return _name; } }

	}
}

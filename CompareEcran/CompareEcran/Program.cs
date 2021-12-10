using System.IO;

namespace CompareEcran {
	class Program {
		static void Main(string[] args) {
			int offset = 0x00;
			byte[] s1 = File.ReadAllBytes("Santa1.bin");
			byte[] s2 = File.ReadAllBytes("Santa2.bin");
			byte[] s3 = File.ReadAllBytes("Santa3.bin");
			byte[] s4 = File.ReadAllBytes("Santa4.bin");
			using (StreamWriter writer = new StreamWriter("Differences.asm")) {
				for (int i = 0; i < s1.Length; i++) {
					byte a1 = s1[i];
					byte a2 = s2[i];
					byte a3 = s3[i];
					byte a4 = s4[i];
					if (a1 != a2 || a2 != a3 || a3 != a4 || a4 != a1) {
						writer.WriteLine("\t#" + (i + offset).ToString("X4") + " - #" + a1.ToString("X2") + " - #" + a2.ToString("X2") + " - #" + a3.ToString("X2") + " - #" + a4.ToString("X2"));
					}
				}
			}
		}
	}
}

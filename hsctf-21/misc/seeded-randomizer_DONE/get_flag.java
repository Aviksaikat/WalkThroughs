import java.util.Random;

public class get_flag 
{
	public static void get_flag()
	{

		int[] c = {13, 35, 15, -18, 88, 68, -72, -51, 73, -10, 63,
		1, 35, -47, 6, -18, 10, 20, -31, 100, -48, 33, -12,
		13, -24, 11, 20, -16, -10, -76, -63, -18, 118};

		// for (int i = 0; i < 1000; i++) 
		//{
			// Random rand = new Random(i);
			// String flag = new String();
			// for (int j = 0; j < c.length; j++) 
			//{
				// int n = rand.nextInt(128) + c[j];
				// flag += (char)n;
			// }
					// 	System.out.println(i);
			// System.out.println("Flag: " + flag);
		// }

			
		Random rand = new Random(863);
		String flag = new String();
		
		for (int j = 0; j < c.length; j++) 
		{
			int n = rand.nextInt(128) + c[j];
			flag += (char)n;
		}
		//System.out.println(i);
		System.out.println(flag);
	}

	public static void main(String[] args)
	{
		get_flag();
	}

}
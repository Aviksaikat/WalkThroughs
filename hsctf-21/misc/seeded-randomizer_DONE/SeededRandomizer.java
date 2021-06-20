import java.util.Random;

public class SeededRandomizer {

	public static void display(char[] arr) {
		for (char x: arr)
			System.out.print(x);
		System.out.println();
	}

	public static void sample() {
		Random rand = new Random(79808677);
		char[] test = new char[12];
		int[] b = {9, 3, 4, -1, 62, 26, -37, 75, 83, 11, 30, 3};
		for (int i = 0; i < test.length; i++) {
			int n = rand.nextInt(128) + b[i];
			test[i] = (char)n;
		}
		display(test);
	}
	public static void get_flag() {
        // for (int i = 0; i < 1000; i++) {
        //     Random rand = new Random(i);
        //     String flag = new String();
        //     int[] c = {13, 35, 15, -18, 88, 68, -72, -51, 73, -10, 63,
        //             1, 35, -47, 6, -18, 10, 20, -31, 100, -48, 33, -12,
        //             13, -24, 11, 20, -16, -10, -76, -63, -18, 118};

        //     for (int j = 0; j < c.length; j++) {
        //         int n = rand.nextInt(128) + c[j];
        //         flag += (char)n;
        //     }
		// 	System.out.println(i);
        //     System.out.println("Flag: " + flag);
        // }
		int[] c = {13, 35, 15, -18, 88, 68, -72, -51, 73, -10, 63,
                     1, 35, -47, 6, -18, 10, 20, -31, 100, -48, 33, -12,
                     13, -24, 11, 20, -16, -10, -76, -63, -18, 118};
		Random rand = new Random(863);
		String flag = new String();
		for (int j = 0; j < c.length; j++) {
                int n = rand.nextInt(128) + c[j];
                flag += (char)n;
        }
		//System.out.println(i);
        System.out.println(flag);
    }
	public static void main(String[] args) {
		//sample();
		// Instantiate another seeded randomizer below (seed is integer between 0 and 1000, exclusive):
		Random rand = new Random(79808677);
		char[] flag = new char[33];
		int[] c = {13, 35, 15, -18, 88, 68, -72, -51, 73, -10, 63, 
				1, 35, -47, 6, -18, 10, 20, -31, 100, -48, 33, -12, 
				13, -24, 11, 20, -16, -10, -76, -63, -18, 118};
		for (int i = 0; i < flag.length; i++) {
			int n = rand.nextInt(128) + c[i];
			//System.out.println(rand.nextInt());
			flag[i] = (char)n;
		}
		//display(flag);
		get_flag();
	
	}

}

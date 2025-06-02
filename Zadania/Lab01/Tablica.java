import java.util.*;

public class Tablica {
	static public void main(String args[]) {
		int[] tab = new int[10];
		Random random = new Random();
		for (int i = 0; i < 10; i++) {
			tab[i] = (random.nextInt(6) + 1);
			System.out.print("tab[" + i + "] = " + tab[i] + "\n");
		}
	}
}

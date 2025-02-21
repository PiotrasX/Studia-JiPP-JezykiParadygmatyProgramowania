import java.util.*;
import java.io.File;
import java.io.PrintWriter;
import java.io.FileNotFoundException;

public class Pliki {
	static public void main(String args[]) throws FileNotFoundException {
		int a;
		File in, out;
		in = new File("liczby2.txt");
		out = new File("wynik2.txt");

		Scanner odczyt = new Scanner(in);
		String line = odczyt.nextLine();
		String[] lineStringTab = line.split(" ");
		int[] lineIntTab = new int[lineStringTab.length];
		for (int i = 0; i < lineStringTab.length; i++) {
			lineIntTab[i] = Integer.parseInt(lineStringTab[i]);
		}
		a = 0;
		for (int x : lineIntTab) {
			a += x;
		}
		PrintWriter zapis = new PrintWriter(out);
		zapis.print(a);

		odczyt.close();
		zapis.close();
	}
}

import tock;

class clas {
	int ceva;
	int altceva;
}

extern(C) int sum(int a, int b) {
	return a + b;
}

extern(C) int main() {
	clas var;
	var.ceva = 5;
	var.altceva = 5;
	return sum(var.ceva, var.altceva);
}

#include"ok.h"
int main(int argc, const char *argv[])
{
	void *scanner;
	for (size_t i = 1; argv[i]; i++)
	{
		FILE *f = fopen(argv[i], "rb");
		if (!f) {
			fprintf(stderr, "Failed to open file: %s\n", argv[i]);
			continue;
		}
		oklex_init(&scanner);
		okset_in(f, scanner);
		yy::parser parser(scanner);
		try {
			parser();
		} catch (const std::exception& ex) {
			fprintf(stderr, "Parsing failed for file: %s\nError: %s\n", argv[i], ex.what());
		}
		oklex_destroy(scanner);
		fclose(f);
	}
	return 0;
}

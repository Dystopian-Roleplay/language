#define MAX_LANGUAGE 2

#include "language.inc"

#define RUN_TESTS
#include <YSI\y_testing>
#include <YSI\y_hooks>


hook OnScriptInit() {
	logger_debug("language", true);
	dbg("language", "language debugging activated");
}

// Test:InitLanguageFromFile() {
// 	new ret;

// 	ret = InitLanguageFromFile("English");
// 	ASSERT(ret == 1);

// 	ret = InitLanguageFromFile("NonExistent");
// 	ASSERT(ret == -2);

// 	ret = InitLanguageFromFile("Empty");
// 	ASSERT(ret == -3);

// 	ret = InitLanguageFromFile("Espanol");
// 	ASSERT(ret == 1);

// 	ret = InitLanguageFromFile("English");
// 	ASSERT(ret == -1);
// }

Test:AddLanguageEntry() {
	new
		languageid,
		ret;

	languageid = InitLanguage("TestLanguage1");
	ASSERT(languageid != -1);

	ret = AddLanguageEntry(languageid, "L1KEY01", "value");
	ASSERT(ret == 0);

	new result[MAX_LANGUAGE_ENTRY_LENGTH];
	ret = _language_stringFromKey(languageid, "L1KEY01", result);
	ASSERT(ret == 0);
	ASSERT(!strcmp(result, "value"));
	printf("L1KEY01='%s'", result);

	ret = _language_stringFromKey(languageid, "L1KEY02", result);
	ASSERT(ret == 1);
}

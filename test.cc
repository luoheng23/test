#define TOTAL_KEYWORDS 25
#define MIN_WORD_LENGTH 2
#define MAX_WORD_LENGTH 11
#define MIN_HASH_VALUE 2
#define MAX_HASH_VALUE 36
/* maximum key range = 35, duplicates = 0 */

#ifdef __GNUC__
__inline
#else
#ifdef __cplusplus
inline
#endif
#endif
static unsigned int
hash (const char *str, unsigned int len)
{
  static unsigned char asso_values[] =
    {
      0, 10, 0, 0, 10,  0, 5, 30, 0, 37, 37, 15, 10,
      15, 0, 5, 37,  5, 10, 15, 10, 15, 20, 37,  0
    };
  return len + asso_values[(unsigned char)str[1]] + asso_values[(unsigned char)str[0]];
}

const char *
in_word_set (const char *str, unsigned int len)
{
  static const char * wordlist[] =
    {
      "", "",
      "if",
      "for",
      "case",
      "const",
      "",
      "go",
      "continue",
      "goto",
      "range",
      "fallthrough",
      "package",
      "map",
      "func",
      "defer",
      "import",
      "default",
      "var",
      "type",
      "break",
      "return",
      "", "",
      "interface",
      "",
      "select",
      "", "",
      "else",
      "",
      "struct",
      "", "",
      "chan",
      "",
      "switch"
    };

  if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH)
    {
      register int key = hash (str, len);

      if (key <= MAX_HASH_VALUE && key >= 0)
        {
          register const char *s = wordlist[key];

          if (*str == *s && !strcmp (str + 1, s + 1))
            return s;
        }
    }
  return 0;
}
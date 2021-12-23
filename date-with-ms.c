#include <stdio.h>
#include <time.h>

#if defined(_MSC_VER)
  #include <windows.h>
#else
  #include <sys/time.h>
#endif

int main() {
  time_t tt_now;
  long milliseconds;
  struct tm *tm_now;
  char without_ms[32];

#if defined(_MSC_VER)
  time(&tt_now);
  milliseconds = 0;
#else
  struct timeval tv_now;
  gettimeofday(&tv_now, NULL);
  tt_now = &tv_now.tv_sec;
  milliseconds = tt_now / 1000;
#endif

  tm_now = localtime(&tt_now);
  strftime(without_ms, sizeof without_ms, "%Y-%m-%d %H:%M:%S", tm_now);
  printf("%s,%03ld\n", without_ms, milliseconds);
  return 0;
}

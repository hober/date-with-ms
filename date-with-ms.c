#include <stdio.h>
#include <sys/time.h>
#include <time.h>

int main() {
  struct timeval tv_now;
  gettimeofday(&tv_now, NULL);

  char without_ms[32];
  strftime(without_ms, sizeof without_ms, "%Y-%m-%d %H:%M:%S",
           localtime(&tv_now.tv_sec));

  long milliseconds = tv_now.tv_usec / 1000;

  printf("%s,%03ld\n", without_ms, milliseconds);

  return 0;
}

#include <rs.h>
#include <unistd.h>
#include <stdio.h>
#include <malloc.h>
#include <memory.h>

rs_int_t testint(lambda_id_t lambda_id) {
    printf("called int lambda with id %d\n", lambda_id);
    return 42;
}

rs_string_t teststring(lambda_id_t lambda_id) {
    printf("called string lambda with id %d\n", lambda_id);
    rs_string_t result = malloc(4);
    memcpy(result, "hey", 4);
    return result;
}

int main() {
    printf("=== riotsensors started\n");
    rs_start();
    int8_t result = register_lambda_int("testint", testint, RS_CACHE_CALL_ONCE);
    printf("Result of int lambda register: %d\n", result);
    int8_t result2 = register_lambda_string("teststr", teststring, RS_CACHE_CALL_ONCE);
    printf("Result of string lambda register: %d\n", result2);
    sleep(2000);
    rs_stop();
    printf("\n=== riotsensors stopped\n");
    return 0;
}
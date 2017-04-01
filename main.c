#include <rs.h>
#include <unistd.h>
#include <stdio.h>
#include <malloc.h>
#include <memory.h>

/* import "ifconfig" shell command, used for setting a static ip address */
extern int _netif_config(int argc, char **argv);

rs_int_t testint(lambda_id_t lambda_id) {
    printf("called int lambda with id %d\n", lambda_id);
    return 42;
}

rs_double_t testdouble(lambda_id_t lambda_id) {
    printf("called double lambda with id %d\n", lambda_id);
    return 42.42;
}

rs_string_t teststring(lambda_id_t lambda_id) {
    printf("called string lambda with id %d\n", lambda_id);
    rs_string_t result = malloc(4);
    memcpy(result, "hey", 4);
    return result;
}

static void set_ip_address(void) {
    char *myargs[4];
    myargs[0] = "ifconfig";
    myargs[1] = "5";
    myargs[2] = "add";
    myargs[3] = "fe80::e0e6:d4ff:fedf:3333";
    _netif_config(4, myargs);
}

int main(void) {
    printf("=== riotsensors started\n");
    set_ip_address();
    rs_start();
    int8_t result = register_lambda_int("testint", testint, RS_CACHE_CALL_ONCE);
    printf("Result of int lambda register: %d\n", result);
    int8_t result2 = register_lambda_double("testdouble", testdouble, RS_CACHE_CALL_ONCE);
    printf("Result of double lambda register: %d\n", result2);
    int8_t result3 = register_lambda_string("teststr", teststring, RS_CACHE_CALL_ONCE);
    printf("Result of string lambda register: %d\n", result3);
    sleep(2000);
    rs_stop();
    printf("\n=== riotsensors stopped\n");
    return 0;
}
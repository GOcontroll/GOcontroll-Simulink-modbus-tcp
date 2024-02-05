#include "modbus-tcp.h"

struct thread_args {
	modbus_t *ctx;
	modbus_mapping_t *map;
	pthread_mutex_t * lock;
};

void start_modbus_thread(modbus_mapping_t* map, pthread_mutex_t *lock, int port);

void stop_modbus_thread(void);
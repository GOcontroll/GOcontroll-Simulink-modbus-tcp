#include "modbus-tcp.h"
#include <pthread.h>
#include "GocontrollModbus.h"
#include <linux/socket.h>
#include <unistd.h>
#include <signal.h>
#include <errno.h>
#include <string.h>
#include <stdio.h>

pthread_t modbus_thread_handle;

struct thread_args args;

void *modbus_thread(void *args) {
	int res = 0;
	struct thread_args *data = (struct thread_args *)args;
	int s = 0;
	unsigned char buf[MODBUS_TCP_MAX_ADU_LENGTH] = {};
	for (;;) {
		//listen for connection
		s = modbus_tcp_listen(data->ctx, 1);
		modbus_tcp_accept(data->ctx, &s);

		if (s < 0) {
			usleep(100000);
			continue;
		}
		//got connection, start listening for requests
		for(;;) {
			do {
				res = modbus_receive(data->ctx, buf);
			} while (res == 0);
			if (res < 0) {
				close(s);
				break;
			}
			printf("modbus request received\n");
			//request received, lock map mutex and send the data
			pthread_mutex_lock(data->lock);
			res = modbus_reply(data->ctx, buf, res, data->map);
			pthread_mutex_unlock(data->lock);
			if (res < 0) {
				close(s);
				break;
			}
		}
	}

}

void start_modbus_thread(modbus_mapping_t* map, pthread_mutex_t *lock, int port) {
	// pthread_mutex_init(lock,NULL);
	args.ctx = modbus_new_tcp(NULL, port);
	args.map = map;
	args.lock = lock;
	pthread_create(&modbus_thread_handle, NULL, modbus_thread, (void *)&args);
}

void stop_modbus_thread(void) {
	pthread_cancel(modbus_thread_handle);
	modbus_close(args.ctx);
	modbus_mapping_free(args.map);
	pthread_mutex_destroy(args.lock);
}
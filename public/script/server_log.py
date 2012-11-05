#/usr/bin/python

import time
import datetime
import random

def main():
    while True:
        f = open('server_traffic.log', 'a')
        s1 = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") # Time
        n_u = random.randint(500, 1000)
        n_c = random.randint(250, 500)
        rate = 2 # Mbps
        cache_bandwidth_factor = 2
        total_demand = n_u * random.uniform(0.95, 1.05) * rate
        total_bandwidth_supply = n_c * random.uniform(0.95, 1.05) * rate * cache_bandwidth_factor
        total_storage_supply = n_c * random.uniform(0.95, 1.05)
        total_effective_supply = total_bandwidth_supply * random.uniform(0.9, 1)

        total_server_load = max(total_demand - total_effective_supply, 0)

        s_all = s1 + ' ' + str(n_u) + ' ' +  str(total_demand) + ' ' + str(n_c) + ' ' + str(total_storage_supply) + ' ' \
                + str(total_bandwidth_supply) + ' ' + str(total_effective_supply) + ' ' + str(total_server_load) + '\n'
        f.write(s_all)
        print s_all
        f.close()
        time.sleep(1)

if __name__ == '__main__':
    main()

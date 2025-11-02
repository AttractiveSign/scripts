#! /bin/python 
# Pings a specified host with every few seconds (default=3, can be specified with -s argument)
import time
import argparse
import os

parser = argparse.ArgumentParser(description='Try pinging a specified host.')
parser.add_argument('host', type=str, help='The host that will be pinged')
parser.add_argument('-s', '--seconds', type=int, default=3, help='Interval between pings in seconds (default=3s)')
args = parser.parse_args()

host = args.host
interval = args.seconds

try:
    while True:
        response = os.popen(f"ping -c 1 {host} 2>/dev/null | grep 'time='").read().strip()
        timestamp = time.strftime("%H:%M:%S")

        if response:
            parts = response.split("time=")
            ping_time = parts[1].split()[0] if len(parts) > 1 else "?"
            print(f"[{timestamp}] {host}: OK ({ping_time} ms)")
        else:
            print(f"[{timestamp}] {host}: FAILED")

        print()
        time.sleep(interval)
except KeyboardInterrupt:
    print("\nInterrupted by user")



import subprocess
import re
import math

def execute():
    cmd = "ping 1.1.1.1"
    popen = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True, shell=True)
    expected_seq = 1
    # latency, dropped
    history = [('0ms', 0) for i in range(0,60)]
    for stdout_line in iter(popen.stdout.readline, ""):
        line = stdout_line.strip()
        groups = re.findall(r'icmp_seq=([0-9]+) ttl=.* time=(.+)', line)
        if not len(groups):
            continue
        groups = groups[0]
        seq = int(groups[0])
        time = groups[1].replace(' ', '')
        dropped_packets = seq - expected_seq
        expected_seq = seq + 1
        history = [(time, dropped_packets)] + history
        oldest = history.pop()
        half = math.floor(len(history) / 2)
        med = history[half]
        newest = history[0]
        print(f"ping:{newest[0]}/{med[0]}/{oldest[0]} droppped:{newest[1]}/{med[1]}/{oldest[1]}") 
    popen.stdout.close()
    return_code = popen.wait()
    if return_code:
        raise subprocess.CalledProcessError(return_code, cmd)
execute()
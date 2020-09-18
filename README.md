# NS3 DCE Vagrant Environment
The ojective of this task is to launch NS3 network simulator with DCE support and to research dependency
between TCP window size and TCP transfer speed.

#### 1.  Setup Vagrant
Download from https://www.vagrantup.com/downloads.html and install
#### 2.  Pull repository
```git clone https://github.com/ivanlysogor/hse-ns3-dce```
#### 3. Setup environment
```
cd hse-ns3-dce
vagrant up
```
#### 4. Connect to VM
```
vagrant ssh
$cd dce/source/ns-3-dce/
$./waf --run dce-iperf
Waf: Entering directory `/home/vagrant/dce/source/ns-3-dce/build'
[ 10/320] lib/pkgconfig/libns3-dev-netlink-debug.pc:  -> build/lib/pkgconfig/libns3-dev-netlink-debug.pc
[113/320] lib/pkgconfig/libns3-dev-dce-debug.pc:  -> build/lib/pkgconfig/libns3-dev-dce-debug.pc
Waf: Leaving directory `/home/vagrant/dce/source/ns-3-dce/build'
'build' finished successfully (0.191s)
$cat files-1/var/log/*/*
iperf -s -P 1
Start Time: NS3 Time:          0s (           +599999999.0ns) , REAL Time: 1574625321
      Time: NS3 Time:          0s (           +599999999.0ns) , REAL Time: 1574625321 --> Starting: /home/vagrant/dce/build/bin/iperf
      Time: NS3 Time:         12s (         +12884215997.0ns) , REAL Time: 1574625324 --> Exit (0)
------------------------------------------------------------
Server listening on TCP port 5001
TCP window size:  128 KByte (default)
------------------------------------------------------------
[  4] local 10.1.1.2 port 5001 connected with 10.1.1.1 port 49153
[ ID] Interval       Transfer     Bandwidth
[  4]  0.0-11.2 sec  5.62 MBytes  4.23 Mbits/sec
$exit
```

#### 5. Change TCP window size (to smaller or bigger value) and change link delay. Compare transfer speed and identify
dependency between TCP window size, link delay and transfer speed

#### 6. Destroy VM
```vagrant destroy```
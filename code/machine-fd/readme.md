Machine Features and Dependencies (machine-fd)
---

# scripts


```
sh machine-features.sh
```



# terminal output


## machine-features



```
#################################################################
## Ubuntu Version: $lsb_release -a
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 16.04.2 LTS
Release:	16.04
Codename:	xenial

#################################################################
## Machine Arquitecture: $uname -a
##
Linux map479-DQ57TM 4.4.0-133-generic #159-Ubuntu SMP Fri Aug 10 07:31:43 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

#################################################################
## CPU INFO: $grep -E: (^model name|^vendor_id|^flags) /proc/cpuinfo | sort | uniq
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm epb invpcid_single kaiser tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm xsaveopt dtherm ida arat pln pts
model name	: Intel(R) Core(TM) i5-4570 CPU @ 3.20GHz
vendor_id	: GenuineIntel

#################################################################
#GRAPHIC CARD INFO:  $lspci -vnn | grep VGA -A 12
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GM206 [GeForce GTX 960] [10de:1401] (rev a1) (prog-if 00 [VGA controller])
	Subsystem: ASUSTeK Computer Inc. GM206 [GeForce GTX 960] [1043:8563]
	Flags: bus master, fast devsel, latency 0, IRQ 28
	Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
	Memory at e0000000 (64-bit, prefetchable) [size=256M]
	Memory at f0000000 (64-bit, prefetchable) [size=32M]
	I/O ports at e000 [size=128]
	Expansion ROM at f7000000 [disabled] [size=512K]
	Capabilities: <access denied>
	Kernel driver in use: nouveau
	Kernel modules: nvidiafb, nouveau

01:00.1 Audio device [0403]: NVIDIA Corporation Device [10de:0fba] (rev a1)

#################################################################
## gcc version: $gcc --version -O3 -std=c99
gcc (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609
Copyright (C) 2015 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

#################################################################
##  version of your python and pip:  version of your python and pip
Python 2.7.12
pip 8.1.1 from /usr/lib/python2.7/dist-packages (python 2.7)
```




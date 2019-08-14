#!/bin/bash
runtest=(can cap_bounds commands connectors containers controllers cpuhotplug crashme crypto cve dio dma_thread_diotest fcntl-locktests filecaps fs fs_bind fs_ext4 fs_perms_simple fs_readonly fsx hugetlb hyperthreading ima input io io_cd io_floppy ipc kernel_misc ltp-aiodio.part1 ltp-aiodio.part2 ltp-aiodio.part3 ltp-aiodio.part4 ltp-aio-stress.part1 ltp-aio-stress.part2 lvm.part1 lvm.part2 math mm net.features net.ipv6 net.ipv6_lib net.multicast net.nfs net.rpc net.rpc_tests net.sctp net_stress.appl net_stress.broken_ip net_stress.interface net_stress.ipsec_dccp net_stress.ipsec_icmp net_stress.ipsec_sctp net_stress.ipsec_tcp net_stress.ipsec_udp net_stress.multicast net_stress.route net.tcp_cmds net.tirpc_tests nptl numa power_management_tests power_management_tests_exclusive pty quickhit s390x_tests sched scsi_debug.part1 securebits smack syscalls syscalls-ipc tpm_tools tracing)
ltpdir="/home/ltp"
tmpdir="/home/tmp"
if ! -d $ltpdir;then 
	mkdir -p $ltpdir
else
	tar -zcvf ltp-result-`date "+%Y-%m-%d-%H:%M:%S"`.tar.gz ${ltpdir}/ > /dev/null 2>&1
	rm -rf ${ltpdir}/* > /dev/null 2>&1
fi

if ! -d $tmpdir;then
	mkdir -p $tmpdir
fi

for line in "${runtest[@]}";
do
	./runltp -p -q -f $line -l ${ltpdir}/results-log-$line.log -o ${ltpdir}/results-output-$line.output -C ${ltpdir}/results-failed-$line.failed -d $tmpdir
done 

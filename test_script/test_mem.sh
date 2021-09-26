#!/bin/bash

# This is a guide to get vm process's memory usage except for guest memory.

# used pmap to get the memory overhead
# results of `pmap -Xq $pid`
# $1 address range
# $6 mapped memory size
# $7 RSS
# $8 PSS, exact memory usage

# Use this limit to exclude guest memory size.
# As we assume the guest memory size is bigger than 128 Mib
guest_memory_limit=131072

# The process name of the vm process
# Now we suppose it is light-vm, please modify if it is normal
# if there are more than one micro-vm, should use the vm name, will use para in the future.
process_name='stratovirt'

get_hypervisor_memory_usage()
{
    # Get the pid, thus we can only run while there is only one vm process
    pid=`pidof $process_name`

    # parse the exact PSS in the process
    # the first line is process name, thus we exclude using NR > 1
    # the line with $guest_memory_limit is guest, also exclude it
    pss_lines=`pmap -Xq $pid | awk -v limit="$guest_memory_limit" '{if(NR > 1){print $8}}'`
    echo $pss_lines

    # calculate total memory of the process except guest memory
    total_memory=0
    for line in $pss_lines; do
        ((total_memory = $total_memory + $line))
    done

    echo $total_memory Kib
}

get_hypervisor_memory_usage

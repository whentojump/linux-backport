 export PATH=/lib/llvm-20/bin:$PATH

make LLVM=1 defconfig

./scripts/config -e CONFIG_9P_FS_POSIX_ACL
./scripts/config -e CONFIG_9P_FS
./scripts/config -e CONFIG_NET_9P_VIRTIO
./scripts/config -e CONFIG_NET_9P
./scripts/config -e CONFIG_PCI
./scripts/config -e CONFIG_VIRTIO_PCI
./scripts/config -e CONFIG_OVERLAY_FS
./scripts/config -e CONFIG_DEBUG_FS
./scripts/config -e CONFIG_CONFIGFS_FS
./scripts/config -e CONFIG_MAGIC_SYSRQ
make LLVM=1 olddefconfig

# ./scripts/config -e CONFIG_KUNIT
# ./scripts/config -e CONFIG_KUNIT_ALL_TESTS
# make LLVM=1 olddefconfig

./scripts/config -e CONFIG_LLVM_COV_KERNEL
./scripts/config -e CONFIG_LLVM_COV_KERNEL_MCDC
./scripts/config -e CONFIG_LLVM_COV_PROFILE_ALL
./scripts/config --set-val LLVM_COV_KERNEL_MCDC_MAX_CONDITIONS 44
make LLVM=1 olddefconfig

/usr/bin/time -v make LLVM=1 -j20 |& tee build.log

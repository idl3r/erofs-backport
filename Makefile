obj-m := erofs.o
erofs-objs := data.o decompressor.o dir.o inode.o lz4.o namei.o super.o unzip_vle.o utils.o xattr.o zmap.o
KDIR := /lib/modules/$(shell uname -r)/build
CFLAGS_MODULE := -mcmodel=kernel -I$(PWD)/include \
-DCONFIG_EROFS_FS \
-DCONFIG_EROFS_FS_DEBUG \
-DCONFIG_EROFS_FS_XATTR \
-DCONFIG_EROFS_FS_POSIX_ACL \
-DCONFIG_EROFS_FS_SECURITY \
-DCONFIG_EROFS_FS_ZIP \
-DCONFIG_EROFS_FS_CLUSTER_PAGE_LIMIT=16 \
-DCONFIG_EROFS_FS_HUAWEI_EXTENSION \
-DEROFS_SUPER_MAGIC_V1=EROFS_SUPER_MAGIC \
-DEROFS_VERSION=\"1.1\"
PWD := $(shell pwd)
default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

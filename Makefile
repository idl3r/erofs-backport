obj-m := erofs.o
erofs-objs := super.o inode.o data.o namei.o dir.o utils.o xattr.o decompressor.o zmap.o zdata.o
KDIR := /lib/modules/$(shell uname -r)/build
CFLAGS_MODULE := -I$(PWD)/include -DCONFIG_EROFS_FS -DCONFIG_EROFS_FS_XATTR -DCONFIG_EROFS_FS_POSIX_ACL -DCONFIG_EROFS_FS_SECURITY -DCONFIG_EROFS_FS_ZIP -DCONFIG_EROFS_FS_CLUSTER_PAGE_LIMIT=1 -DEROFS_SUPER_MAGIC_V1=EROFS_SUPER_MAGIC
PWD := $(shell pwd)
default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules


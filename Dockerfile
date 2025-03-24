# Base image: Rocky Linux 9 minimal
FROM rockylinux/rockylinux:9-minimal 

# Maintainer information
LABEL maintainer="kevin@netarchitect.cloud"
LABEL description="Container with libguestfs, qemu and image manipulation tools"

# Environment configuration for libguestfs
# - BACKEND=direct: Uses direct backend (no nested VM)
# - DEBUG/TRACE: Disabled to reduce noise
# - PROGRESS: Enabled to show progress
# - VERBOSE: Disabled for minimal output
# - MEMSIZE: 500MB for basic operations
ENV LIBGUESTFS_BACKEND=direct \
    LIBGUESTFS_DEBUG=0 \
    LIBGUESTFS_TRACE=0 \
    LIBGUESTFS_PROGRESS=1 \
    LIBGUESTFS_VERBOSE=0

# Installing dependencies and cleaning up in a single step to reduce image size
# Optimization options:
# - --allowerasing: Resolves package conflicts
# - --setopt=install_weak_deps=False: Avoids installing weak dependencies
# - --nodocs: Excludes documentation to save space
RUN microdnf -y install dnf && \
    dnf -y update && \
    dnf -y install epel-release && \
    dnf -y install --allowerasing --setopt=install_weak_deps=False --nodocs \
        # Virtualization tools
        qemu-img \
        qemu-kvm \
        libguestfs \
        libguestfs-tools-c \
        virt-v2v \
        # System and network tools
        curl \
        tar \
        gzip \
        python3-libguestfs \
        # Filesystem tools
        e2fsprogs \
        xfsprogs \
        btrfs-progs \
        ntfs-3g \
        dosfstools \
        # Miscellaneous tools
        openssh-clients \
        file \
        procps-ng \
	wget \
        iproute && \
    # Aggressive cleanup to reduce image size
    dnf clean all && \
    microdnf clean all && \
    rm -rf /var/cache/dnf /var/cache/yum /var/log/* /tmp/* /var/tmp/* && \
    rm -rf /usr/share/{doc,man,info}/* && \
    # Create working directory
    mkdir -p /workspace/images

# Set working directory
WORKDIR /workspace

# Default entry point
CMD ["/bin/bash"]

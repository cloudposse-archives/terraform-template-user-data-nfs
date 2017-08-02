
##############
# Install deps
##############

apt-get update
apt-get -y install nfs-common

##
## NFS Setup
##
NFS_MOUNT_DIR="${dir}"
NFS_HOST="${host}"

until host $NFS_HOST
do
  echo "Waiting for $NFS_HOST to become available ..."
  sleep 1;
done

echo "Mounting NFS filesystem $NFS_HOST to directory $NFS_MOUNT_DIR ..."

echo 'Stopping NFS ID Mapper...'
service rpcidmapd status &> /dev/null
if [ $? -ne 0 ] ; then
    echo 'rpc.idmapd is already stopped!'
else
    service rpcidmapd stop
    if [ $? -ne 0 ] ; then
        echo 'ERROR: Failed to stop NFS ID Mapper!'
        exit 1
    fi
fi

echo 'Checking if NFS mount directory exists...'
if [ ! -d $NFS_MOUNT_DIR ]; then
    echo "Creating directory $NFS_MOUNT_DIR ..."
    mkdir -p $NFS_MOUNT_DIR
    if [ $? -ne 0 ]; then
        echo 'ERROR: Directory creation failed!'
        exit 1
    fi
    chmod 777 $NFS_MOUNT_DIR
    if [ $? -ne 0 ]; then
        echo 'ERROR: Permission update failed!'
        exit 1
    fi
else
    echo "Directory $NFS_MOUNT_DIR already exists!"
fi

mountpoint -q $NFS_MOUNT_DIR
if [ $? -ne 0 ]; then
    echo "mount -t nfs4 -o nfsvers=4.1 $NFS_HOST:/ $NFS_MOUNT_DIR"
    mount -t nfs4 -o nfsvers=4.1 $NFS_HOST:/ $NFS_MOUNT_DIR
    if [ $? -ne 0 ] ; then
        echo 'ERROR: Mount command failed!'
        exit 1
    fi
else
    echo "Directory $NFS_MOUNT_DIR is already a valid mountpoint!"
fi

chmod 777 $NFS_MOUNT_DIR
if [ $? -ne 0 ]; then
  echo 'ERROR: Permission update failed!'
  exit 1
fi

echo 'NFS mount complete.'



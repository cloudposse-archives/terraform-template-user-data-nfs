module "user_data_nfs" {
  source = "../"
  namespace                  = "global"
  name                       = "nfs_mount"
  stage                      = "dev"
  dir                        = "mnt_dir"
  host                       = "nfs_server"
}

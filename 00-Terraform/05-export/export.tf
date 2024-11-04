locals {
  PREFIX = "ARA_"
}

resource "genesyscloud_tf_export" "export" {
  directory = "./gcexport"
  include_state_file = false
  export_as_hcl = true
  split_files_by_resource = true
  log_permission_errors = true
  #enable_dependency_resolution = true
  #ignore_cyclic_deps = true
  
  # Run #1 - Export ALL resources.. Needs high level of permissions/roles on OAuth client
    include_filter_resources = []
  
  # Run #2 - Uncomment Run #2, comment Run #1
    # include_filter_resources = [
    #     "genesyscloud_routing_queue",
    #     "genesyscloud_routing_wrapupcode"
    # ]

  # Run #3 - Comment Run #2, uncomment Run #3
  # include_filter_resources = [
  #     "genesyscloud_routing_queue::^${local.PREFIX}",
  #     "genesyscloud_routing_wrapupcode::^${local.PREFIX}"
  # ]

  # Run #4 - leave Run #3 uncommented, uncomment below lines...
  # exclude_attributes = [
  #     "genesyscloud_routing_queue.media_settings_call",
  #     "genesyscloud_routing_queue.media_settings_callback",
  #     "genesyscloud_routing_queue.media_settings_chat",
  #     "genesyscloud_routing_queue.media_settings_email",
  #     "genesyscloud_routing_queue.media_settings_message",
  #     "genesyscloud_routing_queue.description"
  # ]

  # exclude_filter_resources = []
  # replace_with_datasource = []

}
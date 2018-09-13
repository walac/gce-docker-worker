provider "google" {
  credentials = "${file("${pathexpand("~")}/.config/gcloud/taskcluster-playground-0bf86a6805e8.json")}"
  project = "taskcluster-playground"
  region = "us-east-1"
}

resource "google_compute_instance_template" "std2" {
  name = "docker-worker-std2"

  labels = {
    worker = "docker-worker-std2"
  }

  instance_description = "docker-worker"
  machine_type = "n1-standard-2"
  can_ip_forward = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  disk {
    source_image = "taskcluster-playground/docker-worker-app-1536593314"
    auto_delete = true
    boot = true
  }

  disk {
    auto_delete = true
    boot = false
    disk_size_gb = 120
  }

  network_interface {
    network = "default"
    access_config {
      network_tier = "STANDARD"
    }
  }

  metadata = {
    statelessHostname = "${var.stateless_hostname}"
    relengApiToken = "${var.relengapi_token}"
    clientId = "${var.client_id}"
    accessToken = "${var.access_token}"
    capacity = "4"
    workerType = "gecko-t-linux-2"
    provisionerId = "gce"
  }
}

resource "google_compute_instance_group_manager" "grp_std2" {
  name = "docker-worker-instances-std2"

  base_instance_name = "docker-worker"
  update_strategy = "NONE"
  target_size = 4
  wait_for_instances = true
  zone = "us-east1-b"

  instance_template = "${google_compute_instance_template.std2.self_link}"
}

resource "google_compute_instance_template" "std4" {
  name = "docker-worker-std4"

  labels = {
    worker = "docker-worker-std4"
  }

  instance_description = "docker-worker"
  machine_type = "n1-standard-4"
  can_ip_forward = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  disk {
    source_image = "taskcluster-playground/docker-worker-app-1536593314"
    auto_delete = true
    boot = true
  }

  disk {
    auto_delete = true
    boot = false
    disk_size_gb = 120
  }

  network_interface {
    network = "default"
    access_config {
      network_tier = "STANDARD"
    }
  }

  metadata = {
    statelessHostname = "${var.stateless_hostname}"
    relengApiToken = "${var.relengapi_token}"
    clientId = "${var.client_id}"
    accessToken = "${var.access_token}"
    capacity = "4"
    workerType = "gecko-t-linux-4"
    provisionerId = "gce"
  }
}

resource "google_compute_instance_group_manager" "grp_std4" {
  name = "docker-worker-instances-std4"

  base_instance_name = "docker-worker"
  update_strategy = "NONE"
  target_size = 4
  wait_for_instances = true
  zone = "us-east1-b"

  instance_template = "${google_compute_instance_template.std4.self_link}"
}

resource "google_compute_instance_template" "std8" {
  name = "docker-worker-std8"

  labels = {
    worker = "docker-worker-std8"
  }

  instance_description = "docker-worker"
  machine_type = "n1-standard-8"
  can_ip_forward = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  disk {
    source_image = "taskcluster-playground/docker-worker-app-1536593314"
    auto_delete = true
    boot = true
  }

  disk {
    auto_delete = true
    boot = false
    disk_size_gb = 120
  }

  network_interface {
    network = "default"
    access_config {
      network_tier = "STANDARD"
    }
  }

  metadata = {
    statelessHostname = "${var.stateless_hostname}"
    relengApiToken = "${var.relengapi_token}"
    clientId = "${var.client_id}"
    accessToken = "${var.access_token}"
    capacity = "4"
    workerType = "gecko-t-linux-8"
    provisionerId = "gce"
  }
}

resource "google_compute_instance_group_manager" "grp_std8" {
  name = "docker-worker-instances-std8"

  base_instance_name = "docker-worker"
  update_strategy = "NONE"
  target_size = 4
  wait_for_instances = true
  zone = "us-east1-b"

  instance_template = "${google_compute_instance_template.std8.self_link}"
}

resource "google_compute_instance_template" "std16" {
  name = "docker-worker-std16"

  labels = {
    worker = "docker-worker-std16"
  }

  instance_description = "docker-worker"
  machine_type = "n1-standard-16"
  can_ip_forward = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  disk {
    source_image = "taskcluster-playground/docker-worker-app-1536593314"
    auto_delete = true
    boot = true
  }

  disk {
    auto_delete = true
    boot = false
    disk_size_gb = 120
  }

  network_interface {
    network = "default"
    access_config {
      network_tier = "STANDARD"
    }
  }

  metadata = {
    statelessHostname = "${var.stateless_hostname}"
    relengApiToken = "${var.relengapi_token}"
    clientId = "${var.client_id}"
    accessToken = "${var.access_token}"
    capacity = "4"
    workerType = "gecko-t-linux-16"
    provisionerId = "gce"
  }
}

resource "google_compute_instance_group_manager" "grp_std16" {
  name = "docker-worker-instances-std16"

  base_instance_name = "docker-worker"
  update_strategy = "NONE"
  target_size = 4
  wait_for_instances = true
  zone = "us-east1-b"

  instance_template = "${google_compute_instance_template.std16.self_link}"
}


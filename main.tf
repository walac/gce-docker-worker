
provider "google" {
  credentials = "${file("${pathexpand("~")}/linux64-builds-bfb4fe1d96a6.json")}"
  project = "linux64-builds"
  region = "us-east-1"
}



resource "google_compute_instance_template" "gecko1blinux" {
  name = "gecko1blinux"
  labels = {
    worker = "gecko1blinux"
  }
  
  instance_description = "docker_worker"
  machine_type = "n1-highcpu-64"
  can_ip_forward = false
  
  scheduling {
    automatic_restart = true
    on_host_maintenance = "MIGRATE"
  }
  
  disk {
    source_image = "linux64-builds/docker-worker-app-1549466107"
    disk_type = "pd-ssd"
    auto_delete = true
    boot = true
  }
  
  disk {
    auto_delete = true
    boot = false
    disk_type = "local-ssd"
    type = "SCRATCH"
    interface = "nvme"
  }
  
  network_interface {
    network = "default"
    access_config {
      network_tier = "STANDARD"
    }
  }
  
  min_cpu_platform = "Intel Skylake"
  
  metadata = {
    statelessHostname = "${var.stateless_hostname}"
    relengApiToken = "${var.relengapi_token}"
    clientId = "${var.client_id}"
    accessToken = "${var.access_token}"
    capacity = "2"
    workerType = "gecko-1-b-linux"
    provisionerId = "gce"
    rootUrl = "https://taskcluster.net"
    secretsPath = "project/taskcluster/docker-worker:secrets"
  }
}



resource "google_compute_instance_group_manager" "gecko1blinux" {
  name = "gecko1blinux"

  base_instance_name = "docker-worker"
  update_strategy = "NONE"
  target_size = 5
  wait_for_instances = true
  zone = "us-east1-b"

  instance_template = "${google_compute_instance_template.gecko1blinux.self_link}"
}



resource "google_compute_instance_template" "gecko2blinux" {
  name = "gecko2blinux"
  labels = {
    worker = "gecko2blinux"
  }
  
  instance_description = "docker_worker"
  machine_type = "n1-highcpu-64"
  can_ip_forward = false
  
  scheduling {
    automatic_restart = true
    on_host_maintenance = "MIGRATE"
  }
  
  disk {
    source_image = "linux64-builds/docker-worker-app-1549466107"
    disk_type = "pd-ssd"
    auto_delete = true
    boot = true
  }
  
  disk {
    auto_delete = true
    boot = false
    disk_type = "local-ssd"
    type = "SCRATCH"
    interface = "nvme"
  }
  
  network_interface {
    network = "default"
    access_config {
      network_tier = "STANDARD"
    }
  }
  
  min_cpu_platform = "Intel Skylake"
  
  metadata = {
    statelessHostname = "${var.stateless_hostname}"
    relengApiToken = "${var.relengapi_token}"
    clientId = "${var.client_id}"
    accessToken = "${var.access_token}"
    capacity = "2"
    workerType = "gecko-2-b-linux"
    provisionerId = "gce"
    rootUrl = "https://taskcluster.net"
    secretsPath = "project/taskcluster/docker-worker:secrets"
  }
}



resource "google_compute_instance_group_manager" "gecko2blinux" {
  name = "gecko2blinux"

  base_instance_name = "docker-worker"
  update_strategy = "NONE"
  target_size = 5
  wait_for_instances = true
  zone = "us-east1-b"

  instance_template = "${google_compute_instance_template.gecko2blinux.self_link}"
}



resource "google_compute_instance_template" "gecko3blinux" {
  name = "gecko3blinux"
  labels = {
    worker = "gecko3blinux"
  }
  
  instance_description = "docker_worker"
  machine_type = "n1-highcpu-64"
  can_ip_forward = false
  
  scheduling {
    automatic_restart = true
    on_host_maintenance = "MIGRATE"
  }
  
  disk {
    source_image = "linux64-builds/docker-worker-app-1549466107"
    disk_type = "pd-ssd"
    auto_delete = true
    boot = true
  }
  
  disk {
    auto_delete = true
    boot = false
    disk_type = "local-ssd"
    type = "SCRATCH"
    interface = "nvme"
  }
  
  network_interface {
    network = "default"
    access_config {
      network_tier = "STANDARD"
    }
  }
  
  min_cpu_platform = "Intel Skylake"
  
  metadata = {
    statelessHostname = "${var.stateless_hostname}"
    relengApiToken = "${var.relengapi_token}"
    clientId = "${var.client_id}"
    accessToken = "${var.access_token}"
    capacity = "2"
    workerType = "gecko-3-b-linux"
    provisionerId = "gce"
    rootUrl = "https://taskcluster.net"
    secretsPath = "project/taskcluster/docker-worker:secrets"
  }
}



resource "google_compute_instance_group_manager" "gecko3blinux" {
  name = "gecko3blinux"

  base_instance_name = "docker-worker"
  update_strategy = "NONE"
  target_size = 5
  wait_for_instances = true
  zone = "us-east1-b"

  instance_template = "${google_compute_instance_template.gecko3blinux.self_link}"
}



resource "google_compute_instance_template" "gecko1decision" {
  name = "gecko1decision"
  labels = {
    worker = "gecko1decision"
  }
  
  instance_description = "docker_worker"
  machine_type = "n1-highcpu-64"
  can_ip_forward = false
  
  scheduling {
    automatic_restart = true
    on_host_maintenance = "MIGRATE"
  }
  
  disk {
    source_image = "linux64-builds/docker-worker-app-1549466107"
    disk_type = "pd-ssd"
    auto_delete = true
    boot = true
  }
  
  disk {
    auto_delete = true
    boot = false
    disk_type = "local-ssd"
    type = "SCRATCH"
    interface = "nvme"
  }
  
  network_interface {
    network = "default"
    access_config {
      network_tier = "STANDARD"
    }
  }
  
  min_cpu_platform = "Intel Skylake"
  
  metadata = {
    statelessHostname = "${var.stateless_hostname}"
    relengApiToken = "${var.relengapi_token}"
    clientId = "${var.client_id}"
    accessToken = "${var.access_token}"
    capacity = "2"
    workerType = "gecko-1-decision"
    provisionerId = "gce"
    rootUrl = "https://taskcluster.net"
    secretsPath = "project/taskcluster/docker-worker:secrets"
  }
}



resource "google_compute_instance_group_manager" "gecko1decision" {
  name = "gecko1decision"

  base_instance_name = "docker-worker"
  update_strategy = "NONE"
  target_size = 5
  wait_for_instances = true
  zone = "us-east1-b"

  instance_template = "${google_compute_instance_template.gecko1decision.self_link}"
}



resource "google_compute_instance_template" "gecko2decision" {
  name = "gecko2decision"
  labels = {
    worker = "gecko2decision"
  }
  
  instance_description = "docker_worker"
  machine_type = "n1-highcpu-64"
  can_ip_forward = false
  
  scheduling {
    automatic_restart = true
    on_host_maintenance = "MIGRATE"
  }
  
  disk {
    source_image = "linux64-builds/docker-worker-app-1549466107"
    disk_type = "pd-ssd"
    auto_delete = true
    boot = true
  }
  
  disk {
    auto_delete = true
    boot = false
    disk_type = "local-ssd"
    type = "SCRATCH"
    interface = "nvme"
  }
  
  network_interface {
    network = "default"
    access_config {
      network_tier = "STANDARD"
    }
  }
  
  min_cpu_platform = "Intel Skylake"
  
  metadata = {
    statelessHostname = "${var.stateless_hostname}"
    relengApiToken = "${var.relengapi_token}"
    clientId = "${var.client_id}"
    accessToken = "${var.access_token}"
    capacity = "2"
    workerType = "gecko-2-decision"
    provisionerId = "gce"
    rootUrl = "https://taskcluster.net"
    secretsPath = "project/taskcluster/docker-worker:secrets"
  }
}



resource "google_compute_instance_group_manager" "gecko2decision" {
  name = "gecko2decision"

  base_instance_name = "docker-worker"
  update_strategy = "NONE"
  target_size = 5
  wait_for_instances = true
  zone = "us-east1-b"

  instance_template = "${google_compute_instance_template.gecko2decision.self_link}"
}



resource "google_compute_instance_template" "gecko3decision" {
  name = "gecko3decision"
  labels = {
    worker = "gecko3decision"
  }
  
  instance_description = "docker_worker"
  machine_type = "n1-highcpu-64"
  can_ip_forward = false
  
  scheduling {
    automatic_restart = true
    on_host_maintenance = "MIGRATE"
  }
  
  disk {
    source_image = "linux64-builds/docker-worker-app-1549466107"
    disk_type = "pd-ssd"
    auto_delete = true
    boot = true
  }
  
  disk {
    auto_delete = true
    boot = false
    disk_type = "local-ssd"
    type = "SCRATCH"
    interface = "nvme"
  }
  
  network_interface {
    network = "default"
    access_config {
      network_tier = "STANDARD"
    }
  }
  
  min_cpu_platform = "Intel Skylake"
  
  metadata = {
    statelessHostname = "${var.stateless_hostname}"
    relengApiToken = "${var.relengapi_token}"
    clientId = "${var.client_id}"
    accessToken = "${var.access_token}"
    capacity = "2"
    workerType = "gecko-3-decision"
    provisionerId = "gce"
    rootUrl = "https://taskcluster.net"
    secretsPath = "project/taskcluster/docker-worker:secrets"
  }
}



resource "google_compute_instance_group_manager" "gecko3decision" {
  name = "gecko3decision"

  base_instance_name = "docker-worker"
  update_strategy = "NONE"
  target_size = 5
  wait_for_instances = true
  zone = "us-east1-b"

  instance_template = "${google_compute_instance_template.gecko3decision.self_link}"
}



provider "google" {
  credentials = "${file("${pathexpand("~")}/linux64-builds-bfb4fe1d96a6.json")}"
  project = "linux64-builds"
  region = "us-east-1"
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
    source_image = "linux64-builds/docker-worker-app-1549466107"
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
    capacity = "1"
    workerType = "gecko-3-b-linux"
    provisionerId = "gce"
    rootUrl = "https://taskcluster.net"
    secretsPath = "project/taskcluster/docker-worker:secrets"
  }
}

resource "google_compute_instance_group_manager" "grp_std8" {
  name = "docker-worker-instances-std8"

  base_instance_name = "docker-worker"
  update_strategy = "NONE"
  target_size = 5
  wait_for_instances = true
  zone = "us-east1-b"

  instance_template = "${google_compute_instance_template.std8.self_link}"
}

provider "google" {
  credentials = "${file("${pathexpand("~")}/.config/gcloud/taskcluster-playground-0bf86a6805e8.json")}"
  project = "taskcluster-playground"
  region = "us-east-1"
}

resource "google_compute_instance_template" "docker_worker" {
  name = "docker-worker"

  labels = {
    worker = "docker-worker"
  }

  instance_description = "docker-worker"
  machine_type = "custom-4-26624"
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
    workerType = "gecko-t-linux"
    provisionerId = "gce"
  }
}

resource "google_compute_instance_group_manager" "docker_worker" {
  name = "docker-worker-instances"

  base_instance_name = "docker-worker"
  update_strategy = "NONE"
  target_size = 4
  wait_for_instances = true
  zone = "us-east1-b"

  instance_template = "${google_compute_instance_template.docker_worker.self_link}"
}

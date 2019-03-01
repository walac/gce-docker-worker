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
    capacity = "1"
    workerType = "gecko-1-b-linux"
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
    capacity = "1"
    workerType = "gecko-1-b-linux-16"
    provisionerId = "gce"
    rootUrl = "https://taskcluster.net"
    secretsPath = "project/taskcluster/docker-worker:secrets"
  }
}

resource "google_compute_instance_group_manager" "grp_std16" {
  name = "docker-worker-instances-std16"

  base_instance_name = "docker-worker"
  update_strategy = "NONE"
  target_size = 5
  wait_for_instances = true
  zone = "us-east1-b"

  instance_template = "${google_compute_instance_template.std16.self_link}"
}

resource "google_compute_instance_template" "std32" {
  name = "docker-worker-std32"

  labels = {
    worker = "docker-worker-std32"
  }

  instance_description = "docker-worker"
  machine_type = "n1-standard-32"
  can_ip_forward = false

  scheduling {
    automatic_restart   = true
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
    capacity = "1"
    workerType = "gecko-1-b-linux-32"
    provisionerId = "gce"
    rootUrl = "https://taskcluster.net"
    secretsPath = "project/taskcluster/docker-worker:secrets"
  }
}

resource "google_compute_instance_group_manager" "grp_std32" {
  name = "docker-worker-instances-std32"

  base_instance_name = "docker-worker"
  update_strategy = "NONE"
  target_size = 5
  wait_for_instances = true
  zone = "us-east1-b"

  instance_template = "${google_compute_instance_template.std32.self_link}"
}

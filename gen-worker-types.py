#!/usr/bin/env python3

header = \
'''
provider "google" {
  credentials = "${file("${pathexpand("~")}/linux64-builds-bfb4fe1d96a6.json")}"
  project = "linux64-builds"
  region = "us-east-1"
}

'''

google_compute_instance_template = \
'''
resource "google_compute_instance_template" "%(name)s" {
  name = "%(name)s"
  labels = {
    worker = "%(name)s"
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
    workerType = "%(worker_type)s"
    provisionerId = "gce"
    rootUrl = "https://taskcluster.net"
    secretsPath = "project/taskcluster/docker-worker:secrets"
  }
}

'''

google_compute_instance_group_manager = \
'''
resource "google_compute_instance_group_manager" "%(name)s" {
  name = "%(name)s"

  base_instance_name = "docker-worker"
  update_strategy = "NONE"
  target_size = 5
  wait_for_instances = true
  zone = "us-east1-b"

  instance_template = "${google_compute_instance_template.%(template)s.self_link}"
}

'''

worker_types = [
    'gecko-1-b-linux',
    'gecko-2-b-linux',
    'gecko-3-b-linux',
    'gecko-1-decision',
    'gecko-2-decision',
    'gecko-3-decision',
]

print(header)
for wt in worker_types:
    data = {
        'name': wt.replace('-', ''),
        'worker_type': wt,
        'template': wt.replace('-', '')
    }
    print(google_compute_instance_template % data)
    print(google_compute_instance_group_manager % data)

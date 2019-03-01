Make sure to run `docker-worker/gce-secrets.sh` in passwordstore before
running this.

Before the first time, run `terraform init`, then:

* `terraform destroy`
* `terraform apply`

We need to destroy because `terraform` cannot upgrade instance templates.

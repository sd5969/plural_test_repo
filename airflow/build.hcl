metadata {
  name = "airflow"
}

scaffold "terraform" {
  path = "terraform"
  type = "terraform"
}

scaffold "crds" {
  path = "crds"
  type = "crd"
}

scaffold "helm" {
  path = "helm/airflow"
  type = "helm"

  preflight "add-repo" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "repo",
      "add",
      "airflow",
      "cm://app.plural.sh/cm/airflow",
    ]

    sha = "3573124d8d0726e76442fd705ffb78428f472e0373acf7bf7001fe5b971b866d"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "3573124d8d0726e76442fd705ffb78428f472e0373acf7bf7001fe5b971b866d"
  }
}

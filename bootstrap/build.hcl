metadata {
  name = "bootstrap"
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
  path = "helm/bootstrap"
  type = "helm"

  preflight "add-repo" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "repo",
      "add",
      "bootstrap",
      "cm://app.plural.sh/cm/bootstrap",
    ]

    sha = "280cd73dd26ad2abdd81765fb176a0314e7261a2022d7900b80ad354792c724a"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "280cd73dd26ad2abdd81765fb176a0314e7261a2022d7900b80ad354792c724a"
  }
}

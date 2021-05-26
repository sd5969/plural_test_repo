metadata {
  name = "console"
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
  path = "helm/console"
  type = "helm"

  preflight "add-repo" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "repo",
      "add",
      "console",
      "cm://app.plural.sh/cm/console",
    ]

    sha = "3811eab3459f3158465793fb6fc41415908d61f7f8d82c5dba4e36f2d30bdd32"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "3811eab3459f3158465793fb6fc41415908d61f7f8d82c5dba4e36f2d30bdd32"
  }
}

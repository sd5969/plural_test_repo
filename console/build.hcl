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

    sha = "1f7f3807894345ea6bc516aef33bd1c3d655094bd086b3344e305bad04ebe6c2"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "1f7f3807894345ea6bc516aef33bd1c3d655094bd086b3344e305bad04ebe6c2"
  }
}

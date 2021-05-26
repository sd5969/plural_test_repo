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

    sha = "a41eb07977d348da3ae1a1e0a557c11780134feb5987351eb46914b79c53ed68"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "a41eb07977d348da3ae1a1e0a557c11780134feb5987351eb46914b79c53ed68"
  }
}

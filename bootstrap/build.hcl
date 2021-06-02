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

    sha = "d4fa6f96f8907463695fef18d9b441f383605e8fb727f8da80c53b419a852f57"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "d4fa6f96f8907463695fef18d9b441f383605e8fb727f8da80c53b419a852f57"
  }
}

metadata {
  path = "airflow"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "airflow/terraform"
  target  = "airflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:7s4eWV6QyrBBtWn9o4GArRrcxtNm/3hdncVLV4jMAzM="
}

step "terraform-apply" {
  wkdir   = "airflow/terraform"
  target  = "airflow/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:7s4eWV6QyrBBtWn9o4GArRrcxtNm/3hdncVLV4jMAzM="
}

step "terraform-output" {
  wkdir   = "airflow"
  target  = "airflow/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "airflow",
  ]

  sha = "h1:7s4eWV6QyrBBtWn9o4GArRrcxtNm/3hdncVLV4jMAzM="
}

step "kube-init" {
  wkdir   = "airflow"
  target  = "airflow/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "airflow",
  ]

  sha = "17ac6d98279333d38367f5c9966a9221a8e0ebba29cbfb85ec80e06f9b666ad4"
}

step "crds" {
  wkdir   = "airflow"
  target  = "airflow/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "airflow",
  ]

  sha = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
}

step "bounce" {
  wkdir   = "airflow"
  target  = "airflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "airflow",
  ]

  sha = "h1:VTb7v6rFoSi184I3fVDSLFDeBxpGuDspwwoZxfnn4W4="
}

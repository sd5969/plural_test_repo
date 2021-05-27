metadata {
  path = "airflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "airflow/terraform"
  target  = "airflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:7s4eWV6QyrBBtWn9o4GArRrcxtNm/3hdncVLV4jMAzM="
}

step "terraform" {
  wkdir   = "airflow/terraform"
  target  = "airflow/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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

step "helm" {
  wkdir   = "airflow/helm"
  target  = "airflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "airflow",
  ]

  sha = "h1:VTb7v6rFoSi184I3fVDSLFDeBxpGuDspwwoZxfnn4W4="
}

metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:ahY9gWTHOXTYZ9U0UTX+buZOpoEvv4AWGCylfkR/lIM="
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha = "h1:ahY9gWTHOXTYZ9U0UTX+buZOpoEvv4AWGCylfkR/lIM="
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "console",
  ]

  sha = "0a17c131d7f56095b2385b0fe04570ae7e1219878d8ceb561f429d63683cac7d"
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha = "h1:/N8SbxdUggNv7e+mOYuf9DotHbbMATlAadXNjsUsJqg="
}

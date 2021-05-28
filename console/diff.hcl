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

  sha = "bd916cbb69be08d162de0fe513ac5b2f3c63508c44c8e151a96cdb73e6853c99"
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

  sha = "h1:7vsnb3Eu6kc7zZdkxwMYaG89d/qQJomGlA8QIMUs0gE="
}

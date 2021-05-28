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

  sha = "02a3b1f240000414db1f0f49610d6878a53009a8ba1118c52722254aacf56d4c"
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

  sha = "h1:RV2Q7DqAq6Oa4fcakJXGwSY5e3lQeqUG8EkxH0YFQ/M="
}

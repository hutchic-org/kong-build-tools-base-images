group "default" {
  targets = ["apk", "rpm", "deb"]
}

variable "TAG" {default="" }

target "apk" {
  dockerfile = "Dockerfile.apk"
  platforms = ["linux/amd64", "linux/arm64"]
  tags = [
    "kong/kong-build-tools:apk",
    notequal("",TAG) ? "kong/kong-build-tools:apk-${TAG}": ""
  ]
}

target "rpm" {
  dockerfile = "Dockerfile.rpm"
  platforms = ["linux/amd64", "linux/arm64"]
  tags = [
    "kong/kong-build-tools:rpm",
    notequal("",TAG) ? "kong/kong-build-tools:rpm-${TAG}": ""
  ]
}

target "deb" {
  dockerfile = "Dockerfile.deb"
  platforms = ["linux/amd64", "linux/arm64"]
  tags = [    "kong/kong-build-tools:deb",
    notequal("",TAG) ? "kong/kong-build-tools:deb-${TAG}": ""
  ]
}

target "deb-focal" {
  dockerfile = "Dockerfile.deb-focal"
  platforms = ["linux/amd64", "linux/arm64"]
  tags = [    "kong/kong-build-tools:deb-focal",
    notequal("",TAG) ? "kong/kong-build-tools:deb-focal-${TAG}": ""
  ]
}

target "rpm-8" {
  dockerfile = "Dockerfile.rpm-8"
  platforms = ["linux/amd64", "linux/arm64"]
  tags = [    "kong/kong-build-tools:rpm-8",
    notequal("",TAG) ? "kong/kong-build-tools:rpm-8-${TAG}": ""
  ]
}

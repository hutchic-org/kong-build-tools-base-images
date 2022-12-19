group "default" {
  targets = ["apk", "rpm", "deb"]
}

variable "TAG" {default="" }

target "apk" {
  dockerfile = "Dockerfile.apk"
  platforms = ["linux/amd64", "linux/arm64", "linux/ppc64le"]
  tags = [
    "ghcr.io/hutchic-org/kong-build-tools-base-images:apk",
    notequal("",TAG) ? "ghcr.io/hutchic-org/kong-build-tools-base-images:apk-${TAG}": ""
  ]
}

target "rpm" {
  dockerfile = "Dockerfile.rpm"
  platforms = ["linux/amd64", "linux/arm64", "linux/ppc64le"]
  tags = [
    "ghcr.io/hutchic-org/kong-build-tools-base-images:rpm",
    notequal("",TAG) ? "ghcr.io/hutchic-org/kong-build-tools-base-images:rpm-${TAG}": ""
  ]
}

target "deb" {
  dockerfile = "Dockerfile.deb"
  platforms = ["linux/amd64", "linux/arm64", "linux/ppc64le"]
  tags = [    "ghcr.io/hutchic-org/kong-build-tools-base-images:deb",
    notequal("",TAG) ? "ghcr.io/hutchic-org/kong-build-tools-base-images:deb-${TAG}": ""
  ]
}

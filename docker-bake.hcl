variable "CLOUDFLARED_VERSION" {
    default = "2025.4.2"
}

variable "LATEST" {
    default = true
}

variable "MULTI_PLATFORM" {
    default = false
}

variable "GOVERSION" {
    default = "1.23.9"
}

variable "ALPINEVERSION" {
    default = "3.21"
}

target "default" {
    args = {
        VERSION = CLOUDFLARED_VERSION
        GOVERSION = GOVERSION
        ALPINEVERSION = ALPINEVERSION
    }
    platforms = !MULTI_PLATFORM ? null : [
        "linux/amd64",
        "linux/386",
        "linux/arm64",
        "linux/arm/v7",
        "linux/arm/v6",
        "linux/s390x",
        "linux/ppc64le",
        "linux/riscv64"
    ]
    tags = [
        "neil1145/cloudflared:${CLOUDFLARED_VERSION}",
        "ghcr.io/neil1145/cloudflared:${CLOUDFLARED_VERSION}",
        LATEST ? "neil1145/cloudflared:latest" : "",
        LATEST ? "ghcr.io/neil1145/cloudflared:latest" : "",
    ]
}
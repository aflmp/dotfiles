#!/bin/bash

EXTENSIONS=(
    golang.go
    hashicorp.terraform
    tsandall.opa
)

for extension in "${EXTENSIONS[@]}"; do
    code --install-extension "$extension"
done
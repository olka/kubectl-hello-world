#!/bin/bash -xe

dist_bin="$1"
dist_sha256=$(shasum -a 256 -b "$dist_bin" | cut -f1 -d' ')

cat <<EOF
class KubectlHelloWorld < Formula
  desc "A kubectl plugin just saying Hello World!"
  homepage "https://github.com/int128/kubectl-hello-world"
  url "https://github.com/int128/kubectl-hello-world/releases/download/${CIRCLE_TAG}/kubectl-hello_world_darwin_amd64"
  version "${CIRCLE_TAG}"
  sha256 "${dist_sha256}"

  def install
    bin.install "kubectl-hello_world_darwin_amd64" => "kubectl-hello_world"
  end

  test do
    system "#{bin}/kubectl-hello_world -h"
  end
end
EOF

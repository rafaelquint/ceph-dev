#!/bin/bash

set -e

cd /ceph/build

"$CEPH_BIN"/ceph dashboard sso setup saml2 \
    https://localhost:11000 \
    /docker/sso/idp-metadata.xml \
    username \
    http://localhost:8080/auth/realms/saml-demo \
    /docker/sso/saml-certificate.txt \
    MIICXQIBAAKBgQC+9kVgPFpshjS2aT2g52lqTv2lqb1jgvXZVk7iFF4LAO6SdCXKXRZI4SuzIRkVNpE1a42V1kQRlaozoFklgvX5sje8tkpa9ylq+bxGXM9RRycqRu2B+oWUV7Aqq7Bs0Xud0WeHQYRcEoCjqsFKGy65qkLRDdT70FTJgpSHts+gDwIDAQABAoGANU1efgc6ojIvwn7Lsf8GAKN9z2D6uS0T3I9nw1k2CtI+xWhgKAUltEANx5lEfBRYIdYclidRpqrk8DYgzASrDYTHXzqVBJfAk1VrAGpqyRq+TNMLUHkXiTiSDOQ6WqhX93UGMmAgQm1RsLa6+fy1BO/B2y85+Yf2OUylsKS6avECQQDslRDiNFdtEjdvyOL20tQ7+W+eKVxVxKAyQ3gFjIIDizELZt+Jq1Wz6XV9NhK1JFtlVugeD1tlW/+K16fEmDYXAkEAzqKoN/JeGb20rfQldAUWdQbb0jrQAYlgoSU/9fYH9YVJT8vnkfhPBTwIw9H9euf1//lRP/jHltHd5ch4230YyQJBAN3rOkoltPiABPZbpuLGgwS7BwOCYrWlWmurtBLoaTCvyVKbrgXybNL1pBrOtR+rufvGWLeRyja65Gs1vY6BBQMCQQCTsNq/MjJj/522f7yNUl2cw4w2lOa7Um+IflFbAcDqkZu2ty0Kvgns2d4B6INeZ5ECpjaWnMA7YkFRzZnkd2NRAkB8lEY56ScnNigoZkkjtEUd2ejdhZPYuS9SKfv9zHwN+I+DE2vVFZz8GPq/iLcMx13PkZaYaJNQ4FtQY/hRLSn5

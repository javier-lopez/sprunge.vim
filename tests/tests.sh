#!/bin/sh

CURRENT_DIR="$(cd "$(dirname "${0}")" && pwd)"
cd "${CURRENT_DIR}" && vim -Nu tests.vimrc -c'+Vader! *.vader'

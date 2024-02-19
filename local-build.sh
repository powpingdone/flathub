#!/usr/bin/env bash

rm -rf _build ; mkdir _build
rm -rf _repo ; mkdir _repo

BRANCH=main

# I do have 32 GB of RAM 
# and 16 Cores. But compiling without a job limitation
# always gave me a "Killed with signal 15".
# Limiting to number of cores with a max of 4GB per job per script may help, too.

powerprofilesctl launch flatpak-builder --ccache --force-clean --default-branch=$BRANCH _build io.github.softfever.OrcaSlicer.yml --repo=_repo --jobs=4

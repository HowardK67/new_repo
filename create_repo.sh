#!/bin/bash
gh repo create new_repo --public --source=. --remote=origin || echo "Failed"

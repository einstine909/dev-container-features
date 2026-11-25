#!/bin/sh

# Install opencode
su - "$_REMOTE_USER" -c "curl -fsSL https://opencode.ai/v2/install | bash"

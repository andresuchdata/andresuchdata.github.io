# Load environment variables from .env file
include .env
export

# Default goal
.DEFAULT_GOAL := serve

# Run Hugo server
serve:
	hugo server --logLevel debug --disableFastRender -p 1313 --baseURL ${HUGO_BASE_URL}

.PHONY: serve
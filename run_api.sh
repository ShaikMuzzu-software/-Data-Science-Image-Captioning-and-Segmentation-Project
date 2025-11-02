#!/usr/bin/env bash
set -e
python -m flask --app app/flask_api.py run --host 0.0.0.0 --port 8000

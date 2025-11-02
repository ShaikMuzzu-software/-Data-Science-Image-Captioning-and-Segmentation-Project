# --- Image Captioning + Segmentation ---
# CPU-friendly base; for CUDA, swap to a CUDA-enabled base and install matching torch version.
FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

# System deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    git curl ffmpeg libsm6 libxext6 \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy files
COPY requirements.txt ./
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . .

# Default command launches Streamlit app
EXPOSE 8501
CMD ["bash", "-lc", "streamlit run app/streamlit_app.py --server.address=0.0.0.0"]

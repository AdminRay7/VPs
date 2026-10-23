FROM python:3.11-slim

# Hugging Face Spaces requires the container to run as UID 1000 (non-root)
RUN useradd -m -u 1000 user

# Switch to the non-root user for all subsequent commands
USER user
ENV HOME=/home/user
ENV PATH=/home/user/.local/bin:$PATH

WORKDIR $HOME/app

# Install Torrus from PyPI
RUN pip install --no-cache-dir torrus

# Start Torrus, binding to 0.0.0.0 and the port defined by Hugging Face (default 7860)
# --no-browser prevents it from trying to open a GUI browser inside the container
CMD ["sh", "-c", "torrus serve --host 0.0.0.0 --port ${PORT:-7860} --no-browser"]
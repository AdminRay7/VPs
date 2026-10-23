FROM python:3.11-slim

WORKDIR /app

# Install Torrus
RUN pip install --no-cache-dir torrus

# Start Torrus. 
# --host 0.0.0.0 is required so Render can route traffic to it.
# --port ${PORT:-10000} uses Render's assigned port, falling back to 10000.
# --no-browser prevents it from trying to open a GUI.
CMD ["sh", "-c", "torrus serve --host 0.0.0.0 --port ${PORT:-10000} --no-browser"]
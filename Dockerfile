FROM python:3.7.3-stretch
# docker build -t app .
# docker run -it app bash
# Create a Working Directory
WORKDIR /app

# Copy source code to working directory
COPY . app.py /app/

# Avoid DL3042 error
ENV PIP_NO_CACHE_DIR=1
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

# Expose port 80


# Run app.py at container launch
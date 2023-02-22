FROM python:3.8-slim-buster

# install required packages for Qt
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libgl1-mesa-glx \
        libxcb-xinerama0 \
        libxcb-icccm4 \
        libxcb-image0 \
        libxcb-keysyms1 \
        libxcb-render-util0 \
        libxcb-xkb1 \
        libxcb-render0 \
        libxcb-shape0 \
        libxcb-xfixes0 \
        libxcb-randr0 \
        libxcb-shm0 \
        libxcb-sync1 \
        libxcb-xinput0 \
        libxcb-xrm0 \
        libxkbcommon-x11-0 \
        libxkbcommon0 && \
    rm -rf /var/lib/apt/lists/*

# set the working directory
WORKDIR /app

# copy the requirements file and install the dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy the application code
COPY myapp .

# set the entrypoint command
CMD ["python", "main.py"]
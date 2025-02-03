FROM texlive/texlive:latest-full

WORKDIR /workdir

# Install extra fonts if needed
RUN apt-get update && apt-get install -y \
    fonts-ebgaramond \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash"]

# Use an official base image with TeX Live full installed
FROM texlive/texlive:latest
# Install dependencies
#RUN apt-get update && \
#    apt-get install -y wget unzip && \
#    rm -rf /var/lib/apt/lists/*

# Download and install garamondx
#RUN wget http://mirrors.ctan.org/install/fonts/garamondx.tds.zip && \
#    unzip garamondx.tds.zip -d /usr/local/texlive/texmf-local/ && \
#    rm garamondx.tds.zip

# Update filename database and font maps
#RUN mktexlsr && \
#    updmap-sys
#RUN updmap-sys --enable Map=zgm.map       # Replace 'zgm.map' with the actual map file name for Garamond, if different
#RUN updmap-sys --enable Map=newtx.map     # If newtx is used, as it's often used alongside Garamond
# Set the working directory in the container
WORKDIR /usr/src/app

# Copy your local LaTeX project into the Docker image
COPY . /usr/src/app/latex-project


#Change working directory to the project directory
WORKDIR /usr/src/app/latex-project/example_paper
# Build your LaTeX project
# Replace 'your-main-tex-file.tex' with the actual main .tex file of your project
RUN latexmk -pdf ./lamonaca.tex

# The resulting PDF will be in /usr/src/app/latex-project directory

FROM fedora:38
ARG TAGS
WORKDIR /usr/local/bin

# Install required dependencies
RUN dnf install -y dnf-plugins-core curl git ansible make gcc

# Add Ansible repository
RUN dnf install -y ansible

# Copy the local files to the container
COPY . .

# Set the default command for the container
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]


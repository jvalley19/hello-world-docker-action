# Container image that runs your code
FROM ubuntu
WORKDIR /usr/src/app
COPY . ./
# Copies your code file from your action repository to the filesystem path `/` of the container

#DD entrypoint.sh /entrypoint.sh
RUN  apt-get update \
  && apt-get install -y wget unzip \
  && rm -rf /var/lib/apt/lists \
  && wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb \
  && dpkg -i packages-microsoft-prod.deb \
  && apt-get update \
  && apt-get install -y powershell \
  && pwsh -Command "Install-Module -Name Az -Force" \
  && pwsh -Command "Install-Module -Name Pester -Force" \
  && pwsh -Command "Install-Module -Name Az.ResourceGraph -Force" \
  && pwsh -Command "Install-Module -Name Az.Accounts -Force" \
  && export VER="1.4.1" \
  && wget -q https://releases.hashicorp.com/packer/${VER}/packer_${VER}_linux_amd64.zip \
  && unzip packer_${VER}_linux_amd64.zip \
  && mv packer /usr/local/bin \
  && apt-get install -y curl apt-transport-https lsb-release gnupg \
  && curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null \
  && AZ_REPO=$(lsb_release -cs) \
  && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | tee /etc/apt/sources.list.d/azure-cli.list \
  && apt-get install apt-transport-https \
  && apt-get update \
  && apt-get install azure-cli \
  && apt-get install -y dotnet-sdk-2.2 

#RUN chmod +x /entrypoint.sh

COPY entrypoint.sh /entrypoint.sh


# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
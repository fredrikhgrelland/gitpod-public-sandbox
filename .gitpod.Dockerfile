FROM gitpod/workspace-full

# Create wrapper for BROWSER env to be pushed as popup from gitpod
COPY .gitpod/bin/browser-override /usr/local/bin/
RUN sudo chmod +x /usr/local/bin/browser-override

# Enable aws connectivity with SSO
COPY .gitpod/bin/aws/aws-sso .gitpod/bin/aws/aws-sso-credential-process /usr/local/bin/
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip -o awscliv2.zip && \
    sudo ./aws/install && \
    sudo chmod +x /usr/local/bin/aws-sso /usr/local/bin/aws-sso-credential-process && \
    echo "export BROWSER=browser-override" >> ~/.bashrc.d/99-custom
FROM python:slim


ENV PATH="/home/tools/.local/bin:${PATH}"

RUN pip install --upgrade pip; \
    apt-get update; \
    apt install openssh-client -y; \
    apt-get clean; \
    useradd -c tools -m -s /bin/bash tools

USER tools

RUN pip install --user ansible; \
    mkdir /home/tools/.ssh; \
    chmod 600 /home/tools/.ssh

WORKDIR /home/tools

CMD ["/bin/bash"]

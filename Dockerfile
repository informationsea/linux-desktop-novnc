FROM debian:10
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y lxde tigervnc-standalone-server novnc firefox-esr fonts-takao man less zip unzip vim zsh emacs uim uim-mozc
ADD run.sh run-in-user.sh /
RUN chmod +x run.sh run-in-user.sh
CMD ["/run.sh"]

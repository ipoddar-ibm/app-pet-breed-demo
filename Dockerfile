FROM jarvice/ubuntu-ibm-mldl-ppc64le

RUN apt-get -y install python-pip cython && apt-get clean
WORKDIR /opt
RUN wget --no-verbose https://github.com/ipoddar-ibm/pet-breed/archive/patch-1.zip && unzip patch-1.zip && rm -f patch-1.zip
RUN cd pet-breed-patch-1 && pip install -r requirements.txt
RUN sed -ie 's/\/root\/pet-breed/\/home\/nimbix\/pet-breed/g' /opt/pet-breed-master/web_demo/app.py
ADD launch.sh /usr/bin/launch.sh
ADD url.txt /etc/NAE/url.txt
RUN chmod 0755 /usr/bin/launch.sh
EXPOSE 22
EXPOSE 5000

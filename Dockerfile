# build the image based on python:3.8-slim-buster image
FROM python:3.8-slim-buster

# metadata in the form of key=value about the maintainer of the image
LABEL Maintainer_Name="Ahmed Ayman" Maintainer_Email="a.ayman6000@gmail.com" 

# create the directory 
RUN mkdir /usr/hello-world

# the work directory inside the container
WORKDIR /usr/hello-world/

# set enviournment variables 
ENV FLASK_APP app.py
ENV FLASK_ENV development

# copy the requirements file inside the container
COPY ./reqs.txt .

# install the requirements using pip3
RUN pip3 install -r reqs.txt

# copy the project artefects into the container under the root directory
COPY . .

# the command to run once we run the container 
CMD [ "python3", "-m", "flask", "run", "--host=0.0.0.0" ]
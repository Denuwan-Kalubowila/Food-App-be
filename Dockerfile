#Use the latest version of Node.js immage as Base Image
FROM node:latest
#Create working Directory inside Container
WORKDIR /usr/src/app
#Copy the content of lacal "server" directory to the root directory
COPY /server/* /
#run npm intall command to insatll dependencies
RUN npm install
#Expose the port to allow incomming connection to the container
EXPOSE 8000
#Start the appliction by running "npm start" command
CMD [ "npm","start" ]
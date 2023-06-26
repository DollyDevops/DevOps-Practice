# pull official base image
FROM node:13.12.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install -g serve

# add app
COPY . ./

# expose port
EXPOSE 3030

# start app
CMD ["npm", "start", "-s", "build"]


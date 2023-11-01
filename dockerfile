FROM node:18.17 

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app code to the container
COPY . .

# Build the Nuxt app
RUN npm run build

# Add Enviroment Variables 
ENV BASE_URL=http://example.com
 
# Expose port 3000
EXPOSE 3000

ENV NUXT_HOST=0.0.0.0

ENV NUXT_PORT=3000

# Start the Nuxt app
CMD [ "node", "/app/.output/server/index.mjs" ]


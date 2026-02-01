FROM node:20-alpine
LABEL authors="osama"

WORKDIR /app

# Copy package files first
COPY vite-project/package*.json ./

# Install dependencies
RUN npm install

# Copy all application files
COPY vite-project/ .

# Create non-root user and change ownership
RUN addgroup -S app && adduser -S app -G app
RUN chown -R app:app /app

# Switch to non-root user
USER app

# Expose Vite's default port
EXPOSE 5173

# Run the development server
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]

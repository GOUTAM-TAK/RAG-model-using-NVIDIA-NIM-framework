# Use the official Python image from the Docker Hub
FROM python:3.10.14-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Set environment variables (optional if not using .env file)
ENV NVIDIA_API_KEY=${NVIDIA_API_KEY}

# Expose the port the app runs on
EXPOSE 8080

# Define the command to run the application
CMD ["streamlit", "run", "app.py", "--server.port=8080"]

# Use the official Python image from the Docker Hub
FROM docker.io/library/python:3.9-slim

# Set the working directory to /my_web_app
WORKDIR /my_web_app

# Copy the current directory contents into the container at /app
COPY . /my_web_app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]

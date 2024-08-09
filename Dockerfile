# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file into the container at /app
COPY api/requirements.txt requirements.txt

# Install any dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY api/ .

# Copy the template files
COPY templates/ /app/templates/

# Expose port 5000 to the outside world
EXPOSE 5000

# Define environment variable
ENV FLASK_ENV=development

# Run app.py when the container launches
CMD ["python", "main.py"]

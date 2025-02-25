# Use Ubuntu as the base image
FROM ubuntu:latest

# Install Python and pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Set the working directory inside the container
WORKDIR /app

# Copy project files
COPY . .

# Install dependencies (Fix for PEP 668)
RUN pip3 install --break-system-packages -r requirements.txt

# Expose port 8000
EXPOSE 8000

# Run FastAPI server
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

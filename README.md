# **FastAPI Docker CI/CD Project** 🚀

This project demonstrates **Continuous Delivery** by automating the creation and deployment of a **Dockerized FastAPI application** using **GitHub Actions**.

---

## **📌 Project Overview**
This repository contains:
- A **FastAPI** application (`main.py`)
- A **Dockerfile** to containerize the application
- A **GitHub Actions workflow** to build and push the image to **Docker Hub** on every push
- A **requirements.txt** file for dependencies
- A **README.md** explaining setup, workflow, and deployment steps

---

## **📂 Project Structure**
```
fastapi-docker-ci/
│── .github/workflows/DockerBuild.yml  # GitHub Actions workflow
│── main.py                            # FastAPI server
│── requirements.txt                    # Project dependencies
│── Dockerfile                          # Docker build configuration
│── README.md                           # Project documentation
```

---

## **🚀 Step 1: Set Up FastAPI Server**
1️⃣ **Create a directory for the project:**
   ```sh
   mkdir fastapi-docker-ci && cd fastapi-docker-ci
   ```

2️⃣ **Create a `main.py` file:**
   ```python
   from fastapi import FastAPI

   app = FastAPI()

   @app.get("/")
   def read_root():
       return {"message": "Hello, FastAPI with Docker and CI/CD!"}
   ```

3️⃣ **Create `requirements.txt`:**
   ```txt
   fastapi
   uvicorn
   ```

---

## **📦 Step 2: Containerize the Application**
1️⃣ **Create a `Dockerfile` in the project root:**
   ```dockerfile
   # Use Ubuntu as the base image
   FROM ubuntu:latest

   # Install Python and pip
   RUN apt-get update && apt-get install -y python3 python3-pip

   # Set the working directory inside the container
   WORKDIR /app

   # Copy project files
   COPY . .

   # Install dependencies
   RUN pip3 install -r requirements.txt

   # Expose port 8000
   EXPOSE 8000

   # Run FastAPI server
   CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
   ```

---

## **💻 Step 3: Build and Run Locally**
1️⃣ **Install dependencies:**
   ```sh
   pip install -r requirements.txt
   ```

2️⃣ **Run the FastAPI app locally:**
   ```sh
   uvicorn main:app --host 0.0.0.0 --port 8000
   ```
   - Open **http://127.0.0.1:8000** in a browser.

3️⃣ **Build the Docker image locally:**
   ```sh
   docker build -t my-fastapi-app .
   ```

4️⃣ **Run the Docker container:**
   ```sh
   docker run -p 8000:8000 my-fastapi-app
   ```
   - The app will be accessible at **http://localhost:8000**.

---

## **📤 Step 4: Push Docker Image to Docker Hub**
1️⃣ **Log in to Docker Hub:**
   ```sh
   docker login -u "<your-dockerhub-username>"
   docker login -u "jajuvidhi"
   ```
   - Enter your **Docker Hub password or token**.

2️⃣ **Tag the image:**
   ```sh
   docker tag my-fastapi-app <your-dockerhub-username>/my-fastapi-app:latest
   docker tag my-fastapi-app jajuvidhi/my-fastapi-app:latest
   ```

3️⃣ **Push the image to Docker Hub:**
   ```sh
   docker push <your-dockerhub-username>/my-fastapi-app:latest
   docker push jajuvidhi/my-fastapi-app:latest
   ```

---

## **🤖 Step 5: Set Up GitHub Actions Workflow**
1️⃣ **Go to your GitHub repository**  
   - Navigate to **Settings → Secrets and variables → Actions**.  
   - Click **New Repository Secret**.  
   - Name it **DOCKERTOKEN**.  
   - Paste your **Docker Hub Token**.  

2️⃣ **Create `.github/workflows/DockerBuild.yml`:**
   ```yaml
   name: Docker image build and push

   on: push  # Triggers the workflow on every push event

   jobs:
     build:
       runs-on: ubuntu-latest
       steps:
         - name: Checkout repository
           uses: actions/checkout@v2

         - name: Log in to Docker Hub
           run: echo ${{ secrets.DOCKERTOKEN }} | docker login -u "<your-dockerhub-username>" --password-stdin

         - name: Build Docker Image
           run: docker build -t <your-dockerhub-username>/my-fastapi-app:latest .

         - name: Push Docker Image
           run: docker push <your-dockerhub-username>/my-fastapi-app:latest
   ```

---

## **📌 Step 6: Push Code to GitHub**
1️⃣ **Initialize Git and commit the files:**
   ```sh
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   ```

2️⃣ **Push to GitHub:**
   ```sh
   git remote add origin https://github.com/<your-username>/fastapi-docker-ci.git
   git push -u origin main
   ```
   ```sh
   git remote add origin https://github.com/vidhi-jaju/fastapi-docker-ci.git
   git push -u origin main
   ```

---

## **✅ Step 7: Verify GitHub Actions**
1️⃣ **Go to your GitHub repository** → Click on the **Actions** tab.  
2️⃣ You should see the workflow running on every push.  
3️⃣ Once completed, your **Docker image will be available in Docker Hub**.  

---

## **📌 Useful Docker Hub Links**
- **Docker Hub Repository URL:**  
  👉 [https://hub.docker.com/r/jajuvidhi/my-fastapi-app](https://hub.docker.com/r/jajuvidhi/my-fastapi-app)  

- **To Pull & Run the Image:**
  ```sh
  docker pull jajuvidhi/my-fastapi-app:latest
  docker run -p 8000:8000 jajuvidhi/my-fastapi-app
  ```

---

## **🎯 Summary**
✅ Created a **FastAPI application**  
✅ **Containerized** it using **Docker**  
✅ **Pushed** the image to **Docker Hub**  
✅ **Automated** the build and deployment using **GitHub Actions**  

Now, every time you push changes to GitHub, the **workflow will rebuild & push** the image to **Docker Hub** automatically! 🚀🔥  

Images For reference-

![FastAPI Docker CI](https://github.com/vidhi-jaju/fastapi-docker-ci/blob/00bfc3a65a4003397511d07fbd59aea76015ac7f/images/1.png)
![FastAPI Docker CI](https://github.com/vidhi-jaju/fastapi-docker-ci/blob/00bfc3a65a4003397511d07fbd59aea76015ac7f/images/2.png)
![FastAPI Docker CI](https://github.com/vidhi-jaju/fastapi-docker-ci/blob/00bfc3a65a4003397511d07fbd59aea76015ac7f/images/3.png)
![FastAPI Docker CI](https://github.com/vidhi-jaju/fastapi-docker-ci/blob/00bfc3a65a4003397511d07fbd59aea76015ac7f/images/4.png)
![FastAPI Docker CI](https://github.com/vidhi-jaju/fastapi-docker-ci/blob/00bfc3a65a4003397511d07fbd59aea76015ac7f/images/5.png)
![FastAPI Docker CI](https://github.com/vidhi-jaju/fastapi-docker-ci/blob/00bfc3a65a4003397511d07fbd59aea76015ac7f/images/6.png)
![FastAPI Docker CI](https://github.com/vidhi-jaju/fastapi-docker-ci/blob/00bfc3a65a4003397511d07fbd59aea76015ac7f/images/7.png)
![FastAPI Docker CI](https://github.com/vidhi-jaju/fastapi-docker-ci/blob/00bfc3a65a4003397511d07fbd59aea76015ac7f/images/8.png)
![FastAPI Docker CI](https://github.com/vidhi-jaju/fastapi-docker-ci/blob/00bfc3a65a4003397511d07fbd59aea76015ac7f/images/9.png)
![FastAPI Docker CI](https://github.com/vidhi-jaju/fastapi-docker-ci/blob/00bfc3a65a4003397511d07fbd59aea76015ac7f/images/10.png)
![FastAPI Docker CI](https://github.com/vidhi-jaju/fastapi-docker-ci/blob/00bfc3a65a4003397511d07fbd59aea76015ac7f/images/11.png)
![FastAPI Docker CI](https://github.com/vidhi-jaju/fastapi-docker-ci/blob/00bfc3a65a4003397511d07fbd59aea76015ac7f/images/12.png)

# 🐳 Docker Revision Notes for DevOps

A beginner-friendly Docker revision guide covering Dockerfiles, networking, volumes, Docker Compose, and core container concepts used in DevOps.

---

# 🚀 What is Docker?

Docker is a containerization platform used to package applications along with their dependencies into isolated environments called containers.

Containers help applications run consistently across:
- local systems
- testing environments
- cloud servers
- production systems

---

# 📦 Dockerfile Keywords

## 1. `FROM`
Defines the base image.

```dockerfile
FROM python:3.11
```

---

## 2. `WORKDIR`
Sets working directory inside container.

```dockerfile
WORKDIR /app
```

---

## 3. `COPY`
Copies files into container.

```dockerfile
COPY . .
```

---

## 4. `RUN`
Executes command during image build.

```dockerfile
RUN pip install -r requirements.txt
```

---

## 5. `CMD`
Default startup command.

```dockerfile
CMD ["python", "app.py"]
```

---

## 6. `ENTRYPOINT`
Fixed startup command.

```dockerfile
ENTRYPOINT ["python"]
```

---

## 7. `EXPOSE`
Documents application port.

```dockerfile
EXPOSE 5000
```

---

## 8. `ENV`
Defines environment variables.

```dockerfile
ENV APP_ENV=production
```

---

# 🧠 Example Dockerfile

```dockerfile
FROM python:3.11

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
```

---

# ⚡ Docker Layer Caching

## Why copy `requirements.txt` separately?

Good practice:

```dockerfile
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
```

### Why?

Docker caches layers.

If application code changes:
- dependencies are NOT reinstalled
- builds become much faster

---

# 🔥 CMD vs ENTRYPOINT

| CMD | ENTRYPOINT |
|---|---|
| Default command | Fixed command |
| Easily overridden | Harder to override |
| Flexible | Strict |

---

## CMD Example

```dockerfile
CMD ["python", "app.py"]
```

---

## ENTRYPOINT Example

```dockerfile
ENTRYPOINT ["python"]
```

---

# 🌐 Docker Port Mapping

## `-p 8080:80`

```bash
docker run -p 8080:80 nginx
```

| Port | Meaning |
|---|---|
| 8080 | Host machine port |
| 80 | Container port |

### Flow

```text
Browser → localhost:8080 → Container:80
```

---

# 📋 docker ps vs docker ps -a

## `docker ps`

Shows only running containers.

```bash
docker ps
```

---

## `docker ps -a`

Shows all containers:
- running
- stopped
- exited

```bash
docker ps -a
```

---

# 🔗 Docker Networking

Containers communicate using:
```text
service names
```

NOT localhost.

---

# Example Docker Compose

```yaml
services:
  web:
  db:
```

Inside `web` container:

```text
db
```

acts as hostname.

---

# ❌ Wrong

```text
localhost
```

Because localhost means:
```text
same container itself
```

---

# ✅ Correct

```text
mysql://db:3306
```

---

# 🌐 Docker Network Types

## 1. Bridge Network

Default Docker network.

Used for:
- normal container communication

---

## 2. Host Network

Container shares host machine network.

Used for:
- performance-sensitive applications

---

## 3. None Network

Container has no network access.

Used for:
- security
- isolated workloads

---

# 📦 Docker Volumes

## What is a Named Volume?

Persistent Docker storage.

Create volume:

```bash
docker volume create mysql-data
```

Use volume:

```bash
-v mysql-data:/var/lib/mysql
```

---

# 🧠 Why Volumes are Important

Without volumes:
```text
container deleted = data deleted
```

With volumes:
```text
data survives container deletion
```

---

# 🛠️ Common Docker Commands

## Build Image

```bash
docker build -t myapp .
```

---

## Run Container

```bash
docker run -p 8080:80 myapp
```

---

## List Running Containers

```bash
docker ps
```

---

## Stop Container

```bash
docker stop container_id
```

---

## Remove Container

```bash
docker rm container_id
```

---

## Remove Image

```bash
docker rmi image_id
```

---

## View Logs

```bash
docker logs container_id
```

---

# 🧩 Docker Compose

Docker Compose is used to manage multi-container applications.

---

# Example Compose File

```yaml
version: '3'

services:

  web:
    build: .
    ports:
      - "5000:5000"

  db:
    image: mysql
```

---

# 🚀 Docker Compose Commands

## Start Services

```bash
docker compose up
```

---

## Run in Background

```bash
docker compose up -d
```

---

## Stop Services

```bash
docker compose down
```

---

# 🎯 Real DevOps Usage

Docker is used for:
- application packaging
- microservices
- CI/CD pipelines
- cloud deployments
- scalable infrastructure
- consistent environments

---

# 📌 Key Learning

Docker helps developers and DevOps engineers:
- package applications
- isolate environments
- automate deployments
- improve scalability
- simplify infrastructure management

---

# 👨‍💻 Author

Harish Vasan S  
Aspiring DevOps Engineer

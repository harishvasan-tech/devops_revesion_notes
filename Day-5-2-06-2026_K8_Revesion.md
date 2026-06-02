# ☸️ Kubernetes Revision Notes - Day 2

## What is Kubernetes?

Kubernetes (K8s) is a container orchestration platform used to deploy, manage, scale, and automate containerized applications.

Instead of manually managing containers, Kubernetes handles:
- Deployment
- Scaling
- Self-healing
- Load balancing
- Rolling updates

---

# Kubernetes Architecture

```text
User
  ↓
kubectl
  ↓
API Server
  ↓
Scheduler
  ↓
Worker Nodes
  ↓
Pods
```

---

# Pod

Smallest deployable unit in Kubernetes.

Contains:
- One or more containers
- Shared networking
- Shared storage

Create Pod:

```yaml
apiVersion: v1
kind: Pod

metadata:
  name: nginx-pod

spec:
  containers:
  - name: nginx
    image: nginx
```

Apply:

```bash
kubectl apply -f pod.yaml
```

---

# Deployment

Manages Pods.

Provides:
- Scaling
- Rolling updates
- Rollbacks
- Self-healing

Example:

```yaml
apiVersion: apps/v1
kind: Deployment

metadata:
  name: nginx-deployment

spec:
  replicas: 3

  selector:
    matchLabels:
      app: nginx

  template:
    metadata:
      labels:
        app: nginx

    spec:
      containers:
      - name: nginx
        image: nginx
```

---

# Service

Provides stable access to Pods.

Without Service:

```text
Pod IP changes
```

With Service:

```text
Stable endpoint
```

---

## ClusterIP

Default Service.

Accessible only inside cluster.

```yaml
type: ClusterIP
```

---

## NodePort

Accessible from outside cluster.

```yaml
type: NodePort
```

Access:

```text
NodeIP:30000
```

---

# Labels

Used to identify resources.

Example:

```yaml
labels:
  app: nginx
```

View labels:

```bash
kubectl get pods --show-labels
```

---

# Selectors

Used by Services and Deployments.

Example:

```yaml
selector:
  app: nginx
```

Matches Pods with:

```yaml
app: nginx
```

---

# Scaling

Increase or decrease Pods.

Manual Scaling:

```bash
kubectl scale deployment nginx-deployment --replicas=5
```

Verify:

```bash
kubectl get pods
```

---

# Rolling Updates

Update application without downtime.

Update image:

```bash
kubectl set image deployment/nginx-deployment nginx=nginx:1.25
```

Check status:

```bash
kubectl rollout status deployment/nginx-deployment
```

---

# Rollback

Revert failed deployment.

History:

```bash
kubectl rollout history deployment/nginx-deployment
```

Rollback:

```bash
kubectl rollout undo deployment/nginx-deployment
```

---

# Namespaces

Logical separation inside cluster.

Create:

```bash
kubectl create namespace dev
```

Deploy:

```bash
kubectl apply -f deployment.yaml -n dev
```

View:

```bash
kubectl get pods -n dev
```

---

# ConfigMap

Stores non-sensitive configuration.

Example:

```yaml
apiVersion: v1
kind: ConfigMap

metadata:
  name: app-config

data:
  APP_ENV: production
```

Use for:
- URLs
- Ports
- Environment values

---

# Secret

Stores sensitive data.

Example:

```yaml
apiVersion: v1
kind: Secret

metadata:
  name: app-secret

type: Opaque

data:
  username: YWRtaW4=
  password: cGFzc3dvcmQ=
```

Base64 encoded.

Used for:
- Passwords
- Tokens
- API Keys

---

# HPA (Horizontal Pod Autoscaler)

Automatically scales Pods.

Example:

```bash
kubectl autoscale deployment nginx-deployment \
--cpu=50% \
--min=2 \
--max=10
```

View:

```bash
kubectl get hpa
```

---

# Useful Commands

Pods:

```bash
kubectl get pods
kubectl describe pod POD_NAME
kubectl delete pod POD_NAME
```

Deployments:

```bash
kubectl get deployments
kubectl describe deployment nginx-deployment
```

Services:

```bash
kubectl get svc
```

Namespaces:

```bash
kubectl get namespaces
```

Logs:

```bash
kubectl logs POD_NAME
```

Shell Access:

```bash
kubectl exec -it POD_NAME -- bash
```

---

# Kubernetes Interview Questions

## What is a Pod?

Smallest deployable unit in Kubernetes.

---

## What is a Deployment?

Manages Pods and provides scaling, updates, and self-healing.

---

## Difference between Deployment and Pod?

Pod:
- Single running instance

Deployment:
- Manages multiple Pods

---

## What is a Service?

Provides stable networking for Pods.

---

## Why use ConfigMap?

Store non-sensitive configuration separately from application code.

---

## Why use Secrets?

Store sensitive information securely.

---

## What is HPA?

Automatically scales Pods based on CPU or memory usage.

---

## What is a Namespace?

Logical isolation within a Kubernetes cluster.

---

# Commands To Remember

```bash
kubectl get pods
kubectl get svc
kubectl get deployments
kubectl describe pod POD_NAME
kubectl logs POD_NAME
kubectl exec -it POD_NAME -- bash
kubectl scale deployment DEPLOYMENT_NAME --replicas=5
kubectl rollout status deployment/DEPLOYMENT_NAME
kubectl rollout undo deployment/DEPLOYMENT_NAME
kubectl get hpa
```

---

# Quick Revision

```text
Pod         → Runs container
Deployment  → Manages Pods
Service     → Network access
Namespace   → Isolation
ConfigMap   → Non-sensitive config
Secret      → Sensitive config
HPA         → Auto scaling
Rollout     → Update application
Rollback    → Revert deployment
```

👨‍💻 Author: Harish Vasan S

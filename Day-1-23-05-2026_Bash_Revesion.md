# 🐧 Bash Revision Notes for DevOps

A beginner-friendly Bash and Linux command revision guide for DevOps and Cloud Engineering.

---

# 📂 Navigation Commands

## `pwd`
Print current working directory.

```bash
pwd
```

Example Output:
```text
/home/devopsvasan
```

---

## `ls`
List files and directories.

```bash
ls
```

### Useful Options

```bash
ls -l
```
Long listing format.

```bash
ls -a
```
Show hidden files.

---

## `cd`
Change directory.

```bash
cd Downloads
```

Go back one directory:

```bash
cd ..
```

Go to home directory:

```bash
cd ~
```

---

# 📁 File and Directory Operations

## `touch`
Create empty file.

```bash
touch file.txt
```

---

## `mkdir`
Create directory.

```bash
mkdir project
```

---

## `cp`
Copy files.

```bash
cp file.txt backup.txt
```

---

## `mv`
Move or rename files.

```bash
mv old.txt new.txt
```

---

## `rm`
Delete files.

```bash
rm file.txt
```

Delete directory recursively:

```bash
rm -r folder
```

---

# 📄 Viewing File Content

## `cat`
Display file content.

```bash
cat file.txt
```

---

## `less`
View large files page by page.

```bash
less logs.txt
```

Exit:
```text
q
```

---

## `head`
Display first 10 lines.

```bash
head file.txt
```

---

## `tail`
Display last 10 lines.

```bash
tail file.txt
```

Live log monitoring:

```bash
tail -f app.log
```

---

# 🔍 Searching Commands

## `grep`
Search text inside files.

```bash
grep error logs.txt
```

Case insensitive search:

```bash
grep -i error logs.txt
```

---

## `find`
Find files and directories.

```bash
find . -name "*.yaml"
```

---

# 🔐 File Permissions

## `chmod`
Change file permissions.

```bash
chmod +x script.sh
```

Make script executable.

---

## `chown`
Change ownership.

```bash
sudo chown user:user file.txt
```

---

# ⚙️ Process Management

## `ps`
View running processes.

```bash
ps aux
```

---

## `top`
Live system monitoring.

```bash
top
```

---

## `kill`
Terminate process.

```bash
kill PID
```

Force kill:

```bash
kill -9 PID
```

---

# 🌐 Networking Commands

## `ping`
Check network connectivity.

```bash
ping google.com
```

---

## `curl`
Transfer data from servers or APIs.

```bash
curl https://google.com
```

---

## `wget`
Download files.

```bash
wget https://example.com/file.zip
```

---

# 📦 Package Management

## Ubuntu Package Commands

Update package list:

```bash
sudo apt update
```

Install package:

```bash
sudo apt install nginx
```

---

# 🌱 Environment Variables

## View Variable

```bash
echo $HOME
```

---

## Create Variable

```bash
export NAME=harish
```

Use variable:

```bash
echo $NAME
```

---

# 📝 Bash Scripting Basics

## Simple Bash Script

```bash
#!/bin/bash

echo "Hello World"
```

Make executable:

```bash
chmod +x script.sh
```

Run script:

```bash
./script.sh
```

---

# 🔀 Conditions

## File Exists Check

```bash
if [ -f file.txt ]
then
  echo "File exists"
fi
```

---

# 🔁 Loops

## For Loop

```bash
for i in 1 2 3
do
  echo $i
done
```

---

# ⭐ Important Special Variables

## `$?`
Exit status of previous command.

```bash
echo $?
```

| Value | Meaning |
|---|---|
| 0 | Success |
| Non-zero | Error |

---

## `$1`
First argument passed to script.

```bash
echo $1
```

Run script:

```bash
./script.sh harish
```

---

# 🛡️ Safe Bash Scripting

## `set -euo pipefail`

```bash
set -euo pipefail
```

### Meaning

| Option | Purpose |
|---|---|
| `-e` | Exit on command failure |
| `-u` | Error on undefined variables |
| `pipefail` | Fail if any pipeline command fails |

---

# 🧠 break vs exit

## `break`
Exit loop only.

```bash
break
```

---

## `exit`
Terminate entire script.

```bash
exit
```

---

# 📊 Useful Monitoring Commands

## Disk Usage

```bash
df -h
```

---

## Memory Usage

```bash
free -h
```

---

## Current User

```bash
whoami
```

---

# 🚀 Common DevOps Bash Commands

| Command | Usage |
|---|---|
| `grep` | Search logs |
| `tail -f` | Monitor live logs |
| `curl` | API testing |
| `chmod +x` | Execute scripts |
| `ps aux` | View processes |
| `top` | System monitoring |
| `find` | Locate files |
| `df -h` | Disk monitoring |
| `free -h` | Memory monitoring |

---

# 📌 Key Learning

Bash is not about memorizing commands.

The goal is to understand:
- What the command does
- Why it is used
- When DevOps engineers use it

---

# 👨‍💻 Author

Harish Vasan S  
Aspiring DevOps Engineer

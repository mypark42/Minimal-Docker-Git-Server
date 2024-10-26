# Minimal Docker Git Server

## Getting Started

### Step 1. Copy your public key in .ssh

example: rsa
```
cp ~/.ssh/id_rsa.pub ./ssh_key.pub
```

### Step 2. build and run git-server with docker

```
docker build -t git-server .
docker run -d git-server
```

### Step 3. test remote repository '/repos/first-repo.git'

```
# In any local git repository.
git remote add my-git git@[git-server-ip]:/repos/first-repo.git
git push my-git master 

# In another directory.
git clone git@[git-server-ip]:/repos/first-repo.git
```

## Create new remote repository
```
ssh git@[git-server-ip]
mkdir /repos/new-repo.git
git init --bare /repos/new-repo.git
```



---
title: pyenv로 Python 설치하기
#description: 
categories: [개발 환경 설정, Ubuntu]
#pin: true
math: true
---

## 1. 개요

**pyenv**는 다양한 버전의 Python을 쉽게 관리하고 설치할 수 있는 도구입니다. 이를 사용하면 여러 Python 버전을 시스템에 설치하고, 필요에 따라 특정 버전을 활성화할 수 있습니다. 아래는 pyenv를 사용하여 Python을 설치하는 방법을 단계별로 설명합니다.

## 2. 설치 방법

### 2.1. 필요한 종속성 설치

- 아래의 명령어를 통해 의존성 패키지를 설치합니다.

```shell
sudo apt update
sudo apt install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev \
liblzma-dev python3-openssl git
```

### 2.2. pyenv: Python 버전 관리 도구 설치하기

- 간단하게 `curl`을 이용하여 설치합니다.
  - `curl`이 없으시면 `sudo apt install curl`로 설치합시다.

```shell
curl https://pyenv.run | bash
```

### 2.3. 환경 설정

pyenv가 설치된 후, pyenv 명령어를 사용할 수 있도록 환경 변수를 설정해야 합니다. 이를 위해 쉘 설정 파일(예: `.bashrc`, `.bash_profile`, `.zshrc`)을 수정합니다.

- 본인의 쉘 설정 파일을 열고 맨 밑에 내용을 추가합니다. (저의 경우에는 `.zshrc`)

```shell
# 쉘 설정 파일 열기
vi ~/.zshrc

# .zshrc
...
# 아래 내용 추가
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
```

- 쉘 설정을 적용합니다.

```shell
source ~/.zshrc
```

### 2.4. pyenv로 Python 설치

- 설치할 수 있는 Python 버전 목록을 확인하고, 원하는 버전을 설치합니다.

```shell
pyenv install --list
pyenv install 3.9.7
```

### 2.5. Python 버전 활성화

- 설치한 Python 버전을 **전역적으로** 활성화하려면 다음 명령어를 사용합니다.

```shell
pyenv global 3.9.7
```

- 설치한 Python 버전을 **특정 디렉토리에서** 활성화하려면 다음 명령어를 사용합니다.
  - **원하는 디렉토리로 이동한 뒤에** 명령어를 실행해야 합니다.

```shell
pyenv local 3.9.7
```

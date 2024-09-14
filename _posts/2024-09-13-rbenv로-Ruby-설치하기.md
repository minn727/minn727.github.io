---
title: rbenv로 Ruby 설치하기
#description: 
categories: [개발 환경 설정, Ubuntu]
#pin: true
math: true
---

## 1. 개요

웬만한 패키지같은 경우에는 `sudo apt` 하나면 만능으로 해결되지만, Ruby의 경우 aptitude로 설치하면 최신 버전이 아닌 3.0 버전까지밖에 설치가 안되더라구요. (저의 경우에 이런 것이라 사용자마다 다를 수 있습니다.) Ruby가 version dependency가 굉장히 심한 언어이다보니 별도의 version manager를 통해서 설치하는 것이 훨씬 편합니다. 기존에 pyenv 등을 사용하시던 분이면 익숙하실거라 생각합니다.

Ruby의 version manager에는 크게

- rvm
- rbenv

이렇게 2가지가 있는데 rbenv가 가볍다보니 많은 사람들이 해당 유틸리티를 사용하고 있습니다. 본 포스트에서는 **rbenv**로 알맞은 버전의 Ruby를 설치하는 방법을 알려드리고자 합니다.

## 2. 설치 방법

### 2.1. 현재 설치된 Ruby 제거하기 (Optional)

- 먼저 기존에 설치된 Ruby 버전을 제거해야 할 수 있습니다.

```shell
sudo apt remove ruby
```

### 2.2. rbenv: Ruby 버전 관리 도구 설치하기

- **(중요)** zsh 쓸 때 기준이므로 기본 shell 쓰시는 분들은 환경 변수를 `~/.bashrc` 에 설정해야 합니다.

```shell
# 필요한 의존성 패키지 설치
sudo apt update
sudo apt install -y git curl autoconf bison build-essential libssl-dev libyaml-dev \
libreadline-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm-dev libgdbm6 libdb-dev

# rbenv 설치
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
exec $SHELL

# ruby-build 플러그인 설치
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
```

### 2.3. 원하는 버전의 Ruby 설치 & 확인하기

- `rbenv install --list`를 통해 설치 가능한 stable release 버전을 확인합니다.
- 원하는 버전의 Ruby를 설치하고, 해당 버전을 활성화한 뒤, 설치가 잘 되었는지 확인합니다.

```shell
rbenv install 3.3.5
rbenv global 3.3.5
rbenv local 3.3.5
ruby -v
```

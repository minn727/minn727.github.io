---
title: Jekyll Chirpy 이용하여 블로그 만들기
#date: YYYY-MM-DD HH:MM:SS +/-TTTT
categories: [GitHub Blog]
#tags: [TAG]     # TAG names should always be lowercase
#description: 
#math: 
#mermaid: 
---

기존에 Markdown 기반 노트 툴인 Obsidian을 사용하고 있었던지라, 블로그 운영에 크게 힘을 들이지 않을 수 있는 GitHub Blog를 플랫폼으로 선택했습니다.

그런데 이게 웬걸... 유명한 Jekyll theme인 Chirpy를 선택해서 블로그를 만드려고 했는데, 쉬울 것으로 예상했지만 예상과 다르게도 수많은 역경과 난관을 거치고 난 뒤에야 블로그 개설을 완료하게 되었습니다. 설치 방법이 나와 있는 블로그마다도 방법이 모두 다르고 필수적으로 수행해야 되는 내용들 또한 파편화 되어있어서 통합 Guideline을 만들고자 하는 마음에 해당 포스트를 작성하게 되었습니다.

제 개발 환경에서의 패키지 버전과 Chirpy 버전은 아래와 같습니다.

- 2024.09 기준
- Chirpy: v7.1.0, Commit Hash = cbc9319
- Ruby & gem
  - Ruby를 깔면 gem도 자동으로 설치가 되므로 <span style="color:red">Ruby 버전만 신경쓰면 됩니다.</span>
  - Ruby: v3.3.5
  - gem: v3.5.16
- node & npm
  - node를 깔면 npm도 자동으로 설치가 되므로 <span style="color:red">node 버전만 신경쓰면 됩니다.</span>
  - node: v20.17.0
  - npm: v10.8.2

# 설치 방법

### 필요 패키지 설치

#### ruby, node 설치

- 아래 제가 작성한 다른 포스트를 보고 알맞은 버전을 설치해주시기 바랍니다.
  - [**rvenv & Ruby 설치**]({% post_url 2024-09-13-rbenv로-Ruby-설치하기%})
  - [**nvm & Node 설치**]({% post_url 2024-09-13-nvm으로-node-설치하기%})

#### jekyll, bundler 설치

- 아래 명령어를 입력하여 `jekyll`과 `bundler`를 설치합니다.

```shell
gem install jekyll bundler
```

### Local 환경에 테마 Clone하기

Chirpy-starter라는 매우 간편한 테마 설치 방법이 있지만, 이것보다는 커스터마이징 자유도가 훨씬 높은 Chirpy Fork를 통해 테마를 설치하도록 하겠습니다.

- [**Chirpy GitHub**](<https://github.com/cotes2020/jekyll-theme-chirpy>)에서 아래와 같이 본인 레포지토리로 fork 해옵니다.
- Repository name은 꼭 `[본인 username].github.io`로 설정해주세요.

![alt text](</assets/img/posts/Blog/스크린샷 2024-09-14 163517.png>)
![alt text](</assets/img/posts/Blog/스크린샷 2024-09-13 213641.png>)

- Repository setting에서 branch 이름을 master에서 main으로 변경합니다.

![alt text](</assets/img/posts/Blog/스크린샷 2024-09-13 213724.png>)

- 아래 명령어를 통해 본인의 local 환경으로 clone 합니다.
  - `[username]`에 본인의 github username을 넣으시면 됩니다.
  - e.g., 저의 경우에는 `git clone https://github.com/minn727/minn727.github.io.git`

```shell
git clone https://github.com/[username]/[username].github.io.git
```

### 테마 초기화

테마를 본격적으로 사용하기 전에 `tools/init.sh`를 통해 initialize 해주는 과정을 거쳐야 하는데, 현재 버전 기준으로 바로 해당 script 파일을 실행하면 commit 순서가 꼬여서 조금 귀찮게 됩니다.

물론 고칠 수 있는 방법은 당연히 있지만, 귀찮음을 방지하기 위해 아래 내용도 <span style="color:red">**꼭 순서대로**</span> 따라와 주시기 바랍니다.

- `tools/init.sh` 파일을 열고 `reset_latest()`에 있는 해당 행을 주석 처리합니다.

![alt text](</assets/img/posts/Blog/스크린샷 2024-09-13 213948.png>)

- 바뀐 내용을 commit하지 않으면 `tools/init.sh` 파일 실행이 불가능하므로 아래와 같이 명령어를 입력하여 스크립트 파일을 실행합니다.

```shell
git add -A
git commit -m "init.sh changed"
tools/init.sh
```

- 다음과 같이 Initialization successful! 이 뜬다면 잘 완료된 것입니다.

![alt text](</assets/img/posts/Blog/스크린샷 2024-09-13 214412.png>)

### 필요 Bundle 설치

- 아래 명령어를 통해 필요 bundle을 설치합니다.

```shell
bundle
```

- 다음과 같이 Bundle complete! 이 뜬다면 잘 완료된 것입니다.
  - `bundle fund` 관련 내용은 error가 아니라 해당 패키지가 말 그대로 자금을 필요로 한다는 내용이어서 넘기면 됩니다.

![alt text](</assets/img/posts/Blog/스크린샷 2024-09-13 214427.png>)

### Local Test

- 위의 설치가 완료되었다면 아래 명령어를 통해 로컬에서 작동하는지 확인합니다.
- 아래 명령어를 입력 후, 웹브라우저에서 127.0.0.1:4000을 입력하였을 때 블로그가 정상적으로 표시되는 지를 확인하면 됩니다.
  - `tools/init.sh`를 통한 초기화로 인해 sample post가 삭제되었기 때문에 빈 블로그가 뜨게 됩니다.

```shell
bundle exec jekyll serve
```

- 여기까지 완료되었으면 지금까지의 내용을 commit 하고, remote origin에 push해줍니다.

```shell
git add -A
git commit -m "first commit"
git push origin
```

### GitHub Pages 관련 수정

이제 GitHub repository에서 Build and deployment 관련 설정을 수정해주어야 합니다. 현재 구글링을 통해 설치 방법 여러개를 보고 테마를 설치하게 되면 해당 순서를 먼저 수행하기도 하는데, 그 경우 remote와 local의 commit이 달라서 git push가 안 되는 등의 에러가 발생할 수 있습니다.

따라서 위의 내용까지 모두 마친 이후에, GitHub Pages 관련 수정을 하는 것을 권장드립니다.

- Repository setting의 Pages 탭에 들어가서 **GitHub Actions**로 변경해줍니다.

![alt text](</assets/img/posts/Blog/스크린샷 2024-09-13 214442.png>)

- **Commit changes... > Sign off and commit changes**를 눌러주게 되면 `.github/workflows` 폴더 안에 `jekyll.yml` 파일이 생성됩니다. 

![alt text](</assets/img/posts/Blog/스크린샷 2024-09-13 214455.png>)

- 위의 파일이 생성되면서 자동으로 GitHub에서 하나의 commit을 생성하게 되므로, 아까 clone해온 local에서 `git pull`을 통해 추가된 `jekyll.yml`을 local로 가져옵니다.

```shell
git pull
```

### GitHub Actions에서 배포 확인하기

- GitHub Actions 탭에서 배포가 잘 되고 있는지를 확인할 수 있습니다.
  - 만약 위의 과정을 모두 순서대로 따라했다면 가장 마지막 commit은 **Create jekyll.yml**이 되어 있을 것입니다.
- 약 1분 정도를 기다린 이후 배포가 잘 되었다면 아래 그림과 같이 표시됩니다.

![alt text](</assets/img/posts/Blog/스크린샷 2024-09-14 170239.png>)
![alt text](</assets/img/posts/Blog/스크린샷 2024-09-14 170223.png>)

## 마무리

설치 이후에 플러그인 설치나 post 작성에 대해서는 다른 포스트 작성 이후 해당 게시글에 링크 걸겠습니다.
포스트 봐주셔서 감사합니다.
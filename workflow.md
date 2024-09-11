## Lubuntu에서 SSH 설정 및 VirtualBox 네트워크 구성

### 1. Lubuntu 설치
- Lubuntu를 설치합니다.

### 2. Lubuntu 내에서 SSH 패키지 설치
- 터미널을 열고 SSH 서버를 설치합니다:
  ```bash
  sudo apt update
  sudo apt install ssh
  ```

### 3. VirtualBox 내에서 네트워크 설정

#### 3-1. VirtualBox의 Lubuntu 설정창에서 브릿지 네트워크 새롭게 개설
- VirtualBox를 열고 Lubuntu 가상 머신을 선택합니다.
- `설정`을 클릭한 후, `네트워크` 탭으로 이동합니다.
- `어댑터 1`에서 `네트워크 어댑터 연결`을 `브리지 어댑터`로 설정합니다.
- `고급` 설정에서 적절한 네트워크 어댑터를 선택합니다.

#### 3-2. Lubuntu 내에서 `ip a` 명령어를 통해 SSH에 이용되는 아이피를 획득
- Lubuntu 내에서 터미널을 열고 다음 명령어를 입력하여 IP 주소를 확인합니다:
  ```bash
  ip a
  ```
- `inet` 항목에서 적절한 IP 주소를 찾습니다.

### 4. VSC에서 SSH 연결 (실패했음), 대안으로 공유폴더 이용

- Visual Studio Code에서 SSH 연결 시도:
  - SSH 확장 프로그램을 설치하고, 설정에서 IP 주소와 로그인 정보를 입력하여 연결을 시도합니다.
  - 연결 실패 시, 대안으로 공유 폴더를 설정합니다.

- 공유 폴더 설정:
  - VirtualBox에서 Lubuntu 가상 머신을 선택하고 `설정`으로 이동합니다.
  - `공유 폴더` 탭에서 새 공유 폴더를 추가합니다.
  - `폴더 경로`와 `폴더 이름`을 설정하고, `자동 마운트`와 `영구적` 옵션을 체크합니다.
  - Lubuntu 내에서 필요한 패키지 설치 및 마운트 명령어 실행
  ```
  sudo apt update
  sudo apt install virtualbox-guest-utils
  sudo mkdir "host dir"
  sudo mount -t vboxsf "host dir" "vm dir"
  ```



  docker compose 설치

  mariadb 설치
  db 생성
  wordpress 설치
  
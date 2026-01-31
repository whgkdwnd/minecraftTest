# MinecraftTest

마인크래프트 Paper 서버용 플러그인 프로젝트입니다.

## 요구 사항

- **Java 21** 이상
- **Gradle 전역 설치 불필요** — 이 프로젝트에는 Gradle Wrapper가 있어, 프로젝트 안에서만 Gradle을 사용합니다.

### Gradle “가상 설치” (전역 설치 없이 사용)

Gradle을 PC에 전역으로 설치하지 않고 이 프로젝트에서만 쓰려면:

1. **최초 1회** — 프로젝트 폴더에서 PowerShell로 실행:
   ```powershell
   .\setup-wrapper.ps1
   ```
   (Gradle 배포판 zip에서 `gradle-wrapper.jar`만 받아옵니다. 네트워크 사용, 수십 초~1분 정도 걸릴 수 있습니다.)

2. **이후 빌드** — 같은 폴더에서:
   ```powershell
   .\gradlew.bat build
   ```

이렇게 하면 Gradle은 **이 프로젝트 디렉터리와 `%USERPROFILE%\.gradle` 캐시**에만 사용되며, 시스템 전역에는 설치되지 않습니다.

## 프로젝트 구조

```
MinecraftTest/
├── build.gradle          # Gradle 빌드 설정
├── settings.gradle
├── gradlew.bat           # Windows용 Gradle Wrapper (전역 Gradle 불필요)
├── gradlew               # Mac/Linux/Git Bash용
├── setup-wrapper.ps1     # 최초 1회: gradle-wrapper.jar 다운로드
├── gradle/wrapper/
│   ├── gradle-wrapper.properties
│   └── gradle-wrapper.jar   ← setup-wrapper.ps1 실행 후 생성됨
├── src/main/
│   ├── java/dev/minecrafttest/
│   │   └── MinecraftTestPlugin.java   # 플러그인 메인 클래스
│   └── resources/
│       └── plugin.yml                 # 플러그인 메타데이터
└── README.md
```

## 빌드 방법

```bash
# JAR 생성 (Windows)
gradlew.bat build

# JAR 생성 (Mac/Linux)
./gradlew build
```

빌드된 플러그인 파일: `build/libs/MinecraftTest-1.0.0.jar`

## 플러그인 설치 방법

1. [Paper 서버](https://papermc.io/downloads)를 다운로드하여 서버를 구성합니다.
2. `build/libs/MinecraftTest-1.0.0.jar`를 서버의 `plugins` 폴더에 복사합니다.
3. 서버를 시작하거나 `/reload confirm` 명령으로 플러그인을 로드합니다.

## 다음 단계

- `MinecraftTestPlugin.java`의 `onEnable()`에서 명령어 등록, 이벤트 리스너 추가
- `plugin.yml`에 `commands`, `permissions` 항목 추가하여 커맨드/권한 정의

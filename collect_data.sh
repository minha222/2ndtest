#!/bin/bash

# 1. 현재 분 계산 및 ID 설정
CURRENT_MIN=$(date +%-M)
TARGET_ID=$(( CURRENT_MIN + 1 ))

# 2. 파일명 설정 (본인 성함으로 수정)
USER_NAME="우민하"
FILE_PATH="${USER_NAME}_test.json"

# 3. 데이터 수집 및 추가 (Incremental Update)
# 깃허브 액션 환경에서는 /tmp/ 대신 현재 폴더에 저장해야 커밋(저장)이 가능합니다.
echo "--- Collected at $(date) ---" >> "$FILE_PATH"
curl -s "https://jsonplaceholder.typicode.com/todos/${TARGET_ID}" >> "$FILE_PATH"
echo -e "\n" >> "$FILE_PATH"
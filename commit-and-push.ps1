# Скрипт для коммита и пуша изменений
# Выполните этот скрипт после перезапуска терминала

Write-Host "Проверка статуса Git..." -ForegroundColor Cyan
git status

Write-Host "`nДобавление всех изменений..." -ForegroundColor Cyan
git add .

Write-Host "`nСоздание коммита..." -ForegroundColor Cyan
git commit -m "feat: replace individual chips with single counter chip in multiselect

- Changed multiselect display to show single chip with count instead of individual chips
- Added clearAllValues function to clear all selected values
- Updated chip styles to make clear icon clickable
- Maintained all existing functionality"

Write-Host "`nПроверка remote..." -ForegroundColor Cyan
$remoteExists = git remote get-url origin -q 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Добавление remote..." -ForegroundColor Yellow
    git remote add origin git@github.com:Poolzoon/weweb-multiselect-input.git
} else {
    Write-Host "Обновление remote URL..." -ForegroundColor Yellow
    git remote set-url origin git@github.com:Poolzoon/weweb-multiselect-input.git
}

Write-Host "`nОтправка изменений на GitHub..." -ForegroundColor Cyan
git branch -M main 2>$null
git push -u origin main

Write-Host "`nГотово!" -ForegroundColor Green


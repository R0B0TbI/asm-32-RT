#!/bin/bash

# Проверяем, передан ли аргумент
if [ -z "$1" ]; then
    echo "Использование: ./build.sh <путь_к_файлу_без_asm>"
    echo "Пример 1: ./build.sh hello"
    echo "Пример 2: ./build.sh lab1/task1"
    exit 1
fi

TARGET="$1"
# Извлекаем имя папки (например, "lab1") и имя файла (например, "task1")
DIR_NAME=$(dirname "$TARGET")
FILE_NAME=$(basename "$TARGET")

# Создаем зеркальную структуру подпапок в build и bin
mkdir -p "build/$DIR_NAME"
mkdir -p "bin/$DIR_NAME"

echo "--- Компиляция src/$TARGET.asm ---"

# 1. Компиляция
nasm -i include/ -f elf32 "src/$TARGET.asm" -o "build/$TARGET.o"
if [ $? -ne 0 ]; then
    echo "❌ Ошибка компиляции!"
    exit 1
fi

# 2. Линковка
ld -m elf_i386 "build/$TARGET.o" -o "bin/$TARGET"
if [ $? -ne 0 ]; then
    echo "❌ Ошибка линковки!"
    exit 1
fi

# 3. Запуск
echo "--- Запуск программы ---"
"./bin/$TARGET"
echo -e "\n--- ✅ Программа завершена с кодом: $? ---"
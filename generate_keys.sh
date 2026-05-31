#!/bin/bash
# Генерация SSH-ключей для student и professor

mkdir -p keys

# Ключ для студентов
ssh-keygen -t rsa -b 4096 -f keys/student_key -N "" -C "student@lab"

# Ключ для преподавателя
ssh-keygen -t rsa -b 4096 -f keys/professor_key -N "" -C "professor@lab"

echo "Ключи созданы:"
ls -la keys/

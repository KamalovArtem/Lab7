# Работа 7 — Ansible

## Структура проекта

```
ansible_lab7/
├── inventory.yml          # Шаг 1: инвентарный файл (9 студентов + 1 преподаватель)
├── ping.yml               # Шаг 1: пинг всех хостов
├── generate_keys.sh       # Шаг 2: генерация SSH-ключей
├── keys/
│   ├── student_key        # Приватный ключ студента (генерируется)
│   ├── student_key.pub    # Публичный ключ студента
│   ├── professor_key      # Приватный ключ преподавателя
│   └── professor_key.pub  # Публичный ключ преподавателя
├── users.yml              # Шаг 2: создание пользователей и копирование ключей
├── network.yml            # Шаг 3: замена репозиториев + Google DNS
├── software.yml           # Шаг 4: установка ПО
├── materials.yml          # Шаг 5: развёртывание учебных материалов
├── student_materials/     # Папка с материалами для студентов
├── teacher_materials/     # Папка с материалами для преподавателя
└── site.yml               # Мастер-плейбук (всё разом)
```

## Порядок выполнения

### Шаг 1 — Инвентарный файл и пинг
```bash
# Проверить подключение ко всем хостам
ansible-playbook -i inventory.yml ping.yml
```

### Шаг 2 — SSH-ключи и пользователи
```bash
# Сгенерировать ключи
bash generate_keys.sh

# Создать пользователей и скопировать ключи
ansible-playbook -i inventory.yml users.yml
```

### Шаг 3 — Настройка сети
```bash
ansible-playbook -i inventory.yml network.yml
```

### Шаг 4 — Установка ПО
```bash
ansible-playbook -i inventory.yml software.yml
```

### Шаг 5 — Учебные материалы
```bash
# Добавьте нужные файлы в папки student_materials/ и teacher_materials/
ansible-playbook -i inventory.yml materials.yml
```

### Запустить всё сразу
```bash
bash generate_keys.sh
ansible-playbook -i inventory.yml site.yml
```

## Что создаётся

| Хост | Пользователь | UID | Группы | Пароль |
|------|-------------|-----|--------|--------|
| student1–student9 | student | 2000 | students | 123 |
| teacher | professor | авто | professor, sudo | Te@cher2024 |

## Требования
- Ansible 2.9+
- Модуль `ansible.posix` (`ansible-galaxy collection install ansible.posix`)
- Все хосты доступны по SSH как root с паролем root

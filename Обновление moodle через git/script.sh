# обновление moodle с 3.7 до 3.8 через git
# Имеем версию 3.7 поставленную на Ubuntu 18.04, необходимо обновить до последней.
# Версия поставлена не через git. Задача перейти на вариант с git и обновиться.
# Каталог где установлено - /var/www/html/moodle/
# Идем - Администрирование - Сервер - Среда = проверяем что все зависимости стоят и нет предупреждений.
# Ставим git если не установлен
apt-get install git
# Начинаем читать документацию (https://docs.moodle.org/38/en/Administration_via_command_line#Upgrading)
# Далее переводим сайт в режим обслуживания
cd /var/www/html/moodle/
/usr/bin/php admin/cli/maintenance.php --enable
# Далее необходимо выкачать версию git
# Переходим cd /usr/src/
git clone git://git.moodle.org/moodle.git
# Говорим git что хотим версию 3.8 (так качается последная dev версия)
cd /usr/src/moodle/
git branch -a
git branch --track MOODLE_38_STABLE origin/MOODLE_38_STABLE
git branch -a
git checkout MOODLE_38_STABLE
# Копируем версию что установлена (на всякий случай)
mkdir /usr/src/moodle37/
cp -r /var/www/html/moodle/ /usr/src/moodle37/
# копируем git версию поверх рабочей
cp -r /usr/src/moodle/ /var/www/html/moodle/
# Запускаем процесс обновления
cd /var/www/html/moodle/
/usr/bin/php admin/cli/upgrade.php --non-interactive
# Выводим из режима обслуживания
/usr/bin/php admin/cli/maintenance.php --disable

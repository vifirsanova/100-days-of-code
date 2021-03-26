# Перенос проекта React JS в репозиторий

## Запускаем командную строку от имени администратора и открываем папку с проектом в Node.js

`C:\>cd "\program files"`

`C:\Program Files>cd nodejs`

`C:\Program Files\nodejs>cd my-app`

## Устанавливаем пакет *gh-pages* 

`C:\Program Files\nodejs\my-app>npm install gh-pages - save-dev`

## Открываем *package.json*

`C:\Program Files\nodejs\my-app>package.json`

![Иллюстрация к проекту](https://sun9-10.userapi.com/impg/09lsUMuS772qbS0gXAeJ9_l-iIHBU-dJmvgJcA/O2Ul0up6u0Y.jpg?size=655x382&quality=96&sign=996182cc7519c4a457768ef48e6011a6&type=album)

## Добавляем в *package.json* ссылку на страницу проекта на GitHub

![Иллюстрация к проекту](https://sun9-11.userapi.com/impg/SCO4CiholHWpz86nBsVBnRND6PdjW0FZrLhOyA/ET9J37zYTG4.jpg?size=712x397&quality=96&sign=c9317aa70eb3e734a713483bf5e2911a&type=album)

## Переходим в раздел *scripts* в *package.json*

Добавляем `"predeploy": "npm run build"` ("связывает" приложение) и `"deploy": "gh-pages -d build"` (запуск приложения)

![](https://sun9-16.userapi.com/impg/wzhAYnjrl-z68_yCk77JsszMNAzRMf2jYusGcQ/gAfabc5pGMI.jpg?size=567x189&quality=96&sign=5c5f90aa6adb5b4df5f23ade0ab85b1b&type=album)

## Обновляем репозиторий

`C:\Program Files\nodejs\my-app>git init`

`C:\Program Files\nodejs\my-app>git remote add origin git@github.com:vifirsanova/asd_qa.git`

`C:\Program Files\nodejs\my-app>npm run deploy`

Команда создает новую ветку в репозитории

![](https://sun9-62.userapi.com/impg/YL1O2JXeFCxo94mMtKkdvYXg8GRmOaXVQySlTQ/j1FzkX8f7oY.jpg?size=386x437&quality=96&sign=b67b018487adcc54d802181e69cbde73&type=album)


## Обновляем настройки репозитория

Выбираем в качестве источника новую ветку

![](https://sun9-56.userapi.com/impg/yoG9se2Nyad43Ad1hLknll-Y5JrHB0YJhVQptQ/W5PeOS-rCJQ.jpg?size=601x205&quality=96&sign=4169c6146baee609f38de47c9c034e92&type=album)

## Тестовое приложение опубликовано онлайн

![](https://sun9-43.userapi.com/impg/WlcmWHPAMokg0UiEEZ4HDc0FEF5cZGS72-3TZg/JVW_vz-4Pic.jpg?size=1663x853&quality=96&sign=d9cc40bcac40a2f5bb3a07a956f447bf&type=album)

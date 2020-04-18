# Como configurar integracion gitlab - jenkins

## General (once for all projects)
- Gitlab
  - Generar token de acceso para comunicacion jenkins - gitlab
    - Clicamos en nuestro usuario en la parte arriba derecha
      - => Settings => Access Tokens => Add a personal access Token
      - Copiamos y pegamos el contenido del token
- Jenkins
  - Instalar los plugins sin no están: [gitlab, git, gitlab hook]
  - Crear credencial con el token de gitlab
    - Credentials => System => Global credentials => Secret Text
      - Creamos con el nombre que queramos, por ejemplo GitlabAPIToken
  - Añadir conexión gitlab
    - Manage Jenkins => Configure System => Gitlab Connections
      - Pegamos el contenido de la credencial GitlabAPIToken

## Per project
- Gitlab
  - Crear un proyecto nuevo
    - Dar permisos de acceso mantainer a cierto usuario
- Jenkins
  - Crear un proyecto en Jenkins
    - General => Gitlab Connection (requiere el plugin de gitlab)
    - Source Code Management => Git (requiere el plugin de git)
      - URL del git
      - Usuario / password de gitlab
      - Branch */master
    - Build Triggers: When a Change is pushed to gitlab (requiere el plugin de gitlab hook)
    - Build:
      - Look on filesystem:
      - path del script groovy relativo al workspace (jenkins se descarga el proyecto de git en el workspace)
- Gitlab
  - Crear webhook con la url del proyecto jenkins, evento push


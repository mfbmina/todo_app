# App Rails de To Do

Nesse to-do list é possível:

* Registrar um usuário / logar (só precisa de um nome, email e senha)
* Adicionar uma tarefa (que é simplesmente um campo de texto)
* Editar uma tarefa
* Remover uma tarefa
* Marcar uma tarefa como completa

Quando um usuário marcar uma tarefa como completa:

* O sistema manda um email para o usuário com uma bela frase aleatória de "Parabéns" (inventa qualquer 5 frases aleatórias) pintada de uma cor hexadecimal aleatória também (inventa 5 e pega uma aleatoriamente)

* Além disso, também tem que enviar um evento para o sistema de tracking. Por simplicidade, o sistema de tracking é só uma tabelinha de eventos que tem um tipo de evento e um campo json em que você manda dados relevantes. No caso, guardar nesse campo json a cor e a frase aleatória do email de "Parabéns".

Algumas exigências dos usuários muito empolgados com o sistema:

* Pelo menos a operação de marcar a tarefa como completa deve ser assíncrona.
* Usar o bootstrap para o CSS
* Fazer deploy no Heroku
* Criar uma rake task que extrai um relatório CSV de todos os eventos com: usuário, cor hexadecimal, frase e a hora que foi marcada como completa (não vale simplesmente imprimir attributes ou o json. tem que ser cada um separado).

Faça o código exatamente como faria no dia-a-dia de trabalho. Não precisa inventar algo para impressionar : ) Só faça com o que está confortável.

# Ruby version
2.4.0

# System dependencies
* Ruby 2.4.0
* Gems listed on Gemfile
* Selenium
* Chromedriver (if you are using Mac OS ```brew install chromedriver```)

# Database creation and initialization
``` rails db:create db:migrate ```

# Running specs
``` rspec ```

# Exporting tracking system
``` rails export:tracks:task_closed ```

If you wanna specify the path use:
``` rails export:tracks:task_closed FILENAME=/path/to/file.csv  ```
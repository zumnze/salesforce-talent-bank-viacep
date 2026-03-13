#  Salesforce Talent Bank - Integração ViaCEP

Aplicação de Banco de Talentos desenvolvida no Salesforce para automatizar o cadastro de candidatos utilizando integração com a API ViaCEP.

##  Funcionalidades
* **Busca de Endereço Automática:** O usuário insere o CEP e os campos de Logradouro, Bairro, Cidade e UF são preenchidos instantaneamente.
* **Interface Reativa:** Utilização de *Action Buttons* em Screen Flows para uma experiência sem recarregamento de página.
* **Integração Apex:** Classe Apex customizada para consumo de API REST.

##  Tecnologias
* **Salesforce Flow** (Screen Flow)
* **Apex Invocable Methods** (Integração HTTP)
* **JSON Parsing**
* **Linguagem:** Apex (.cls)

## 📸 Demonstração

- Screen flow
<img width="1521" height="809" alt="image" src="https://github.com/user-attachments/assets/d81fdc08-6748-4856-bcb9-ef647c20555f" />

<img width="1725" height="731" alt="image" src="https://github.com/user-attachments/assets/5e9cc99d-2b22-4b89-82bb-b361dee6c4e9" />

- Sub-flow para a ação de retorno da Apex Class 'ViaCEPService.cls'
<img width="1919" height="858" alt="image" src="https://github.com/user-attachments/assets/a54e648a-5dc2-496a-9146-3d770352a458" />




// Apex Class

public class ViaCEPService {
    
    // essa estrutura vai definir o que o Flow vai receber
    public class Result {
        @InvocableVariable(label='Logradouro') public String logradouro;
        @InvocableVariable(label='Bairro') public String bairro;
        // O label é 'Cidade' para o Flow, mas a variável é 'localidade' como na API
        @InvocableVariable(label='Cidade') public String localidade; 
        @InvocableVariable(label='UF') public String uf;
        @InvocableVariable(label='Erro') public Boolean erro;
    }

    @InvocableMethod(label='Buscar CEP ViaCEP' category='Integrations')
    public static List<Result> getAddress(List<String> ceps) {
        List<Result> results = new List<Result>();
        
        for (String cep : ceps) {
            Result res = new Result();
            try {
                // Validação de CEP
                if (cep == null || cep.length() < 8) {
                    res.erro = true;
                    results.add(res);
                    continue;
                }

                Http http = new Http();
                HttpRequest request = new HttpRequest();
                
                // Limpa o CEP (remove traços e espaços)
                String cleanCep = cep.replace('-', '').replace(' ', '');
                request.setEndpoint('https://viacep.com.br/ws/' + cleanCep + '/json/');
                request.setMethod('GET');
                
                HttpResponse response = http.send(request);
                
                if (response.getStatusCode() == 200) {
                    // Transforma o JSON em um mapa de dados
                    Map<String, Object> data = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                    
                    // Verifica se o ViaCEP retornou erro (CEP não encontrado)
                    if (data.containsKey('erro')) {
                        res.erro = true;
                    } else {
                        res.logradouro = (String) data.get('logradouro');
                        res.bairro = (String) data.get('bairro');
                        res.localidade = (String) data.get('localidade'); // Puxa localidade do JSON
                        res.uf = (String) data.get('uf');
                        res.erro = false;
                    }
                } else {
                    res.erro = true;
                }
            } catch (Exception e) {
                res.erro = true;
            }
            results.add(res);
        }
        return results;
    }
}

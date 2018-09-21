<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="css/bootstrap.min.css" >
		<title>Calcular IMC</title>
	</head>

	<body>
		<div class="card">
		  <div class="card-header">
		    Calcular IMC
		  </div>
		  <div class="card-body">
		    <h5 class="card-title">Calcule o seu IMC</h5>
		    <p class="card-text">Informe seu peso e altura...</p>
		    
		    <form>
			  <div class="form-group">
			    <label for="exampleInputEmail1">Peso</label>
			    <input type="text" class="form-control" id="peso" name="peso" aria-describedby="pesoHelp" placeholder="Informe seu peso" value="0"> 
			    <small id="pesoHelp" class="form-text text-muted">Informe seu peso em Quilogramas(Kg).</small>
			  </div>
			  <div class="form-group">
			    <label for="exampleInputEmail1">Altura</label>
			    <input type="text" class="form-control" id="altura" name="altura" aria-describedby="alturaHelp" placeholder="Informe sua altura" value="0">
			    <small id="alturaHelp" class="form-text text-muted">Informe sua altura em Metros(M).</small>
			  </div>			  
			  <button type="submit" class="btn btn-primary">Calcular</button>
			</form>
		  </div>
		</div>
		<% 
			//Recebe variaveis e trata		
			try{
			 	float altura = Float.parseFloat(request.getParameter("altura"));
				float peso   = Float.parseFloat(request.getParameter("peso"));
								
				//Verificando parametros são maiores que 0
				if(altura <= 0.0f) throw new Exception("Altura tem que ser maior que 0!");
				if(peso   <= 0.0f) throw new Exception("Peso tem que ser maior que 0!");
				
				
				if(peso > 0.0f && altura > 0.0f){
					String msg = "";
					String alert = "";
					float imc = peso/(altura*altura);
					
					if(imc < 17.0f){ //Muito abaixo do peso
						alert = "danger";
						msg = "Muito abaixo do peso!";						
					}else if(imc <= 18.49f){ //Abaixo do peso
						alert = "warning";
						msg = "Abaixo do peso!";												
					}else if(imc <= 24.99f){ //Peso Normal
						alert = "success";
						msg = "Peso Normal!";						
					}else if(imc <= 29.99f){ //Acima do peso
						alert = "warning";
						msg = "Acima do peso!";						
					}else if(imc <= 34.99f){ //Obesidade I
						alert = "danger";
						msg = "Obesidade I!";						
					}else if(imc <= 39.99f){ //Obesidade II (Severa)
						alert = "danger";
						msg = "Obesidade II (Severa)!";						
					}else{ //Obesidade III (Mórbida)
						alert = "danger";
						msg = "Obesidade III (Mórbida)!";								
					}
					
					%>
					<div class="alert alert-<%=alert%>" role="alert">
					   <%= "IMC: "+imc+" | "+msg %>
					</div>
					<%					
					
				}
			}catch(NullPointerException e){
				return; //Parametros nulos... Simplesmente não faz nada
			}catch(Exception e){
				//Parametros errados
				%>
				<div class="alert alert-dark" role="alert">
				  Erro ao calcular IMC... Parametros inválidos MSG: <%= e.getMessage() %>
				</div>
				<%
			}

		
		%>
		<small class="form-text text-muted">by @Jônathas Assunção | 2018</small>					    
	</body>
</html>
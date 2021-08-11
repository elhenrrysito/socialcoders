package com.oneteam.socialcoders.controllers;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
@RequestMapping("/test")
public class TestController {

    @GetMapping("/seleccionarLenguaje")
    public String lenguaje(){
        return "/test/lenguajes.jsp";
    }
    @RequestMapping("/java")
    public String preguntasJava(@RequestParam(value = "correcta", required = false) String respuesta,
    @RequestParam(value = "correcta2", required = false) String respuesta2, @RequestParam(value = "correcta3", required =false) String respuesta3, Model model) {
         
        HashMap<String, Object> pyr = new HashMap<>();

        HashMap<String, String> respuestas = new HashMap<>();

        respuestas.put("mala1", "Método para ordenar un Array");
        respuestas.put("mala2", "Llamar una función");
        respuestas.put("mala3", "Declarar variable");
        respuestas.put("correcta", "Imprimir en la consola");
        
        pyr.put("¿Para qué se usa System.out.println en Java?", respuestas);

        HashMap<String, String> respuestas2 = new HashMap<>();

        respuestas2.put("mala1", "Const");
        respuestas2.put("mala2", "Var");
        respuestas2.put("correcta2", "Depende del tipo de dato");
        respuestas2.put("mala3", "Int");

        pyr.put("¿Cómo se declara una variable en Java?", respuestas2);

        HashMap<String, String> respuestas3 = new HashMap<>();

        respuestas3.put("mala1", "Float es un tipo de dato y Double es nombre de una variable");
        respuestas3.put("correcta3", "un double tiene 15 dígitos decimales de precisión, mientras que el tipo de dato float tiene solamente 7");
        respuestas3.put("mala2", "Son lo mismo");
        respuestas3.put("mala3", "Double contiene números y Float letras");

        pyr.put("¿Cuál es la diferencia entre Float y Double?", respuestas3);

        model.addAttribute("pyr", pyr);
        
       return "/test/java.jsp";
    }
    @PostMapping("/java")
    public String verificarJava(@RequestParam(value = "¿Para qué se usa System.out.println en Java?") String respuesta,
    @RequestParam(value = "¿Cómo se declara una variable en Java?") String respuesta2,  @RequestParam(value = "¿Cuál es la diferencia entre Float y Double?") String respuesta3){

        HashMap<String, Object> pyr = new HashMap<>();

        HashMap<String, String> respuestas = new HashMap<>();

        respuestas.put("mala1", "Método para ordenar un Array");
        respuestas.put("mala2", "Llamar una función");
        respuestas.put("mala3", "Declarar variable");
        respuestas.put("correcta", "Imprimir en la consola");
        
        pyr.put("¿Para que se usa System.out.println en Java?", respuestas);

        HashMap<String, String> respuestas2 = new HashMap<>();

        respuestas2.put("mala1", "Const");
        respuestas2.put("mala2", "Var");
        respuestas2.put("correcta2", "Depende del tipo de dato");
        respuestas2.put("mala3", "Int");

        pyr.put("¿Cómo se declara una variable en Java?", respuestas2);

        HashMap<String, String> respuestas3 = new HashMap<>();

        respuestas3.put("mala1", "Float es un tipo de dato y Double es nombre de una variable");
        respuestas3.put("correcta3", "un double tiene 15 dígitos decimales de precisión, mientras que el tipo de dato float tiene solamente 7");
        respuestas3.put("mala2", "Son lo mismo");
        respuestas3.put("mala3", "Double contiene número y Float letras");

        pyr.put("¿cuál es la diferencia entre Float y Double?", respuestas3);

        int count = 0;
        if(respuesta.equals(respuestas.get("correcta"))){
            count++; 
        }
        if(respuesta2.equals(respuestas2.get("correcta2"))){
            count++;
        }
        if(respuesta3.equals(respuestas3.get("correcta3"))){
            count++;
        }
        System.out.println(count);
        
        if(count < 2){

            return "redirect:/test/java?error="+(3-count);
        } else {
            return "redirect:/registration";
        }
       
 }
    @RequestMapping("/javascript")
    public String preguntasJavaScript(@RequestParam(value = "correcta", required = false) String respuesta,
    @RequestParam(value = "correcta2", required = false) String respuesta2,
    @RequestParam(value = "correcta3", required = false) String respuesta3, Model model) {
         
        HashMap<String, Object> preguntaYrespuesta = new HashMap<>();
       
        HashMap<String, String> respuestas = new HashMap<>();

        respuestas.put("mala1", "String, booleano, Objeto");
        
        respuestas.put("mala2", "Var, Let, Const");
        respuestas.put("mala3", "solo String y y Número");
        respuestas.put("correcta", "String, booleano, Objeto, Número, Indefinido.");
        preguntaYrespuesta.put("¿Cuáles son los tipos de datos JavaScript?", respuestas);

        HashMap<String, String> respuestas2 = new HashMap<>();

        respuestas2.put("mala1", "Igualar una variable de una funcion");
        respuestas2.put("mala2", "Editar tipos de datos");
        respuestas2.put("correcta2", "Arroja verdadero (true) cuando los dos operandos poseen el mismo valor sin ningún tipo de conversión");
        respuestas2.put("mala3", "Sumar 2 numeros");
        preguntaYrespuesta.put("¿Qué es el operador ===?", respuestas2);

        HashMap<String, String> respuestas3 = new HashMap<>();

        respuestas3.put("mala1", "Solo For y While");
        respuestas3.put("mala2", "For, else, switch");
        respuestas3.put("correcta3", "For, While, Do-While, forEach");
        respuestas3.put("mala3", "For, While, Do-While, switch");
        preguntaYrespuesta.put("¿Cuáles son todos los bucles en JavaScript?", respuestas3);


        model.addAttribute("preguntaYrespuesta", preguntaYrespuesta);

        return "/test/javascript.jsp";
        
    }

    @PostMapping("/javascript")
    public String verificarJavascript(@RequestParam(value = "¿Cuáles son los tipos de datos JavaScript?") String respuesta,
    @RequestParam(value = "¿Qué es el operador ===?") String respuesta2,
    @RequestParam(value = "¿Cuáles son todos los bucles en JavaScript?") String respuesta3){

        HashMap<String, Object> preguntaYrespuesta = new HashMap<>();
        HashMap<String, String> respuestas = new HashMap<>();

        respuestas.put("mala1", "String, booleano, Objeto");
        
        respuestas.put("mala2", "Var, Let, Const");
        respuestas.put("mala3", "solo String y y Número");
        respuestas.put("correcta", "String, booleano, Objeto, Número, Indefinido.");
        preguntaYrespuesta.put("¿Cuáles son los tipos de datos JavaScript?", respuestas);

        HashMap<String, String> respuestas2 = new HashMap<>();

        respuestas2.put("mala1", "Igualar una variable de una funcion");
        respuestas2.put("mala2", "Editar tipos de datos");
        respuestas2.put("correcta2", "Arroja verdadero (true) cuando los dos operandos poseen el mismo valor sin ningún tipo de conversión");
        respuestas2.put("mala3", "Sumar 2 numeros");
        preguntaYrespuesta.put("¿Qué es el operador ===?", respuestas2);

        HashMap<String, String> respuestas3 = new HashMap<>();

        respuestas3.put("mala1", "Solo For y While");
        respuestas3.put("mala2", "For, else, switch");
        respuestas3.put("correcta3", "For, While, Do-While, forEach");
        respuestas3.put("mala3", "For, While, Do-While, switch");
        preguntaYrespuesta.put("¿Cuáles son todos los bucles en JavaScript?", respuestas3);

        int count = 0;
        if(respuesta.equals(respuestas.get("correcta"))){
            count++; 
        }
        if(respuesta2.equals(respuestas2.get("correcta2"))){
            count++;
        }
        if(respuesta3.equals(respuestas3.get("correcta3"))){
            count++;
        }
        
        if(count < 2){

            return "redirect:/test/javascript?error="+(3-count);
        } else {
            return "redirect:/registration";
        }
       
    }

    @RequestMapping("/python")
    public String preguntasPython(@RequestParam(value = "correcta", required = false) String respuesta,
    @RequestParam(value = "correcta2", required = false) String respuesta2, @RequestParam(value = "correcta3", required = false) String respuesta3, Model model) {
         
        HashMap<String, Object> preyRe = new HashMap<>();

        HashMap<String, String> respuestas = new HashMap<>();

        respuestas.put("mala1", "Para llamar una funcion");
        respuestas.put("mala2", "Tipo de dato");
         respuestas.put("correcta", "Es una variable de entorno y se usa cuando se importa un módulo");
        respuestas.put("mala3", "Declarar un una condicion");
       
        preyRe.put("¿Qué es PYTHONPATH?", respuestas);

        HashMap<String, String> respuestas2 = new HashMap<>();

        respuestas2.put("mala1", "Los comentarios en Python son //");
        respuestas2.put("correcta", "Los comentarios en Python empiezan con un carácter #");
        respuestas2.put("mala2", "Los comentarios en Python son */");
        respuestas2.put("mala3", "Los comentarios en Python son <<");
       
        preyRe.put("¿Cómo se escriben los comentarios en Python?", respuestas2);
       
        HashMap<String, String> respuestas3 = new HashMap<>();

        respuestas3.put("mala1", "Busca el numero menor de un arreglo");
        respuestas3.put("mala2", "Agrega un elemento a un arreglo");
        respuestas3.put("mala3", "Es la forma de llamar a una variable");
        respuestas3.put("correcta", "Se usa para determinar la longitud de una lista, matriz, cadena etc.");
       
        preyRe.put("¿Qué hace len()?", respuestas3);
    
        model.addAttribute("preyRe", preyRe);
       
       return "/test/python.jsp";
    }

    @PostMapping("/python")
    public String verificarPython(@RequestParam(value = "¿Qué es PYTHONPATH?") String respuesta,
    @RequestParam(value = "¿Cómo se escriben los comentarios en Python?") String respuesta2,
    @RequestParam(value = "¿Qué hace len()?") String respuesta3){

        HashMap<String, Object> preyRe = new HashMap<>();
        HashMap<String, String> respuestas = new HashMap<>();

        respuestas.put("mala1", "String, booleano, Objeto");
        
        respuestas.put("mala2", "Var, Let, Const");
        respuestas.put("mala3", "solo String y y Número");
        respuestas.put("correcta", "String, booleano, Objeto, Número, Indefinido.");
        preyRe.put("¿Cuáles son los tipos de datos JavaScript?", respuestas);

        HashMap<String, String> respuestas2 = new HashMap<>();

        respuestas2.put("mala1", "Igualar una variable de una funcion");
        respuestas2.put("mala2", "Editar tipos de datos");
        respuestas2.put("correcta2", "Arroja verdadero (true) cuando los dos operandos poseen el mismo valor sin ningún tipo de conversión");
        respuestas2.put("mala3", "Sumar 2 numeros");
        preyRe.put("¿Qué es el operador ===?", respuestas2);

        HashMap<String, String> respuestas3 = new HashMap<>();

        respuestas3.put("mala1", "Solo For y While");
        respuestas3.put("mala2", "For, else, switch");
        respuestas3.put("correcta3", "For, While, Do-While, forEach");
        respuestas3.put("mala3", "For, While, Do-While, switch");
        preyRe.put("¿Cuáles son todos los bucles en JavaScript?", respuestas3);

        int count = 0;
        if(respuesta.equals(respuestas.get("correcta"))){
            count++; 
        }
        if(respuesta2.equals(respuestas2.get("correcta2"))){
            count++;
        }
        if(respuesta3.equals(respuestas3.get("correcta3"))){
            count++;
        }
        
        if(count < 2){

            return "redirect:/test/python?error="+(3-count);
        } else {
            return "redirect:/registration";
        }
       
    }

    @RequestMapping("/c++")
    public String preguntasCmasmas(@RequestParam(value = "correcta", required = false) String respuesta,
    @RequestParam(value = "correcta2", required = false) String respuesta2,
    @RequestParam(value = "correcta3", required = false) String respuesta3, Model model) {
        
        HashMap<String, Object> preyRes = new HashMap<>();
        
        HashMap<String, String> respuestas = new HashMap<>();

        respuestas.put("correcta", "Verdadero");
        respuestas.put("mala", "Falso");
       
        preyRes.put("La sentencia cin >> var1, se utiliza para ingresar un valor a una variable desde teclado...", respuestas);

        HashMap<String, String> respuestas2 = new HashMap<>();

        respuestas2.put("correcta", "Verdadero");
        respuestas2.put("mala", "Falso");
       
        preyRes.put("Un código en C++ debe pasar por los procesos de Compilación y Ejecución", respuestas2);

        HashMap<String, String> respuestas3 = new HashMap<>();

        respuestas3.put("mala", "Una Biblioteca");
        respuestas3.put("mala2", "Una Biblioteca");
        respuestas3.put("correcta", "Una constante");
        respuestas3.put("mala3", "Una funcion");
       
        preyRes.put("La sentencia en C++: const float PI=3.14; hace referencia a:", respuestas3);

        model.addAttribute("preyRes", preyRes);
       
       return "/test/c.jsp";
    }

    @PostMapping("/c++")
    public String verificarCmasmas(@RequestParam(value = "La sentencia cin >> var1, se utiliza para ingresar un valor a una variable desde teclado...") String respuesta,
    @RequestParam(value = "Un código en C++ debe pasar por los procesos de Compilación y Ejecución") String respuesta2,
    @RequestParam(value = "La sentencia en C++: const float PI=3.14; hace referencia a:") String respuesta3){

        HashMap<String, Object> preyRes = new HashMap<>();
        
        HashMap<String, String> respuestas = new HashMap<>();

        respuestas.put("correcta1", "Verdadero");
        respuestas.put("mala", "Falso");
       
        preyRes.put("La sentencia cin >> var1, se utiliza para ingresar un valor a una variable desde teclado...", respuestas);

        HashMap<String, String> respuestas2 = new HashMap<>();

        respuestas2.put("correcta2", "Verdadero");
        respuestas2.put("mala", "Falso");
       
        preyRes.put("Un código en C++ debe pasar por los procesos de Compilación y Ejecución", respuestas2);


        HashMap<String, String> respuestas3 = new HashMap<>();

        respuestas3.put("mala", "Una Biblioteca");
        respuestas3.put("mala2", "Una Biblioteca");
        respuestas3.put("correcta3", "Una constante");
        respuestas3.put("mala3", "Una funcion");
       
        preyRes.put("La sentencia en C++: const float PI=3.14; hace referencia a:", respuestas3);

        int count = 0;
        if(respuesta.equals(respuestas.get("correcta"))){
            count++; 
        }
        if(respuesta2.equals(respuestas2.get("correcta2"))){
            count++;
        }
        if(respuesta3.equals(respuestas3.get("correcta3"))){
            count++;
        }
        
        if(count < 2){

            return "redirect:/test/c++?error="+(3-count);
        } else {
            return "redirect:/registration";
        }
       
    }
}

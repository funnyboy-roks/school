// GRAMMAR
grammar WeirdCalc;

@header {
    import java.util.HashMap;
    import java.util.Map;
}

@members {
    private Map<String, Integer> env;
 
    public Map<String, Integer> getEnv() {
        return env;
    }
}

// PARSER
program
       @init {
           env = new HashMap<>();
       }
       : program line
       | epsilon
       ;

epsilon:;

line   : assign SEMICOLON
       | print SEMICOLON
       ;

assign : IDENT EQUALS exp {
           env.put($IDENT.text, $exp.n);
       }
       ;

print  : PRINT LPAREN exp RPAREN {
        System.out.println($exp.n);
        }
       | PRINT LPAREN RPAREN {
        System.out.println();
       }
       ;

exp returns [int n] :
        e=exp HASH item { 
            $n = $e.n % $item.n == 0 ? 0 : 1;
        }
        | item {
             $n = $item.n;
        }
        ;

item returns [int n] : o=operand AT i=item {
           $n = Math.abs($o.n + $i.n);
       }
       | o=operand TILDE i=item {
           $n = $o.n * $o.n + $i.n * $i.n;
       }
       | operand {
           $n = $operand.n;
       }
       ;

operand returns [int n]: DOLLAR o=operand {
            $n = $o.n < 0 ? -1 : $o.n > 0 ? 1 : 0;
        }
        | data {
            $n = $data.n;
        }
        ;

data returns [int n]: NUMBER {
            $n = Integer.parseInt($NUMBER.text);
       }
       | IDENT {
            $n = env.get($IDENT.text);
       }
       ;

// LEXER
SEMICOLON : ';'                       ;
EQUALS    : '='                       ;
PRINT     : 'print'                   ;
LPAREN    : '('                       ;
RPAREN    : ')'                       ;
HASH      : '#'                       ;
AT        : '@'                       ;
TILDE     : '~'                       ;
DOLLAR    : '$'                       ;
NUMBER    : '-'?[0-9]+                ;
IDENT     : [a-zA-Z][a-zA-Z0-9]*      ;
SPACE     : [ \t\n\r\f]+ -> skip      ;
COMMENT   : '//' ~('\r'|'\n')* -> skip;

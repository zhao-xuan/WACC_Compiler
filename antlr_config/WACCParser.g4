parser grammar WACCParser;

options {
  tokenVocab=WACCLexer;
}

program     : BEGIN func* stat END ;
func        : type IDENT OPEN_PARENTHESES param_list? CLOSE_PARENTHESES IS stat END;
param_list  : param (COMMA param )* ;
param       : type IDENT;

stat : SKP
     | READ assign_lhs  
     | FREE expr  
     | RETURN expr  
     | EXIT expr  
     | PRINT expr  
     | PRINTLN expr  
     | IF expr THEN stat ELSE stat FI | WHILE expr DO stat DONE
     | BEGIN stat END
     | stat SEMICOLON stat
     | type IDENT ASSIGN assign_rhs
     | assign_lhs ASSIGN assign_rhs
     ;

assign_lhs : IDENT 
           | array_elem  
           | pair_elem 
           ;

assign_rhs : expr 
           | array_liter 
           | NEWPAIR OPEN_PARENTHESES expr  COMMA expr  CLOSE_PARENTHESES | pair_elem 
           | CALL IDENT  OPEN_PARENTHESES arg_list? CLOSE_PARENTHESES
           ;

// argument list for functions 
arg_list  : expr (COMMA expr)*;
pair_elem : FST expr
          | SND expr
          ;

type : BASE_TYPE  
     | array_type
     | pair_type 
     ;

array_type     : array_type OPEN_SQUARE_BRACKET CLOSE_SQUARE_BRACKET 
               | BASE_TYPE OPEN_SQUARE_BRACKET CLOSE_SQUARE_BRACKET
               | pair_type OPEN_SQUARE_BRACKET CLOSE_SQUARE_BRACKET
               ;
pair_type      : PAIR OPEN_PARENTHESES pair_elem_type  COMMA pair_elem_type  CLOSE_PARENTHESES ;
pair_elem_type : BASE_TYPE  
               | array_type  
               | PAIR 
               ;

expr : expr PLUS expr   #PlusExpr
     | expr BINOP expr  #BinopExpr
     | expr MINUS expr  #MinusExpr
     | INT_LITER   #IntExpr
     | (PLUS | MINUS) INT_LITER #SignedIntExpr
     | BOOL_LITER  #BoolExpr
     | CHAR_LITER  #CharExpr
     | STR_LITER   #StrExpr
     | PAIR_LITER  #PairExpr
     | IDENT       #IdentExpr
     | array_elem  #ArrayExpr
     | UNOP expr   #UnopExpr
     | MINUS expr  #NegExpr
     | OPEN_PARENTHESES expr CLOSE_PARENTHESES #ParenExpr
     ;

array_elem  : IDENT (OPEN_SQUARE_BRACKET expr CLOSE_SQUARE_BRACKET)+ ;
array_liter : OPEN_SQUARE_BRACKET (expr (COMMA expr)*)? CLOSE_SQUARE_BRACKET ;
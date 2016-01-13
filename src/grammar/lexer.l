%{

#include <string>
#include "scanner.hpp"


typedef FrontEnd::Parser::token token;


#define STOKEN( x ) ( new std::string( x ) )
/* #define yyterminate() return( token::END ) */

/* msvc2010 requires that we exclude this header file. */
#define YY_NO_UNISTD_H

%}

%option debug 
%option nodefault 
%option yyclass="FrontEnd::Scanner" 
%option noyywrap 
%option c++

%%


[a-z]       { 
               return( token::LOWER );     
            }

[A-Z]       { 
               return( token::UPPER );     
            }

[a-zA-Z]+   { 
               yylval->sval = STOKEN( yytext );  
               return( token::WORD );      
            }

\n          { 
               return( token::NEWLINE );   
            }

.           { 
               return( token::CHAR );      
            }
%%



#ifndef __SCANNER_HPP__
#define __SCANNER_HPP__ 1

#if ! defined(yyFlexLexerOnce)
#include <FlexLexer.h>
#endif

#include "parser.tab.hpp"

namespace FrontEnd{

class Scanner : public yyFlexLexer{
public:
   
   Scanner(std::istream *in) : yyFlexLexer(in),
                                  yylval( nullptr ){};
   
   int yylex(FrontEnd::Parser::semantic_type * const lval)
   {
      yylval = lval;
      return( yylex() ); 
   }
   

private:
   /* hide this one from public view */
   int yylex();
   /* yyval ptr */
   FrontEnd::Parser::semantic_type *yylval;
};

}

#endif

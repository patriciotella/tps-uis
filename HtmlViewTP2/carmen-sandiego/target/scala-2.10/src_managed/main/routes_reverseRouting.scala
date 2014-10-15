// @SOURCE:/home/julian/Documentos/UNQ/UI-Workspace/HtmlViewTP2/carmen-sandiego/conf/routes
// @HASH:58bc07fdea299a047dd71e28f7f26dc3c1246b6c
// @DATE:Tue Oct 14 23:24:42 ART 2014

import Routes.{prefix => _prefix, defaultPrefix => _defaultPrefix}
import play.core._
import play.core.Router._
import play.core.j._

import play.api.mvc._
import play.libs.F

import Router.queryString


// @LINE:7
package controllers {

// @LINE:7
class ReverseAssets {
    

// @LINE:7
def at(file:String): Call = {
   Call("GET", _prefix + { _defaultPrefix } + implicitly[PathBindable[String]].unbind("file", file))
}
                                                
    
}
                          
}
                  


// @LINE:7
package controllers.javascript {

// @LINE:7
class ReverseAssets {
    

// @LINE:7
def at : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Assets.at",
   """
      function(file) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("file", file)})
      }
   """
)
                        
    
}
              
}
        


// @LINE:7
package controllers.ref {


// @LINE:7
class ReverseAssets {
    

// @LINE:7
def at(path:String, file:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Assets.at(path, file), HandlerDef(this, "controllers.Assets", "at", Seq(classOf[String], classOf[String]), "GET", """ Home page
GET     /                           controllers.Application.index()""", _prefix + """$file<.+>""")
)
                      
    
}
                          
}
        
    
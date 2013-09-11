<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output 
  method="xml"
  encoding="utf-8"
  omit-xml-declaration="no"
  indent="yes"
  media-type="text/xml"
  doctype-public="-//W3C//DTD XHTML 1.1//EN"
  doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
/>

<xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru">
  <head>
    <meta charset="utf-8"></meta>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
    <meta name="description" content=""></meta>
    <meta name="author" content=""></meta>

    <title>XMLCMS</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet"></link>

    <!-- Custom styles for this template -->
    <link href="css/starter-template.css" rel="stylesheet"></link>
 
  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">XMLCMS</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
          
      <xsl:for-each select="/page/menu/*">
      <li>
        <xsl:if test="position() = 1">
          <xsl:attribute name="class">active</xsl:attribute>
        </xsl:if>

       <a>
       <xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute>
       <xsl:value-of select="." />
       </a>
      </li>
    </xsl:for-each>
            
          </ul>
      <img src="img/ajax-loader.gif" id="loader"></img>
          
        </div><!--/.nav-collapse -->
      </div>
    </div>


    <div class="container">

      
         <script type="text/x-handlebars" data-template-name="index">
            <div class="starter-template">

        <h1><xsl:value-of select="/page/title/" /></h1>
        <div class="lead"><xsl:copy-of select="/page/content/" /></div> 
        
               <div  class="menustyle">   
<div class="btn-group menustyle">
<button class="btn btn-primary" title="Zip - архив">Загрузить</button>
<button class="btn btn-primary dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
<ul class="dropdown-menu">
<li><a href="http://fx-future.ru/public/scripts/xmlcms.zip">Zip - архив</a></li>
<li><a href="http://fx-future.ru/public/scripts/xmlcms.tar.gz">TGZ - архив</a></li>
<li class="divider"></li>
<li><a href="https://github.com/scriptfuture/xmlcms">Ссылка на Github.com</a></li>
</ul>
</div>
</div>
        
      <p><br></br><br></br><br></br><br></br></p>  

      </div>
    </script>
      
      
      <script type="text/x-handlebars" data-template-name="global-page">
         <div class="starter-template">
<h1>{{title}}</h1>

<div class="lead">{{text}}</div>
</div>  
</script>


  <script type="text/x-handlebars" data-template-name="bulletins">
  <div class="starter-template">
  <h1>Новости</h1>
      {{#each bulletin in controller}}
          <div class="block_info_item">
              <span class="block_info_date">{{bulletin.date}}</span><br></br>
		          {{#linkTo bulletin bulletin}} {{bulletin.title}} {{/linkTo}}<br></br>
					
		          {{bulletin.preview}}					      
          </div>
      {{/each}}
   </div>    
  </script>
  
<script type="text/x-handlebars" data-template-name="bulletin">
<div class="starter-template">    
  <div class="block_info_item">
    <span class="block_info_date">{{date}}</span><br></br>
		<h2>{{title}}</h2>
					
		{{text}}					      
  </div>
</div> 
  </script>
      
    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="js/libs/jquery-1.9.1.min.js"><xsl:text>/*-jquery-*/</xsl:text></script>
    <script type="text/javascript" src="js/libs/bootstrap.min.js"><xsl:text>/*-bootstrap-*/</xsl:text></script>
    <script type="text/javascript" src="js/libs/handlebars-1.0.0.js">/*-handlebars-*/</script>
    <script type="text/javascript" src="js/libs/ember-1.0.0-rc.7.js">/*-ember-*/</script>
    <script type="text/javascript" src="js/app.js">/*-app-*/</script> 
    
    <script type="text/javascript">
    <xsl:text>
    
  $(function(){
    $('body').tooltip({
        selector: "[rel=tooltip]",
        placement: "bottom" 
    });
});

    
    </xsl:text>
    </script>
    
  </body>
</html>
</xsl:template>

</xsl:stylesheet>
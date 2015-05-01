<%@ Assembly Name="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%> <%@ Page Language="C#" Inherits="Microsoft.SharePoint.WebPartPages.WikiEditPage" MasterPageFile="~masterurl/default.master"      MainContentID="PlaceHolderMain" meta:progid="SharePoint.WebPartPage.Document" meta:webpartpageexpansion="full" %>
<%@ Import Namespace="Microsoft.SharePoint.WebPartPages" %> <%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Import Namespace="Microsoft.SharePoint" %> <%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:Content ContentPlaceHolderId="PlaceHolderPageTitle" runat="server">
	<SharePoint:ProjectProperty Property="Title" runat="server"/> - <SharePoint:ListItemProperty runat="server"/>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageImage" runat="server"><SharePoint:AlphaImage ID=onetidtpweb1 Src="/_layouts/15/images/wiki.png?rev=38" Width=145 Height=54 Alt="" Runat="server"/></asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderAdditionalPageHead" runat="server">
	<SharePoint:ScriptLink language="javascript" name="~SiteCollection/Style Library/js/lib/angular.js" runat="server"/>
	<SharePoint:ScriptLink language="javascript" name="~SiteCollection/Style Library/js/controller/GastoController.js" runat="server"/>
	<SharePoint:ScriptLink language="javascript" name="~SiteCollection/Style Library/js/controller/ProfissionaisController.js" runat="server"/>
	<SharePoint:ScriptLink language="javascript" name="~SiteCollection/Style Library/js/controller/SacolaController.js" runat="server"/>
	<SharePoint:ScriptLink language="javascript" name="~SiteCollection/Style Library/js/model/Sacola.js" runat="server"/>
	
	<SharePoint:CSSRegistration name= "<%$SPUrl:~SiteCollection/Style Library/css/reset.css%>" runat="server"/>
	<SharePoint:CSSRegistration name= "<%$SPUrl:~SiteCollection/Style Library/css/estilos.css%>" runat="server"/>
	<SharePoint:CSSRegistration name= "<%$SPUrl:~SiteCollection/Style Library/css/produto.css%>" runat="server"/>

	<meta name="CollaborationServer" content="SharePoint Team Web Site" />
	<SharePoint:ScriptBlock runat="server">
	var navBarHelpOverrideKey = "WSSEndUser";
	</SharePoint:ScriptBlock>
	<SharePoint:RssLink runat="server"/>
	</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderMiniConsole" runat="server">
	<SharePoint:FormComponent TemplateName="WikiMiniConsole" ControlMode="Display" runat="server" id="WikiMiniConsole"/>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderLeftActions" runat="server">
	<SharePoint:RecentChangesMenu runat="server" id="RecentChanges"/>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderMain" runat="server">

<div ng-app>
	<div  ng-controller="SacolaController"> 
	          <header class="container">
	            <h1>Mirror Fashion</h1>
	
	            <p class="sacola">
	              Há {{sacola.obterTotal()}} itens em sua sacola de compras
	            </p>
	
	            <nav class="menu-setores">
	              <ul>
	                <li><a href="#">Sua Conta</a></li>
	                <li><a href="#">Lista de Desejos</a></li>
	                <li><a href="#">Cartão Fidelidade</a></li>
	                <li><a href="sobre.html">Sobre</a></li>
	                <li><a href="#">Ajuda</a></li>
	              </ul>
	            </nav>
	          </header>
	
	          <div class="container produto">
	            
	            <h1>Furlan Mistery Cardigan</h1>
	            <h2>por apenas R$ 120</h2>
	
	             <p class="descricao">Produto de alta qualidade, importado diretamente da Zâmbia com textura inigualável.</p>
	
	            <a href="" ng-click="comprar()" class="comprar">Comprar</a>
	          </div>
	    </div>      
	    <div ng-controller="GastoController"  class="container produto">  
	      <div ng-repeat="dado in dados">
	        <td>
	        {{dado.Titulo}} --
	        </td>
	        <td>
	        <img src="{{dado.imagem}}"/>
	        </td>
	      </div>
	    </div>
	    <div ng-controller="ProfissionaisController"  class="container produto">  
	      <div ng-repeat="profissional in profissionais">
	       <td>
	        Nome - {{profissional.Nome}}
	        </td>
	       <td>
	        ID - {{profissional.ID}}
	        </td>
	      </div>
	    </div>
	    <footer>
	      <div class="container">
	        <h1>Mirror Fashion</h1>
	        <ul class="social">
	          <li><a href="http://facebook.com/mirrorfashion">Facebook</a></li>
	          <li><a href="http://twitter.com/mirrorfashion">Twitter</a></li>
	          <li><a href="http://plus.google.com/mirrorfashion">Google+</a></li>
	        </ul>
	      </div>
	    </footer>
    
</div>



	<span id="wikiPageNameDisplay" style="display: none;" runat="server">
		<SharePoint:ListItemProperty runat="server"/>
	</span>
	<span style="display:none;" id="wikiPageNameEdit" runat="server">
		<asp:TextBox id="wikiPageNameEditTextBox" runat="server"/>
	</span>
	<SharePoint:VersionedPlaceHolder UIVersion="4" runat="server">
		<SharePoint:SPRibbonButton
			id="btnWikiEdit"
			RibbonCommand="Ribbon.WikiPageTab.EditAndCheckout.SaveEdit.Menu.SaveEdit.Edit"
			runat="server"
			Text="edit"/>
		<SharePoint:SPRibbonButton
			id="btnWikiSave"
			RibbonCommand="Ribbon.WikiPageTab.EditAndCheckout.SaveEdit.Menu.SaveEdit.SaveAndStop"
			runat="server"
			Text="edit"/>
		<SharePoint:SPRibbonButton
			id="btnWikiRevert"
			RibbonCommand="Ribbon.WikiPageTab.EditAndCheckout.SaveEdit.Menu.SaveEdit.Revert"
			runat="server"
			Text="Revert"/>
	</SharePoint:VersionedPlaceHolder>
	<SharePoint:EmbeddedFormField id="WikiField" FieldName="WikiField" ControlMode="Display" runat="server"><div class="ExternalClassB78A17E707064725B8F5CEC331C48C00"><table id="layoutsTable" style="width&#58;100%;"><tbody><tr style="vertical-align&#58;top;"><td style="width&#58;100%;"><div class="ms-rte-layoutszone-outer" style="width&#58;100%;"><div class="ms-rte-layoutszone-inner" role="textbox" aria-autocomplete="both" aria-haspopup="true" aria-multiline="true"><div class="ms-rtestate-read ms-rte-wpbox"><div class="ms-rtestate-notify  ms-rtestate-read d2aedfcb-99b8-47af-99d7-489e12b92f82" id="div_d2aedfcb-99b8-47af-99d7-489e12b92f82" unselectable="on"></div><div id="vid_d2aedfcb-99b8-47af-99d7-489e12b92f82" unselectable="on" style="display&#58;none;"></div></div><div class="ms-rtestate-read ms-rte-wpbox"><div class="ms-rtestate-notify  ms-rtestate-read 74e0fb97-b20a-40dd-bf3c-673c25197cb7" id="div_74e0fb97-b20a-40dd-bf3c-673c25197cb7" unselectable="on"></div><div id="vid_74e0fb97-b20a-40dd-bf3c-673c25197cb7" unselectable="on" style="display&#58;none;"></div></div>

<p>&#160;</p>
</div></div></td></tr></tbody></table>
                <span id="layoutsData" style="display&#58;none;">false,false,1</span></div></SharePoint:EmbeddedFormField>
	<WebPartPages:WebPartZone runat="server" ID="Bottom" CssClass="ms-hide" Title="loc:Bottom"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
</asp:Content>

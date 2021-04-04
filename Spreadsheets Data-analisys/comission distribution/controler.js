var app = SpreadsheetApp;
var ui = app.getUi();
var spreadsheet = app.getActiveSpreadsheet();
var sheet = spreadsheet.getSheetByName('Formulário Vendas 2.0');


function onOpen(e){
    //Its necessary creat an trigger onOpen
  ui.createMenu("Adds").addItem('New Sale', "viewSales").addToUi();
}

//This action will creat an option menu "Adds" with option to "New Sale"
function viewSales(requeste){
  var form = HtmlService.createTemplateFromFile('form').evaluate();
  ui.showModalDialog(form, "New Sale");

}


function include(form) {
  return HtmlService.createHtmlOutputFromFile(form)
      .getContent();
}
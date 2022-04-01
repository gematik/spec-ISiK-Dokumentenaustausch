Instance: submit-document-in-params
InstanceOf: SubmitDocumentInput
Usage: #example
Title: "submit-document-in-params"
Description: ""
* parameter[+]
  * name = "metadata"
  * resource = dok-beispiel-client
* parameter[+]
  * name = "payload"
  * resource = Binary-PDF-Example-short

Instance: submit-document-out-params
InstanceOf: SubmitDocumentOutput
Usage: #example
Title: "submit-document-out-params"
Description: ""
* parameter[+]
  * name = "output-metadata"
  * resource = dok-beispiel-server
    * id = "123456789"
    * content.attachment.url = "http://mein-dokumentenserver/dokumente/1231232312.pdf"
* parameter[+]
  * name = "information"
  * resource = oo-beispiel

Instance: oo-beispiel
InstanceOf: OperationOutcome
Usage: #example
Title: "oo-beispiel"
Description: ""
* issue
  * severity = #information
  * code = #informational
  * diagnostics = "Well done!"
<!DOCTYPE html>
<%
    Dim max,min
    max=100000000000
    min=1
    Randomize
%>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Editor</title>
        <script src="assets/js/jquery/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
        <style type="text/css" media="screen">
            body {
                overflow: hidden;
                font-family: monospace;
                font-size: 11px;
                background-color: rgb(245, 245, 245);
            }
            
            #editor {
                margin: 0;
                position: absolute;
                top: 0;
                bottom: 17px;
                left: 0;
                right: 0;
            }
            
            #statusBar {
                margin: 0;
                margin-top: 3px;
                padding: 0px 0px 0px 5px;
                position: absolute;
                left: 0;
                right: 0;
                bottom: 0;
                height: 15px;
                background-color: rgb(245, 245, 245);
                color: gray;
            }
            
            .ace_status-indicator {
                color: gray;
                position: absolute;
                right: 0;
                border-left: 1px solid;
            }
        </style>
    </head>

    <body>
        <pre id="editor"></pre>
        <div id="statusBar">ace rocks!</div>
        <script src="assets/js/ace/src-min-noconflict/ace.js" type="text/javascript" charset="utf-8"></script>
        <script>
            <%
                Dim MyUrl 
                MyUrl = "/cms/WebClient/PreviewHandler.ashx?Action=Preview&Pageguid=" & session("PageGuid") & "&PageId=" & session("PageId") & "&DummyTime=" & Int((max-min+1)*Rnd+min)
            %>
            $.get("<% Response.Write MyUrl %>", function(data) {
                $("#editor").text(data).html();
                var editor = ace.edit("editor");
                editor.setTheme("ace/theme/chrome");
                editor.session.setMode("ace/mode/html");
                $("#statusBar").text("Mode: HTML");
                editor.getSession().setUseSoftTabs(true);
                editor.setReadOnly(true);
                editor.commands.addCommand({
                    name: 'SwtichToXML',
                    bindKey: {
                        win: 'Shift-X',
                        mac: 'Shift-X'
                    },
                    exec: function(editor) {
                        editor.session.setMode("ace/mode/xml");
                        $("#statusBar").text("Mode: XML");
                    },
                    readOnly: true
                });
                editor.commands.addCommand({
                    name: 'SwitchToJS',
                    bindKey: {
                        win: 'Shift-S',
                        mac: 'Shift-S'
                    },
                    exec: function(editor) {
                        editor.session.setMode("ace/mode/javascript");
                        $("#statusBar").text("Mode: JavaScript");
                    },
                    readOnly: true
                });
                editor.commands.addCommand({
                    name: 'SwitchToHTML',
                    bindKey: {
                        win: 'Shift-H',
                        mac: 'Shift-H'
                    },
                    exec: function(editor) {
                        editor.session.setMode("ace/mode/html");
                        $("#statusBar").text("Mode: HTML");
                    },
                    readOnly: true
                });
                editor.commands.addCommand({
                    name: 'SwitchToPHP',
                    bindKey: {
                        win: 'Shift-D',
                        mac: 'Shift-D'
                    },
                    exec: function(editor) {
                        editor.session.setMode("ace/mode/php");
                        $("#statusBar").text("Mode: PHP");
                    },
                    readOnly: true
                });
                editor.commands.addCommand({
                    name: 'SwitchToPowershell',
                    bindKey: {
                        win: 'Shift-P',
                        mac: 'Shift-P'
                    },
                    exec: function(editor) {
                        editor.session.setMode("ace/mode/powershell");
                        $("#statusBar").text("Mode: Powershell");
                    },
                    readOnly: true
                });
                editor.commands.addCommand({
                    name: 'SwitchToCSS',
                    bindKey: {
                        win: 'Shift-C',
                        mac: 'Shift-C'
                    },
                    exec: function(editor) {
                        editor.session.setMode("ace/mode/css");
                        $("#statusBar").text("Mode: CSS");
                    },
                    readOnly: true
                });
                editor.commands.addCommand({
                    name: 'SwitchToJSON',
                    bindKey: {
                        win: 'Shift-J',
                        mac: 'Shift-J'
                    },
                    exec: function(editor) {
                        editor.session.setMode("ace/mode/json");
                        $("#statusBar").text("Mode: JSON");
                    },
                    readOnly: true
                });
                editor.commands.addCommand({
                    name: 'SwitchToVBScript',
                    bindKey: {
                        win: 'Shift-V',
                        mac: 'Shift-V'
                    },
                    exec: function(editor) {
                        editor.session.setMode("ace/mode/vbscript");
                        $("#statusBar").text("Mode: .Net/VBScript");
                    },
                    readOnly: true
                });
                editor.commands.addCommand({
                    name: 'SwitchToCSharp',
                    bindKey: {
                        win: 'Shift-N',
                        mac: 'Shift-N'
                    },
                    exec: function(editor) {
                        editor.session.setMode("ace/mode/csharp");
                        $("#statusBar").text("Mode: .Net/C#");
                    },
                    readOnly: true
                });
                editor.commands.addCommand({
                    name: 'openHelp',
                    bindKey: {
                        win: 'Shift-?',
                        mac: 'Shift-?'
                    },
                    exec: function(editor) {
                        alert("SHIFT + H = HTML\nSHIFT + X = XML\nSHIFT + J = JSON\nSHIFT + S = JavaScript\nSHIFT + C = CSS\nSHIFT + P = Powershell\nSHIFT + N = C#\nSHIFT + V = VBScript");
                    },
                    readOnly: true
                });
                editor.focus();
            });
        </script>
    </body>

    </html>
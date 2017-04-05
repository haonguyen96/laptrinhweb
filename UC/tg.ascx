<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="tg.ascx.cs" Inherits="Cheshire.UC.tg" %>

<div class="">
    <div class="thumbnail" style="margin-left:10px; margin-right:10px;">
        <img src="<%#Eval("imgTG") %>" style="width:220px" alt="...">
        <div class="caption" style="text-align:center">
            <p>
                <a href="/tacgia.aspx?tg=<%#Eval("idTG") %>"><%#Eval("tenTG") %></a>
            </p>
        </div>
    </div>
</div>

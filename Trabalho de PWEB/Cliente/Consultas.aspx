﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consultas.aspx.cs" Inherits="Trabalho_de_PWEB.Cliente.Consultas" MasterPageFile="../Site.Master" Title="Área do cliente" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBContext %>" SelectCommand="SELECT Consulta.local, Consulta.data, Consulta.hora FROM Consulta INNER JOIN Cliente_consulta ON Consulta.cod_consulta = Cliente_consulta.cod_consulta INNER JOIN RelsClientes ON Cliente_consulta.cod_cliente = RelsClientes.cod_cliente WHERE (RelsClientes.user_id = @user_id)">
        <SelectParameters>
            <asp:Parameter Name="user_id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <hr />
    <h3>
        <asp:LinkButton ID="existentes" Style="background-color: white; font-size: 22px;" runat="server" OnClick="existentes_Click">Consultas existentes</asp:LinkButton>&nbsp;
        <asp:LinkButton ID="nova" Style="background-color: white; font-size: 22px;" runat="server" OnClick="novas_Click">Marcar nova consulta</asp:LinkButton>&nbsp;
        <asp:LinkButton ID="animais" Style="background-color: white; font-size: 22px;" runat="server" OnClick="animais_Click">Os seus animais</asp:LinkButton>
    </h3>
    <hr />
    <asp:Panel ID="Panel1" runat="server">

        <div>
        <h4>Lista de consultas</h4>
        <p></p>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
        

    </asp:Panel>

    <asp:Panel ID="Panel2" runat="server" Visible="False">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBContext %>" DeleteCommand="DELETE FROM [Consulta] WHERE [cod_consulta] = @cod_consulta" InsertCommand="INSERT INTO [Consulta] ([local], [data], [hora]) VALUES (@local, @data, @hora)" SelectCommand="SELECT * FROM [Consulta]" UpdateCommand="UPDATE [Consulta] SET [local] = @local, [data] = @data, [hora] = @hora WHERE [cod_consulta] = @cod_consulta">
            <DeleteParameters>
                <asp:Parameter Name="cod_consulta" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="local" Type="String" />
                <asp:Parameter DbType="Date" Name="data" />
                <asp:Parameter DbType="Time" Name="hora" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="local" Type="String" />
                <asp:Parameter DbType="Date" Name="data" />
                <asp:Parameter DbType="Time" Name="hora" />
                <asp:Parameter Name="cod_consulta" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server" Text="Local:" Font-Bold="True"></asp:Label><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <p></p>
        <asp:Label ID="Label2" runat="server" Text="Data:" Font-Bold="True"></asp:Label><asp:TextBox ID="TextBox2" runat="server" TextMode="DateTime"></asp:TextBox>
        <p></p>
        <asp:Label ID="Label3" runat="server" Text="Hora:" Font-Bold="True"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
            <asp:ListItem>12</asp:ListItem>
            <asp:ListItem>13</asp:ListItem>
            <asp:ListItem>14</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
            <asp:ListItem>16</asp:ListItem>
            <asp:ListItem>17</asp:ListItem>
            <asp:ListItem>18</asp:ListItem>
            <asp:ListItem>19</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label4" runat="server" Text="H"></asp:Label>&nbsp;
        <asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem>0</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
            <asp:ListItem>45</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label5" runat="server" Text="M"></asp:Label><p></p>
        <asp:Button ID="Button1" runat="server" Text="Confirmar" OnClick="Button1_Click1" />
    </asp:Panel>

    <asp:Panel ID="Panel3" runat="server" Visible="False">

    </asp:Panel>
</asp:Content>

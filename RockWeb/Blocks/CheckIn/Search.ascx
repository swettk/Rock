﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search.ascx.cs" Inherits="RockWeb.Blocks.CheckIn.Search" %>

<asp:UpdatePanel ID="upContent" runat="server">
<ContentTemplate>

    <script>
        Sys.Application.add_load(function () {
          $(document).ready(function() {
                // set focus to the input unless on a touch device
                var isTouchDevice = 'ontouchstart' in document.documentElement;
                if (!isTouchDevice) {

                    if ($('.modal-open').length == 0) {
                        $('.search-input').focus();
                    }

                }

                $('.tenkey button.digit').click(function () {
                    $phoneNumber = $("input[id$='tbPhone']");
                    $phoneNumber.val($phoneNumber.val() + $(this).html());
                });
                $('.tenkey button.back').click(function () {
                    $phoneNumber = $("input[id$='tbPhone']");
                    $phoneNumber.val($phoneNumber.val().slice(0,-1));
                });
                $('.tenkey button.clear').click(function () {
                    $phoneNumber = $("input[id$='tbPhone']");
                    $phoneNumber.val('');
                });
            });

            if ($('#<%=hfShowAddFamilyPrompt.ClientID%>').val() == "1") {

                Rock.dialogs.confirm('<%=this.ConditionMessage + " Do you want to add a new family?" %>', function (result) {
                    if (result) {
                        window.location = "javascript:__doPostBack('<%=upContent.ClientID %>', 'AddFamily')";
                    }
                });

            }

        });

    </script>

    <Rock:ModalAlert ID="maWarning" runat="server" />
    <asp:HiddenField ID="hfShowAddFamilyPrompt" runat="server" Value="0" />

    <div class="checkin-header">
        <h1><asp:Literal ID="lPageTitle" runat="server" /></h1>
    </div>

    <div class="checkin-body">

        <div class="checkin-scroll-panel">
            <div class="scroller">

                <div class="checkin-search-body">

                <asp:Panel ID="pnlSearchPhone" runat="server" CssClass="clearfix">
                    <Rock:RockTextBox ID="tbPhone" MaxLength="10" CssClass="search-input checkin-phone-entry" runat="server" Label="Phone Number" />

                    <div class="tenkey checkin-phone-keypad">
                        <div>
                            <button class="btn btn-default btn-lg btn-keypad digit">1</button>
                            <button class="btn btn-default btn-lg btn-keypad digit">2</button>
                            <button class="btn btn-default btn-lg btn-keypad digit">3</button>
                        </div>
                        <div>
                            <button class="btn btn-default btn-lg btn-keypad digit">4</button>
                            <button class="btn btn-default btn-lg btn-keypad digit">5</button>
                            <button class="btn btn-default btn-lg btn-keypad digit">6</button>
                        </div>
                        <div>
                            <button class="btn btn-default btn-lg btn-keypad digit">7</button>
                            <button class="btn btn-default btn-lg btn-keypad digit">8</button>
                            <button class="btn btn-default btn-lg btn-keypad digit">9</button>
                        </div>
                        <div>
                            <button class="btn btn-default btn-lg btn-keypad command clear">Clear</button>
                            <button class="btn btn-default btn-lg btn-keypad digit">0</button>
                            <button class="btn btn-default btn-lg btn-keypad command back"><i class="fas fa-backspace"></i></button>
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="pnlSearchName" CssClass="clearfix" runat="server">
                    <Rock:RockTextBox ID="txtName" runat="server" Label="Name" CssClass="search-input namesearch" />
                </asp:Panel>

                <div class="checkin-actions">
                    <Rock:BootstrapButton CssClass="btn btn-primary btn-block" ID="lbSearch" runat="server" OnClick="lbSearch_Click" Text="Search" DataLoadingText="Searching..." ></Rock:BootstrapButton>
                    <asp:LinkButton CssClass="btn btn-default btn-block btn-cancel" ID="lbBack" runat="server" OnClick="lbBack_Click" Text="Cancel" />
                </div>

            </div>

            </div>
        </div>

    </div>


</ContentTemplate>
</asp:UpdatePanel>

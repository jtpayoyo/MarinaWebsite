<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Marina.GUI.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <img class="top-pic" src="Images/marina2.jpg" />
    <div class="text-center" style="margin-bottom:60px;">
        <h2 style="margin-bottom:35px;">Contact Us</h2>
        <p>
            Have any questions? Ready to tour the marina? Get in touch with our team!            
        </p>
    </div>

    <div class="container bio-contact text-center">
        <div class="row">
            <div class="col-sm-6">
                <img src="Images/person2.jpg" />
                <h4>Manager</h4>
                <h5>Glenn Cooke</h5>
                <p>A seaman of 20 years and a dedicated fisherman, Glenn is an experienced manager and is ready to answer any of your questions about the marina.</p>
            </div>
            <div class="col-sm-6">
                <img src="Images/person1.jpg" />
                <h4>Slip Manager</h4>
                <h5>Kimberley Carson</h5>
                <p>An avid nautical enthusiast and a 3-time champion surfer, Kimberley can help you find a slip that fulfills all the needs for your boating experience.</p>
            </div>            
        </div>
    </div>

    <div class="d-flex justify-content-center" style="margin-bottom:40px;"> 
        <div>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d13138.470511737607!2d-112.4179779!3d34.58854055!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x872d258d9b351153%3A0xfc83bd176cd47aeb!2sWatson%20Lake!5e0!3m2!1sen!2sca!4v1627271820780!5m2!1sen!2sca" 
                width="500" height="375" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </div>
        <div style="margin-left: 40px;">
            <h4>Get in Touch</h4>

            Office Phone: 928-555-2234 <br />
            Leasing Phone: 928-555-2235 <br />
            Fax Number: 928-555-2236 <br />
            Contact Email: <a href="mailto:info@inlandmarina.com">info@inlandmarina.com</a>

            <br /><br />
            <h4>Location</h4>
            Inland Lake Marina <br />
            Box 123 <br />
            Inland Lake, Arizona <br />
            86038 <br />
        </div>
    </div>

</asp:Content>

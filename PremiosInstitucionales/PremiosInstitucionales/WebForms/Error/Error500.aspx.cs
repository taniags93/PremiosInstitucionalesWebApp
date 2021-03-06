﻿using System;

namespace PremiosInstitucionales.WebForms
{
    public partial class Error500 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // If you're running under IIS 7 in Integrated mode set use this line to override
            // IIS errors:
            Response.TrySkipIisCustomErrors = true;

            // Set status code and message; you could also use the HttpStatusCode enum:
            // System.Net.HttpStatusCode.NotFound
            Response.StatusCode = 500;
            Response.StatusDescription = "Internal server error";
        }
    }
}
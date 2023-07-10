using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;

namespace WebConfigTestApp.Controllers
{
    public class ValuesController : ApiController
    {

        // GET api/values
        public HttpResponseMessage Get()
        {
            ValuesResult valuesResult = ToValuesResult();

            return Request.CreateResponse(HttpStatusCode.OK, valuesResult);
        }

        private static ValuesResult ToValuesResult()
        {
            Dictionary<string, string> appsettings = new Dictionary<string, string>();
            Dictionary<string, string> connectionStrings = new Dictionary<string, string>();


            ConfigurationManager.AppSettings.AllKeys.ForEach(key =>
                appsettings.Add(key, ConfigurationManager.AppSettings.Get(key))
            );

            ConfigurationManager.ConnectionStrings.Cast<ConnectionStringSettings>().ForEach(connectionString =>
                connectionStrings.Add(connectionString.Name, connectionString.ConnectionString)
            );


            ValuesResult valuesResult = new ValuesResult()
            {
                connectionStrings = connectionStrings,
                appsettings = appsettings
            };
            return valuesResult;
        }

        // GET api/values/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        public void Post([FromBody] string value)
        {
        }

        // PUT api/values/5
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }

    public class ValuesResult
    {
        public Dictionary<string, string> appsettings { get; set; }
        public Dictionary<string, string> connectionStrings { get; set; }

    }
}

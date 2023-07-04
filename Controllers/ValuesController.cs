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
            string[] result = new string[] { 
                "value1", 
                "value2", 
                ConfigurationManager.AppSettings["WooBoo"], 
                ConfigurationManager.AppSettings["BooWee"],
                ConfigurationManager.ConnectionStrings["CentaurEntities"].ConnectionString 
            };

            return Request.CreateResponse(HttpStatusCode.OK, result);
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
}

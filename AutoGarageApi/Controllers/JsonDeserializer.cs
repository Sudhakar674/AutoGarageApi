using System;

namespace AutoGarageApi.Controllers
{
    internal class JsonDeserializer
    {
        private string json;

        public JsonDeserializer(string json)
        {
            this.json = json;
        }

        internal object GetString(string v)
        {
            throw new NotImplementedException();
        }
    }
}
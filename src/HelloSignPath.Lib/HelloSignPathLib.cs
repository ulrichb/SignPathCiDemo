using Newtonsoft.Json;

namespace HelloSignPath.Lib;

public static class HelloSignPathLib
{
    public static string GimmeSomeJson() => JsonConvert.SerializeObject(new { Hello = "SignPath 12" });
}
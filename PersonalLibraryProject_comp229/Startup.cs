using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PersonalLibraryProject_comp229.Startup))]
namespace PersonalLibraryProject_comp229
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

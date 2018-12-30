#include <cpr/cpr.h>
#include <iostream>
#include <string>

int main(int /*_argc*/, char ** /*_argv*/)
{
    std::string URL = "https://httpbin.org/anything";
    auto res = cpr::Get(cpr::Url{URL});

    std::cout << "Request to " << URL << ":" << std::endl
              << "http code:   \t" << res.status_code << std::endl
              << "content-type:\t" << res.header["content-type"] << std::endl
              << "content:" << std::endl << res.text << std::endl;

    return 0;
}

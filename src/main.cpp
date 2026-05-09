#include<iostream>
#include<Server.hpp>
#include<string>
using namespace std;


int main(){
  Server server(8080);//8080 is our port that our server is running on

  //for printing all routes that we defined
  server.printRoutes();
  //always run method must be on the last lines for getting all changes before that.
  server.run("Server Is Running.");
  return 0;
}

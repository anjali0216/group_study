

import 'package:flutter/material.dart';
import 'package:group_study/NetworkHandler.dart';
class SignUpPage extends StatefulWidget {

  //WelcomePage({Key key}) : super(key:key);
  @override
  _SignUpPageState createState() => _SignUpPageState();
  }
  class _SignUpPageState extends State<SignUpPage> {
  bool vis=true;
  String valuechoose;
  String coursechosen;
  List listItem=[
    "class 1",
    "class 2",
    "class 3",
    "class 4",
    "class 5",
    "class 6",
    "class 7",
    "class 8",
    "class 9",
    "class 10",
    "class 11",
    "class 12",
    "BA",
    "BSc",
    "BCom",
    "BTech",
    "BMS/BBA/BBS"
    "LLB",
    "MBBS",
  ];
  final _globalkey= GlobalKey<FormState>();
  NetworkHandler networkHandler= NetworkHandler();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String errorText;
  bool validateUsername=false;
  bool circularLoading=false;
    @override
    Widget build(BuildContext context){
      return Scaffold(

        body:SingleChildScrollView(
        child: Container(

         height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.lightBlueAccent],
              begin: const FractionalOffset(0.0, 1.0),
              end: const FractionalOffset(0.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.repeated,
            ),
          ),
         child: Form(
           key: _globalkey,
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
            "SIGN UP here",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),

          SizedBox(
            height: 10,
          ),


          nameTextField(),
          courseTextField(),
          usernameTextField(),
          emailTextField(),
          passwordTextField(),

          SizedBox(
            height: 15,
          ),


InkWell(
  onTap: () async{
    setState(() {
      circularLoading=true;
    });
    await checkUser();
   if(_globalkey.currentState.validate() && validateUsername){

     // we will send the data to rest server
     Map<String, String> data = {
       "name": _nameController.text,
       "course": coursechosen,
       "username": _usernameController.text,
       "email": _emailController.text,
       "password": _passwordController.text,
     };
     print(data);
     //print("validate");
     await networkHandler.post("/user/register", data);
     setState(() {
       //actually we'll move to dashboard "HomePage.dart" now
       circularLoading=false;
     });
   }
   else
     {
       setState(() {
         circularLoading=false;
       });
     }
  },
                child: circularLoading?CircularProgressIndicator():
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,
                  ),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
)




          ]
        ),
      ),
      ),
        ),
      );
    }
checkUser()async{
      if(_usernameController.text.length==0)
        {
          setState(() {
            //circularLoading=false;
            validateUsername=false;
           errorText="Username cannot be empty";
          });
        }
      else
       {
         var response= await networkHandler.get("/user/checkUsername/${_usernameController.text}");
         if(response['Status'])
           {
             setState(() {
               //circularLoading=false;
               validateUsername=false;
               errorText="Username already exists";
             });
           }
         else
           {
             setState(() {
               //circularLoading=false;
               validateUsername=true;

             });
           }
       }

}
  Widget nameTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
      child: Column(
        children: [
          Text("Your full name"),
          TextFormField(
            validator: (value)
            {
              if(value.isEmpty)
                return "Name field cannot be empty!";
              return null;
            },
             controller: _nameController,
            decoration: InputDecoration(
              //errorText: validate ? null : errorText,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget courseTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
      child: Column(
        children: [
          //Text("Select your Grade/ graduation course"),
          DropdownButton(
            hint: Text("Select your Grade/ graduation course"),
           // dropdownColor: Color.,

            icon: Icon(Icons.arrow_drop_down),
            iconSize: 25,
            isExpanded: true,
            value: valuechoose,
            onChanged: (newValue){
              setState(() {
                valuechoose=newValue;
              });
            },
            items: listItem.map((valueItem){
              coursechosen=valueItem.toString();

              return DropdownMenuItem(
                value: valueItem,
                child: Text(valueItem),
              );

            }).toList(),
          ),
          /*TextFormField(
            validator: (value)
            {
              if(value.isEmpty)
                return "course cannot be empty!";
              return null;
            },
            // controller: _usernameController,
            decoration: InputDecoration(
              //errorText: validate ? null : errorText,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
            ),
          )*/
        ],
      ),
    );
  }



    Widget usernameTextField() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
        child: Column(
          children: [
            Text("Username"),
            TextFormField(

             /* validator: (value)
              {
                if(value.isEmpty)
                  return "username cannot be empty!";
                return null;
              },*/

              controller: _usernameController,
              decoration: InputDecoration(
                errorText: validateUsername ? null : errorText,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget emailTextField() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
        child: Column(
          children: [
            Text("Email"),
            TextFormField(
              controller: _emailController,
              validator: (value)
              {
                if(value.isEmpty)
                  return "email field cannot be empty!";
                if(!value.contains("@"))
                  return "email is invalid!";
                return null;
              },
              /*controller: _emailController,
              validator: (value) {
                if (value.isEmpty) return "Email can't be empty";
                if (!value.contains("@")) return "Email is Invalid";
                return null;
              },*/
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget passwordTextField() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
        child: Column(
          children: [
            Text("Password"),
            TextFormField(
              controller: _passwordController,
              validator: (value)
              {
                if(value.isEmpty)
                  return "password field cannot be empty!";
                if(value.length<8)
                  return "password length must be>=8";
                return null;
              },

              obscureText: vis,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(vis ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      vis = !vis;
                    });
                  },
                ),
                helperText: "Password length should have >=8",
                helperStyle: TextStyle(
                  fontSize: 14,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }





  }

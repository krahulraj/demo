import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.cyan
    ),
    debugShowCheckedModeBanner: false,
    home: Signup(),
  ));
}

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _obscureText = true;
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome',style: TextStyle(color:Colors.white),), // Corrected typo here
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Enter name',
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Enter mobile number',
                    labelText: 'Mobile',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: passwordController1,
                  obscureText: _obscureText,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Enter password',
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: passwordController2,
                  obscureText: _obscureText,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    // Validate if passwords match
                    if (passwordController1.text != value) {
                       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter enter password correctly"),),);
                    } else {
                      // Passwords match
                      // Example: clear error message or reset border color
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Confirm password',
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Center(
                  child:ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                    },child: Text('Signin',style: TextStyle(color: Colors.white),),),
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('Already have Account?', style: TextStyle(color: Colors.redAccent),),
                  ElevatedButton(onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()),);
                  }, child: Text('Login',style: TextStyle(color: Colors.white),),
                    style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.blueGrey)),),
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Name',
              hintText: 'Enter username',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            controller: passwordController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15,),
          Center(
            child: ElevatedButton(onPressed: (){
              if((nameController.text.toString()=="vassar") && (passwordController.text.toString()=="vassar123"))
                {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login sucessful')));
                }
              else
                {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Incorrect Username or password')));
                }
            },child: Text('Login',style: TextStyle(color: Colors.white),),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),),
          )
        ],
      ),),

    );
  }
}


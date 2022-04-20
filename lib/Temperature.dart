import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Temperature extends StatefulWidget {
  const Temperature({Key? key}) : super(key: key);

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  double outTemp = 0.0, inTemp = 0.0;

  var title = 'screnTitle';
  var outTempIs = "Your Temperature is";
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: 'Enter Your Temperature ',
                          labelText: "Enter Your Temperature"
                          /*? "Your Fahrainhat  is $outTemp"
                              : "Your Calsuaes  is $outTemp"*/
                          ,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      onChanged: (val) {
                        inTemp = double.parse(val);
                      },
                    ),
                    Container(
                      height: 40,
                    ),
                    RadioListTile(
                      title: Text('Fahrenheit'),
                      value: true,
                      groupValue: _value,
                      onChanged: (val) {
                        setState(() {
                          _value = true;
                        });
                      },
                    ),
                    RadioListTile(
                        title: Text('Celsius'),
                        value: false,
                        groupValue: _value,
                        onChanged: (val) {
                          setState(() {
                            _value = false;
                          });
                        }),

                    Container(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        width: double.infinity,
                        child: MaterialButton(
                          child: Text(
                            'Click',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Colors.blue,
                          onPressed: () {
                            setState(
                              () {
                                outTemp = _value
                                    ? (inTemp - 32) / (5 / 6)
                                    : (inTemp * 9 / 5) + 32;

                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text("Result"),
                                          content: _value
                                              ? Text("$inTemp Fahrenheit = $outTemp")
                                              : Text("$inTemp Celsius = $outTemp"),
                                        ));
                              },
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

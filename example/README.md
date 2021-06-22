# province_indonesia_example

To use this library

add the library in the pubspec.yaml


then simply call the static asyncronous method inside ProviceIndonesia class, it will Return 
List of DataModel class, which has id, name, parent Id


List<DataModel> p =  await ProvinceIndonesia.getProvince();


or 

                  FutureBuilder(
                      future: ProvinceIndonesia.getProvince(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData)
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                DataModel a = snapshot.data[index];
                                var text = Text("${a.id} - ${a.name}");
                                return ListTile(title: text);
                              });
                        else
                          return Container();
                      }),


## Getting Started


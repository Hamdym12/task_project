class AddressDataModel {
   String? address;
   String? name;
   String? street;

  AddressDataModel({
     this.address,
     this.name,
     this.street,
  });

   static List<AddressDataModel> listItemsInfo = [
     AddressDataModel(
         address: 'Home Address',
         name: 'Mustafa St: No:2',
         street: 'Street: x12'),
     AddressDataModel(
         address: 'Office Address',
         name: 'Axis Istanbul, B2',
         street: 'Floor 2, office 11'
     ),
   ];
}
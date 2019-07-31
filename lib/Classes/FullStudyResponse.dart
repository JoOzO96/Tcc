

class FullStudiesResponse{
  String apivrs;
  String datavrs;
  String expression;
  int nstudiesavail;
  int nstudiesfound;
  int minrank;
  int maxrank;
  int nstudiesreturned;
  FullStudiesResponse.fromJson(Map<String, dynamic> json)
      : apivrs = json['APIVrs'],
        datavrs = json['DataVrs'],
        expression = json['Expression'],
        nstudiesavail = json['NStudiesAvail'],
        nstudiesfound = json['NStudiesFound'],
        minrank = json['MinRank'],
        maxrank = json['MaxRank'],
        nstudiesreturned = json['NStudiesReturned'];

}
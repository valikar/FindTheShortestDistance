<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <h5 class="navbar-brand">FIND THE SHORTEST DISTANCE BETWEEN TWO POINTS ON EARTH</h5>
    </div>
</nav>

<div class=" bg-secondary text-white flex-row ">
    <div class="bg-danger ">
        <p class="pl-5 pr-5">   This service allows you to find the shortest distance between two points on Earth.
            You need to specify the coordinates of each point. To do this, you must specify the longitude of the point in the format of x degrees in minutes (0 <= x <= 180,0 <= and <= 60), select the western(w.long) or eastern(e.long) hemisphere and the latitude of the point in the format of a degrees, b minutes (0 < = a <= 90,0 <= b <= 60), choose the northern(n.lat) or southern(s.lat) hemisphere of the hemisphere. Then click the button.</p>
    </div>
    <div class="ml-5  flex-row float-left">

        <p class=" mr-3 flex-row float-left">Enter longitude of first point </p>
        <input type="number" id="longitudeA" min="0" max="180" class="float-left bg-primary ml-4"><h3 class="float-left ml-2 mr-2">°</h3>
        <input type="number" id="longitudeAmin" min="0" max="60"class="float-left bg-primary "><h3 class="float-left ml-2 mr-2">'</h3>
        <form action="" class=" mr-5 float-left">
            <input type="radio"  name="la" id="longA"   checked> e.long.
            <input type="radio"   name="la" > w.long.
        </form>


        <p class=" mr-3 flex-row float-left">Enter latitude of first point  </p>
        <input type="number" id="latitudeA" min="0" max="90" class="float-left bg-primary ml-4"><h3 class="float-left ml-2 mr-2">°</h3>
        <input type="number" id="latitudeAmin" min="0" max="60" class="float-left bg-primary" ><h3 class="float-left ml-2 mr-2">'</h3>
        <form action="" class="float-left">
            <input type="radio"  name="la2" id="latA"   checked> n.lat.
            <input type="radio"   name="la2"> s.lat.
        </form>

    </div>
    <br>
    <div class="ml-5 float-left flex-row">
        <p class="float-left mr-3 flex-row">Enter longitude of second point </p>
        <input type="number" id="longitudeB" min="0" max="180" class="float-left bg-warning "><h3 class="float-left ml-2 mr-2">°</h3>
        <input type="number" id="longitudeBmin" min="0" max="60" class="float-left bg-warning"><h3 class="float-left ml-2 mr-2">'</h3>
        <form action="" class="float-left mr-5 ">
            <input type="radio"   name="lb" id="longB"   checked> e.long.
            <input type="radio"   name="lb"> w.long.
        </form>


        <p class="float-left mr-3 flex-row">Enter latitude of second point  </p>
        <input type="number" id="latitudeB" min="0" max="90" class="float-left bg-warning"><h3 class="float-left ml-2 mr-2">°</h3>
        <input type="number" id="latitudeBmin"  min="0" max="60" class="float-left bg-warning"><h3 class="float-left ml-2 mr-2">'</h3>
        <form action="" class="float-left">
            <input type="radio" name="lb2"  id="latB"   checked> n.lat.
            <input type="radio"  name="lb2" > s.lat.
        </form>

    </div>
    <br>
    <div class="col-2 ml-4  ">
        <button class="btn btn-dark   m-auto" id="find">FIND </button>
    </div>
    <br>
    <div id="res" class="bg-success"></div>
</div>
<script>
    let $res=$("#res");
    let $find=$("#find");
    $find.click(function () {
        $res.empty();
        let $A1=$("#longitudeA");
        let $A2=$("#latitudeA");
        let $B1=$("#longitudeB");
        let $B2=$("#latitudeB");
        let $A1m=$("#longitudeAmin");
        let $A2m=$("#latitudeAmin");
        let $B1m=$("#longitudeBmin");
        let $B2m=$("#latitudeBmin");
        if((($A1.val()||$B1.val())>180)||(($A1.val()||$B1.val())<0)
                ||(($A2.val()||$B2.val())>90)||(($A2.val()||$B2.val())<0)
                ||(($A1m.val()||$B1m.val()||$A2m.val()||$B2m.val())>60)||(($A1m.val()||$B1m.val()||$A2m.val()||$B2m.val())<0)){
            alert("You are entered not correct value");
        }else{


        let longitudeA;
        let latitudeA;
        let longitudeB;
        let latitudeB;
        if($("#longA").is(':checked')){longitudeA=+(+$A1.val()+($A1m.val()/60));}else{ longitudeA=-(+$A1.val()+($A1m.val()/60));};
        if($("#latA").is(':checked')){latitudeA=+(+$A2.val()+($A2m.val()/60));}else{latitudeA=-(+$A2.val()+($A2m.val()/60));};
        if($("#longB").is(':checked')){longitudeB=+(+$B1.val()+($B1m.val()/60));}else{ longitudeB=-(+$B1.val()+($B1m.val()/60));};
        if($("#latB").is(':checked')){latitudeB=+(+$B2.val()+($B2m.val()/60));}else{latitudeB=-(+$B2.val()+($B2m.val()/60));};
        console.log(longitudeA,latitudeA,longitudeB,latitudeB);

        let datas=JSON.stringify({longitudeA,latitudeA,longitudeB,latitudeB});

        $.ajax({
            url:'/find',
            type: 'PUT',
            data: datas,
            contentType: 'application/json',
            error:function (err) {
                console.log(err);
            },
            success:function (result) {

                let $divk =$('<div/>',{text:"Result is " + result +" meters"});



                $res.append($divk);



            }

        })
        }
    })
</script>

</body>
</html>
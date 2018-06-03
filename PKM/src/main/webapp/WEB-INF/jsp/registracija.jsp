<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <title>Registracija</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <!-- Plugin CSS -->
    <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/creative.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body id="page-top">

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="/index">Mestni utrip</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="index#about">O nas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="index#services">Maribor</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="index#portfolio">Lokacije</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="index#contact">Prijava</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<header class="masthead text-center text-white d-flex">
    <div class="container my-auto">
        <div class="row">
            <div class="col-lg-10 mx-auto">
                <h1 class="text-uppercase">
                    <strong>Registracija podjetja</strong>
                </h1>
                <hr>
            </div>
            <div class="col-lg-8 mx-auto">
                <section class="p-0" id="portfolio">
                    <div class="container-fluid">
                        <form method="post" action ="registracija">
                            <p><i>Polja, ozna&ccaron;ena z * so obvezna!</i></p>
                            <p id="manjkajoPodatki"></p>
                            <%--<select class="form-control" placeholder="*Podjetje" name=imeP >--%>
                            <%--<option value="Izberite Podjetje">Izberite Podjetje</option>--%>
                            <%--&lt;%&ndash;<c:forEach items="${objekti}" var="objektii">                    NEUPORABNO&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<option value="${objektii.naziv}">${objektii.naziv}</option>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
                            <%--</select>--%>
                            <%--<br/>--%>
                            <p><input class="form-control" type="text" placeholder="*Podjetje" name=imeP></p>
                            <p><select class="form-control" name=tip_Podjetja>
                                <option value="tipObjekta">*Izberite tip objekta</option>
                                <c:forEach items="${tip_objekta}" var="tip_objekta">
                                    <option value="${tip_objekta}">${tip_objekta}</option>
                                </c:forEach>
                            </select></p>
                            <p><input class="form-control" type="text" placeholder="*Naslov" name=naslov></p>
                            <p><input class="form-control" type="text" placeholder="*Email" name=mail></p>
                            <p id="napakaE"></p>
                            <p><input class="form-control" type="password" placeholder="*Geslo" name=geslo></p>
                            <p id="napakaG"></p>
                            <p><input class="form-control" type="password" placeholder="*Ponovi geslo" name=istogeslo></p>
                            <p><input class="form-control" type="text" placeholder="Kontaktna oseba" name=lastnik></p>
                            <p><input type="submit" value="Potrdi" class="btn btn-primary btn-xl js-scroll-trigger" onclick="return preveriVnos()"></p>
                        </form>
                    </div>
                </section>
            </div>
        </div>
    </div>
</header>
<script>
    function preveriVnos(){
        var naslov = $("[name='naslov']");
        var imeP = $("[name='imeP']");
        var geslo = $("[name='geslo']");
        var istogeslo = $("[name='istogeslo']");
        var email = $("[name='mail']");
        var tip_podjetja=$("[name='tip_Podjetja']")
        var napakaG = $("#napakaG");
        var napakaE = $("#napakaE");
        var manjkajoPodatki = $("#manjkajoPodatki");
        email.css('background-color', 'white');
        manjkajoPodatki.html("");
        geslo.css('background-color', 'white');
        istogeslo.css('background-color', 'white');
        napakaE.html("");
        napakaG.html("");

        if(tip_podjetja.val()=="tipObjekta"||imeP.val()==""||geslo.val()==""||istogeslo.val()==""||email.val()==""||naslov.val()==""){
            manjkajoPodatki.html("Vnesite vse obvezne podatke.");
            manjkajoPodatki.css("color","#ffa8a5");
            return false;
        }

        else
        if((email.val().indexOf("@")<0)){
            napakaE.html("Vnesite pravilen mail!");
            email.css('background-color', '#ffa8a5');

            manjkajoPodatki.html("");
            return false
        }
        else if((email.val().indexOf(".")<0)){
            napakaE.html("Vnesite pravilen mail!");
            email.css('background-color', '#ffa8a5');

            manjkajoPodatki.html("");
            return false
        }
        else if(!(geslo.val() == istogeslo.val())){
            napakaG.html("Gesli se ne ujemata!");
            geslo.css('background-color', '#ffa8a5');
            istogeslo.css('background-color', '#ffa8a5');
            return false;

        }else return true;
    }

</script>
</body>
</html>
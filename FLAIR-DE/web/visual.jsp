<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <link rel="stylesheet" href="js/libs/jqueryui/jquery-ui.css">
        <link rel="stylesheet" href="js/libs/jqueryui/jquery.ui.slider.css">
        <link rel='stylesheet' href='js/libs/bootstrap-3.3.4-dist/css/bootstrap.css'>
        <link rel='stylesheet' href="js/libs/bootstrap-3.3.4-dist/css/bootstrap.min.css">
        <link rel='stylesheet' href='js/libs/bootstrap-3.3.4-dist/css/bootstrap-theme.css'>

        <link href="css/simple-sidebar.css" rel="stylesheet">
        <link href="css/simple-sidebar-right.css" rel="stylesheet">
        <link rel="stylesheet" href="css/dashboard.css" />
        <link rel="stylesheet" href="css/docs.min.css" />
        <link rel="stylesheet" href="css/number-polyfill.css" />
        <link rel="stylesheet" href="css/flair_visual.css" />
        <link href="js/libs/toastr/toastr.min.css" rel="stylesheet"/>

        <title>FLAIR</title>
    </head>

    <body style="background-color: white;">
        <div id="wrapper" >
            <div class="container">
                <div class="navbar navbar-default navbar-fixed-top" role="navigation">
                    <div class="container-fluid">               
                        <div class="row" style="margin-top: 1%; margin-bottom:1%">
                            <div class="col-md-2 col-xs-2"  style="text-align:left; padding-top:0.8%;">
                                <a href="#menu-toggle" class="btn btn-warning" id="menu-toggle"><span class="glyphicon glyphicon-cog"></span></a>
                            </div>

                            <div class="col-md-7 col-xs-8"  style="text-align:right;padding-top:0%;">
                                <form class="form-inline" name="search_form" id="search_form"  style="width:100%;">

                                    <div class="row">
                                        <div  class="input-group">
                                            <a href="#about-toggle" id="about-toggle" style="color:orange" ><img class="logo" src="img/logo_2.png" alt="FLAIR" height="55px"></a>
                                        </div>

                                        <div class="input-group col-md-8 col-xs-12">
                                            <input type="text" id="search_field" name="query" class="form-control">
                                        </div>

                                        <div class="input-group col-md-2 col-xs-6">
                                            <select class="form-control" id="fetch_result_count">
                                                <option value="10">10 Seiten</option>
                                                <option selected="selected" value="20">20 Seiten</option>
                                                <option value="30">30 Seiten</option>
                                                <option value="40">40 Seiten</option>
                                                <option value="50">50 Seiten</option>
                                            </select>
                                        </div>

                                    </div>
                                </form>

                            </div>
                            <div class="col-md-2 col-xs-2" style="padding-top:0.7%;">
                                <a href="#customCorpus-toggle" id="customCorpus-toggle" style="text-align:left;" title="eigenes Korpus hochladen">
                                    <span class="glyphicon glyphicon-upload"></span>
                                </a>

                            </div>
                            <div class="col-md-1 col-xs-1" style="text-align:center;padding-top:1.2%;">
                                <span id="right-menu-toggle">
                                    <img src="img/glyphicons-517-menu-hamburger.png" alt=">"></span>
                            </div> 
                        </div>
                    </div>
                </div>

                <div class="row">
                    <!-- Settings SIDE BAR -->
                    <div  class="col-md-3">
                        <div id="sidebar-wrapper">
                            <div  class="sidebar-nav" id="sidebar">
                                <div>
                                    <div class="df" id="docs_info"></div>
                                    <br><div class="panel panel-default" style="text-align: center">
                                        <a href="javascript:FLAIR.WEBRANKER.singleton.showVisualiser();" style="color:orange" >VISUALISIEREN</a>
                                    </div>
                                    <hr>
                                    <div class="panel panel-info" style="text-align: center">
                                        <a href="javascript:FLAIR.WEBRANKER.singleton.exportSettings();" style="color:grey;">Sucheinstellungen <br> EXPORTIEREN</a>
                                    </div>


                                    <!-- Shorter/longer documents slider -->
                                    <hr>
                                    <h4 style="color:grey">Eigenschaften der Texte:</h4>
                                    <div class="row">
                                        <div class="col-md-2 col-xs-2">
                                            Länge: <br><br>
                                            <div class="ui-widget-content-len">
                                                <div class="lengthSlider" id="length-slider"></div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-xs-2"></div>
                                        <div class="col-md-6 col-xs-8" id="settings_levels" style="border-left:1px lightgrey solid;">
                                            Schwierigkeitsgrad:<br><br>
                                            <div><input type="checkbox" aria-label="A1-A2" onclick="FLAIR.WEBRANKER.singleton.refreshRanking()" id="LEVEL-a" checked> A1-A2
                                                <br><span class="df" id="LEVEL-a-df"></span><br>
                                            </div>
                                            <div><input type="checkbox" aria-label="B1-B2" onclick="FLAIR.WEBRANKER.singleton.refreshRanking()" id="LEVEL-b" checked> B1-B2
                                                <br><span class="df" id="LEVEL-b-df"></span><br>
                                            </div>
                                            <div><input type="checkbox" aria-label="C1-C2" onclick="FLAIR.WEBRANKER.singleton.refreshRanking()" id="LEVEL-c" checked> C1-C2
                                                <br><span class="df" id="LEVEL-c-df"></span><br>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>  
                                    <div>
                                        <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleKeywordHighlighting()" id="tgl-customVocabList" title="auswählen, um Schlüsselwörter hervorzuheben" checked>&nbsp;<span id="customVocabList-label">Benutzerdefiniertes</span> Vokabular&nbsp;
                                        <!--		    <div hidden> -->
                                        <a href="#customVocabList-upload" id="customVocabList-upload" title="Vokabular bearbeiten"><span class="glyphicon glyphicon-edit"></span></a>&nbsp;
                                        <a href="#customVocabList-reset" id="customVocabList-reset" title="Standardliste für benutzerdefiniertes Vokabular verwenden"><span class="glyphicon glyphicon-repeat"></span></a>
                                        <!--		    </div> -->
                                        <br><br>
                                        <div class="ui-widget-content" style="width:80%;">
                                            <div class="gradientSlider" title="nach rechts bewegen, um Texte mit benutzerdefiniertem Vokabular höher zu bewerten" id="customVocabList-gradientSlider"></div>
                                        </div>
                                    </div>
                                    <hr> 
                                    <div id="settings_panel">
                                        <!-- a list of all constructions -->
                                        <div style="text-align: center;">
                                            <a href="#constructs-toggle" id="constructs-toggle"><b>LISTE DER KONSTRUKTIONEN</b></a><br><br>
                                        </div>

                                        <div class="panel panel-warning">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('sentences')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                    <a data-toggle="collapse" data-parent="#accordion"
                                                       href="#collapse_sentences">
                                                        Sätze
                                                    </a>

                                                </h4>
                                            </div>
                                            <div id="collapse_sentences" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <br>
                                                    <div class="panel panel-info">
                                                        <div class="panel-heading">
                                                            <h4 class="panel-title">
                                                                <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('questions')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                <a data-toggle="collapse" data-parent="#accordion"
                                                                   href="#collapse_questions">
                                                                    Fragen
                                                                </a>

                                                            </h4>
                                                        </div>

                                                        <div id="collapse_questions" class="panel-collapse collapse">
                                                            <div class="panel-body">
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-directQuestions" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;direkte Fragen<br><span class="df" id="directQuestions-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="directQuestions-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-indirectQuestions" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;indirekte Fragen<br><span class="df" id="indirectQuestions-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="indirectQuestions-gradientSlider"></div>
                                                                        </div>
                                                                    </div> 
                                                                </div>
                                                                <hr>
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-whQuestions" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;W-Fragen
                                                                    <br><span class="df" id="whQuestions-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="whQuestions-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-yesNoQuestions" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Ja/Nein Fragen<br><span class="df" id="yesNoQuestions-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="yesNoQuestions-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                    <!--            <hr>
                                                                <div>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-tagQuestions" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Nachziehfragen<br><span class="df" id="tagQuestions-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="tagQuestions-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                </div> -->
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="panel panel-info">
                                                        <div class="panel-heading">
                                                            <h4 class="panel-title">
                                                                <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('structure')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                <a data-toggle="collapse" data-parent="#accordion"
                                                                   href="#collapse_structure">
                                                                    Satztypen
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="collapse_structure" class="panel-collapse collapse">
                                                            <div class="panel-body">
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-simpleSentence" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;einfach <br><span class="df" id="simpleSentence-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="simpleSentence-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-compoundSentence" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;koordiniert <br><span class="df" id="compoundSentence-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="compoundSentence-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-subordinateClause" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;subordiniert <br><span class="df" id="subordinateClause-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="subordinateClause-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-incompleteSentence" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Satzfragmente <br><span class="df" id="incompleteSentence-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="incompleteSentence-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="panel panel-info">
                                                        <div class="panel-heading">
                                                            <h4 class="panel-title">
                                                                <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('clauses')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                <a data-toggle="collapse" data-parent="#accordion"
                                                                   href="#collapse_clauses">
                                                                    Nebensatztypen
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="collapse_clauses" class="panel-collapse collapse">
                                                            <div class="panel-body">
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-relativeClause" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;relativ<br><span class="df" id="relativeClause-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="relativeClause-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-adverbialClause" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;adverbial<br><span class="df" id="adverbialClause-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="adverbialClause-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-dassClause" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;dass<br><span class="df" id="dassClause-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="dassClause-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <!--        <hr>
                                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-condUnreal" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;unreal conditional<br><span class="df" id="condUnreal-df"></span>
                                                                            <div class="ui-widget-content" style="width:80%;">
                                                                                <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="condUnreal-gradientSlider"></div>
                                                                            </div>
                                                                        </div>
                                                                        <hr> -->
                                                                <!--        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-thereIsAre" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;there is/are <br><span class="df" id="thereIsAre-df"></span>
                                                                            <div class="ui-widget-content" style="width:80%;">
                                                                                <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="thereIsAre-gradientSlider"></div>
                                                                            </div>
                                                                        </div>
                                                                        <hr>  -->
                                                                <!--        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-thereWasWere" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;there was/were <br><span class="df" id="thereWasWere-df"></span>
                                                                            <div class="ui-widget-content" style="width:80%;">
                                                                                <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="thereWasWere-gradientSlider"></div>
                                                                            </div>
                                                                        </div> -->
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-warning">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('pos')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                    <a data-toggle="collapse" data-parent="#accordion"
                                                       href="#collapse_pos">
                                                        Wortarten
                                                    </a>

                                                </h4>
                                            </div>
                                            <div id="collapse_pos" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <br>
                                                    <div class="panel panel-info">
                                                        <div class="panel-heading">
                                                            <h4 class="panel-title">
                                                                <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('verbs')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                <a data-toggle="collapse" data-parent="#accordion"
                                                                   href="#collapse_verbs">
                                                                    Verben
                                                                </a>

                                                            </h4>
                                                        </div>
                                                        <div id="collapse_verbs" class="panel-collapse collapse">
                                                            <div class="panel-body">
                                                                <br>
                                                                <div class="panel panel-info success">
                                                                    <div class="panel-heading">
                                                                        <h4 class="panel-title">
                                                                            <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('verbForms')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                            <a data-toggle="collapse" data-parent="#accordion"
                                                                               href="#collapse_verbForms">
                                                                                Verbtypen
                                                                            </a>
                                                                        </h4>
                                                                    </div>
                                                                    <div id="collapse_verbForms" class="panel-collapse collapse">
                                                                        <div class="panel-body">
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-mainVerbs" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Vollverben (gehen, sprechen, etc.) <br><span class="df" id="mainVerbs-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="mainVerbs-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                            <hr>
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-auxiliaryVerbs" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Hilfsverben (sein, haben) <br><span class="df" id="auxiliaryVerbs-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="auxiliaryVerbs-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                            <hr>
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-modalVerbs" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Modalverben (können, müssen, etc.)  <br><span class="df" id="modalVerbs-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="modalVerbs-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="panel panel-info success">
                                                                    <div class="panel-heading">
                                                                        <h4 class="panel-title">
                                                                            <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('tenses')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                            <a data-toggle="collapse" data-parent="#accordion"
                                                                               href="#collapse_tenses">
                                                                                Zeiten
                                                                            </a>
                                                                        </h4>
                                                                    </div>
                                                                    <div id="collapse_tenses" class="panel-collapse collapse">
                                                                        <div class="panel-body">
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-presentPerfectHaben" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;haben-Perfekt <br><span class="df" id="presentPerfectHaben-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="presentPerfectHaben-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                            <hr>
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-presentPerfectSein" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;sein-Perfekt <br><span class="df" id="presentPerfectSein-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="presentPerfectSein-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                            <hr>
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-pastPerfectHaben" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;haben-Plusquamperfekt <br><span class="df" id="pastPerfectHaben-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="pastPerfectHaben-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                            <hr>
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-pastPerfectSein" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;sein-Plusquamperfekt <br><span class="df" id="pastPerfectSein-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="pastPerfectSein-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                            <hr>
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-futureSimple" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Futur 1 <br><span class="df" id="futureSimple-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="futureSimple-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                            <hr>
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-futurePerfect" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Futur 2 <br><span class="df" id="futurePerfect-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="futurePerfect-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div> 

                                                                <!--                <div class="panel panel-info success">
                                                                                    <div class="panel-heading">
                                                                                        <h4 class="panel-title">
                                                                                            <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('aspects')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                                            <a data-toggle="collapse" data-parent="#accordion"
                                                                                               href="#collapse_aspects">
                                                                                                aspect
                                                                                            </a>
                                                                                        </h4>
                                                                                    </div>
                                                                                    <div id="collapse_aspects" class="panel-collapse collapse">
                                                                                        <div class="panel-body">
                                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-simpleAspect" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;simple <br><span class="df" id="simpleAspect-df"></span>
                                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="simpleAspect-gradientSlider"></div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <hr>
                                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-progressiveAspect" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;progressive <br><span class="df" id="progressiveAspect-df"></span>
                                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="progressiveAspect-gradientSlider"></div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <hr>
                                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-perfectAspect" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;perfect <br><span class="df" id="perfectAspect-df"></span>
                                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="perfectAspect-gradientSlider"></div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <hr>
                                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-perfProgAspect" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;perfect progressive <br><span class="df" id="perfProgAspect-df"></span>
                                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="perfProgAspect-gradientSlider"></div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>   -->

                                                                <div class="panel panel-info success">
                                                                    <div class="panel-heading">
                                                                        <h4 class="panel-title">
                                                                            <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('voice')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                            <a data-toggle="collapse" data-parent="#accordion"
                                                                               href="#collapse_voice">
                                                                                Passiv
                                                                            </a>
                                                                        </h4>
                                                                    </div>
                                                                    <div id="collapse_voice" class="panel-collapse collapse">
                                                                        <div class="panel-body">
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-passiveVoiceWerden" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;werden-Passiv <br><span class="df" id="passiveVoiceWerden-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="passiveVoiceWerden-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <hr>
                                                                        <div class="panel-body">
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-passiveVoiceSein" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;sein-Passiv <br><span class="df" id="passiveVoiceSein-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="passiveVoiceSein-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div> 


                                                                <!--                       <div class="panel panel-info success">
                                                                                           <div class="panel-heading">
                                                                                               <h4 class="panel-title">
                                                                                                   <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('phrasalVerbs')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                                                   <a data-toggle="collapse" data-parent="#accordion"
                                                                                                      href="#collapse_phrasalVerbs">
                                                                                                       phrasal
                                                                                                   </a>
                                                                                               </h4>
                                                                                           </div>
                                                                                           <div id="collapse_phrasalVerbs" class="panel-collapse collapse">
                                                                                               <div class="panel-body">
                                                                                                   <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-phrasalVerbs" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;phrasal verbs <br><span class="df" id="phrasalVerbs-df"></span>
                                                                                                       <div class="ui-widget-content" style="width:80%;">
                                                                                                           <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="phrasalVerbs-gradientSlider"></div>
                                                                                                       </div>
                                                                                                   </div>
                                                                                               </div>
                                                                                           </div>
                                                                                       </div>   -->

                                                                <!--
                                                                                                                        <div class="panel panel-info success">
                                                                                                                            <div class="panel-heading">
                                                                                                                                <h4 class="panel-title">
                                                                                                                                    <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('modals')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                                                                                    <a data-toggle="collapse" data-parent="#accordion"
                                                                                                                                       href="#collapse_modals">
                                                                                                                                        modal
                                                                                                                                    </a>
                                                                                                                                </h4>
                                                                                                                            </div>
                                                                                                                            <div id="collapse_modals" class="panel-collapse collapse">
                                                                                                                                <div class="panel-body">
                                                                                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-simpleModals" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;simple (can, must, need, may) <br><span class="df" id="simpleModals-df"></span>
                                                                                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                                                                                            <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="simpleModals-gradientSlider"></div>
                                                                                                                                        </div>
                                                                                                                                    </div>
                                                                                                                                    <hr>
                                                                
                                                                
                                                                                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-advancedModals" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;advanced <br><span class="df" id="advancedModals-df"></span>
                                                                                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                                                                                            <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="advancedModals-gradientSlider"></div>
                                                                                                                                        </div>
                                                                                                                                    </div>
                                                                
                                                                                                                                </div>
                                                                                                                            </div>
                                                                                                                        </div> -->


                                                                <div class="panel panel-info success">
                                                                    <div class="panel-heading">
                                                                        <h4 class="panel-title">
                                                                            <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('sentenceBrackets')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                            <a data-toggle="collapse" data-parent="#accordion"
                                                                               href="#collapse_sentenceBrackets">
                                                                                Satzklammer
                                                                            </a>
                                                                        </h4>
                                                                    </div>
                                                                    <div id="collapse_sentenceBrackets" class="panel-collapse collapse">
                                                                        <div class="panel-body">
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-verbBrackets" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Besetzte Satzklammer <br><span class="df" id="verbBrackets-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="verbBrackets-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                            <hr>
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-verbCluster" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Verbcluster <br><span class="df" id="verbCluster-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="verbCluster-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>  

                                                                <div class="panel panel-info success">
                                                                    <div class="panel-heading">
                                                                        <h4 class="panel-title">
                                                                            <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('imperative')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                            <a data-toggle="collapse" data-parent="#accordion"
                                                                               href="#collapse_imperative">
                                                                                Verbformen
                                                                            </a>
                                                                        </h4>
                                                                    </div>
                                                                    <div id="collapse_imperative" class="panel-collapse collapse">
                                                                        <div class="panel-body">
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-imperatives" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Imperative<br><span class="df" id="imperatives-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="imperatives-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                            <hr>
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-infinitiveForms" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Infinitive <br><span class="df" id="infinitiveForms-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="infinitiveForms-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                            <hr>
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-toInfinitiveForms" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;zu-Infinitive <br><span class="df" id="toInfinitiveForms-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="toInfinitiveForms-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                            <hr>
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-participleForms" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Partizipien <br><span class="df" id="participleForms-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="participleForms-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>




                                                    <div class="panel panel-info">
                                                        <div class="panel-heading">
                                                            <h4 class="panel-title">
                                                                <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('negation')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                <a data-toggle="collapse" data-parent="#accordion"
                                                                   href="#collapse_negation">
                                                                    Negation
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="collapse_negation" class="panel-collapse collapse">
                                                            <div class="panel-body">
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-negAll" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Negation (kein, kaum, nie, etc.) <br><span class="df" id="negAll-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="negAll-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-partialNegation" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Partielle Negation (kaum, selten, etc.) <br><span class="df" id="partialNegation-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="partialNegation-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-noNotNever" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Volle Negation (kein, nichts, nirgends, etc.) <br><span class="df" id="noNotNever-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="noNotNever-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <!--        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-not" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;not (full form) <br><span class="df" id="not-df"></span>
                                                                            <div class="ui-widget-content" style="width:80%;">
                                                                                <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="not-gradientSlider"></div>
                                                                            </div>
                                                                        </div>
                                                                        <hr> -->
                                                                <!--        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-nt" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;n't (contracted form) <br><span class="df" id="nt-df"></span>
                                                                            <div class="ui-widget-content" style="width:80%;">
                                                                                <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="nt-gradientSlider"></div>
                                                                            </div>
                                                                        </div>
                                                                        <hr>  -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="panel panel-info">
                                                        <div class="panel-heading">
                                                            <h4 class="panel-title">
                                                                <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('articles')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                <a data-toggle="collapse" data-parent="#accordion"
                                                                   href="#collapse_articles">
                                                                    Artikel
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="collapse_articles" class="panel-collapse collapse">
                                                            <div class="panel-body">
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-articles" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;alle Artikel <br><span class="df" id="articles-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="articles-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-aArticle" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;unbestimmte Artikel <br><span class="df" id="aArticle-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="aArticle-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <!--            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-anArticle" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;an <br><span class="df" id="anArticle-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="anArticle-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                            <hr>   -->
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-theArticle" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;bestimmte Artikel <br><span class="df" id="theArticle-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="theArticle-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="panel panel-info">
                                                        <div class="panel-heading">
                                                            <h4 class="panel-title">
                                                                <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('quantifiers')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                <a data-toggle="collapse" data-parent="#accordion"
                                                                   href="#collapse_quantifiers">
                                                                    Indefinite Quantifizierer
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="collapse_quantifiers" class="panel-collapse collapse">
                                                            <div class="panel-body">
                                                                <div class="panel-body">
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-someDet" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;einige, manche, ... <br><span class="df" id="someDet-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="someDet-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-anyDet" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;irgend... <br><span class="df" id="anyDet-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="anyDet-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <!--            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-muchDet" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;much <br><span class="df" id="muchDet-df"></span>
                                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="muchDet-gradientSlider"></div>
                                                                                    </div>
                                                                                </div>
                                                                                <hr> -->
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-manyDet" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;viel, viele, ... <br><span class="df" id="manyDet-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="manyDet-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <!--            <div class="panel panel-info">
                                                                    <div class="panel-heading">
                                                                        <h4 class="panel-title">
                                                                            <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('adjectives')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                            <a data-toggle="collapse" data-parent="#accordion"
                                                                               href="#collapse_adjectives">
                                                                                Adjektive
                                                                            </a>
                                                                        </h4>
                                                                    </div>
                                                                    <div id="collapse_adjectives" class="panel-collapse collapse">
                                                                        <div class="panel-body">
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-positiveAdj" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;positiv (groß, hoch, ...) <br><span class="df" id="positiveAdj-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="positiveAdj-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                            <hr>
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-comparativeAdjShort" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;komparativ (größer, höher,...) <br><span class="df" id="comparativeAdjShort-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="comparativeAdjShort-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                            <hr>
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-superlativeAdjShort" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;superlativ (größter, am größten, ...) <br><span class="df" id="superlativeAdjShort-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="superlativeAdjShort-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                    <!--                <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-comparativeAdjLong" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;comparative long (more difficult) <br><span class="df" id="comparativeAdjLong-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="comparativeAdjLong-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr> -->
                                                    <!--           <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-superlativeAdjLong" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;superlative long (most difficult) <br><span class="df" id="superlativeAdjLong-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="superlativeAdjLong-gradientSlider"></div>
                                                                    </div>
                                                                </div> -->
                                                    <!--                </div>
                                                                </div>
                                                            </div>  -->

                                                    <div class="panel panel-info">
                                                        <div class="panel-heading">
                                                            <h4 class="panel-title">
                                                                <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('adverbs')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                <a data-toggle="collapse" data-parent="#accordion"
                                                                   href="#collapse_adverbs">
                                                                    Adjektve, Adverben und Zahlworte
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="collapse_adverbs" class="panel-collapse collapse">
                                                            <div class="panel-body">
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-positiveAdj" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Adjektive <br><span class="df" id="positiveAdj-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="positiveAdj-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-positiveAdv" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Adverben <br><span class="df" id="positiveAdv-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="positiveAdv-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-particleAdjAdv" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Adjektiv- und Adverbpartikel<br><span class="df" id="particleAdjAdv-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="particleAdjAdv-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-cardinals" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Zahlworte <br><span class="df" id="cardinals-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="cardinals-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <!--    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-superlativeAdvLong" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;superlative long (most easily) <br><span class="df" id="superlativeAdvLong-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="superlativeAdvLong-gradientSlider"></div>
                                                                        </div>
                                                                    </div> -->
                                                            </div>    
                                                        </div>  
                                                    </div> 


                                                    <div class="panel panel-info">
                                                        <div class="panel-heading">
                                                            <h4 class="panel-title">
                                                                <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('pronouns')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                <a data-toggle="collapse" data-parent="#accordion"
                                                                   href="#collapse_pronouns">
                                                                    Pronomen
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="collapse_pronouns" class="panel-collapse collapse">
                                                            <div class="panel-body">
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-pronounsPersonal" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Personalpronomen (ich, du, ...) <br><span class="df" id="pronounsPersonal-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="pronounsPersonal-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-pronounsRelative" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Relativpronomen (der, dessen, ...)<br><span class="df" id="pronounsRelative-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="pronounsRelative-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-pronounsPossessive" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Possessivpronomen (mein, dein, ...)<br><span class="df" id="pronounsPossessive-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="pronounsPossessive-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-pronounsDemonstrative" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Demonstrativpronomen (dieser, jener, ...)<br><span class="df" id="pronounsDemonstrative-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="pronounsDemonstrative-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-pronounsReflexive" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Reflexivpronomen (mich, sich) <br><span class="df" id="pronounsReflexive-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="pronounsReflexive-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-pronounsIndefinite" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Indefinitpronomen (kein, irgendein) <br><span class="df" id="pronounsIndefinite-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="pronounsIndefinite-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-pronounsInterrogative" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Interrogativpronomen (welche, wobei) <br><span class="df" id="pronounsInterrogative-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="pronounsInterrogative-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!--                    <div class="panel panel-info">
                                                                            <div class="panel-heading">
                                                                                <h4 class="panel-title">
                                                                                    <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('conjunctions')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                                    <a data-toggle="collapse" data-parent="#accordion"
                                                                                       href="#collapse_conjunctions">
                                                                                        Konjunktionen
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div id="collapse_conjunctions" class="panel-collapse collapse">
                                                                                <div class="panel-body">
                                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-simpleConjunctions" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;einfach <br> (und, oder, aber, weil, so) <br><span class="df" id="simpleConjunctions-df"></span>
                                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                                            <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="simpleConjunctions-gradientSlider"></div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <hr>
                                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-advancedConjunctions" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;fortgeschritten <br> (daher, schließlich, während, etc.) <br><span class="df" id="advancedConjunctions-df"></span>
                                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                                            <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="advancedConjunctions-gradientSlider"></div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>   -->


                                                    <div class="panel panel-info">
                                                        <div class="panel-heading">
                                                            <h4 class="panel-title">
                                                                <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('prepositions')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                <a data-toggle="collapse" data-parent="#accordion"
                                                                   href="#collapse_prepositions">
                                                                    Präpositionen
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="collapse_prepositions" class="panel-collapse collapse">
                                                            <div class="panel-body">
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-simplePrepositions" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Präposition <br>(auf, unter, neben, etc.) <br><span class="df" id="simplePrepositions-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="simplePrepositions-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-complexPrepositions" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Postposition <br>(zufolge, wegen, etc.) <br><span class="df" id="complexPrepositions-df"></span>
                                                                    <div class="ui-widget-content" style="width:80%;">
                                                                        <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="complexPrepositions-gradientSlider"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="panel panel-info">
                                                        <div class="panel-heading">
                                                            <h4 class="panel-title">
                                                                <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('nouns')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                <a data-toggle="collapse" data-parent="#accordion"
                                                                   href="#collapse_nouns">
                                                                    Nomen
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="collapse_nouns" class="panel-collapse collapse">
                                                            <div class="panel-body">
                                                                <br>
                                                                <div class="panel panel-info success">
                                                                    <div class="panel-heading">
                                                                        <h4 class="panel-title">
                                                                            <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('nounSuffixes')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                            <a data-toggle="collapse" data-parent="#accordion"
                                                                               href="#collapse_nounSuffixes">
                                                                                Nominalisierungen
                                                                            </a>
                                                                        </h4>
                                                                    </div>
                                                                    <div id="collapse_nounSuffixes" class="panel-collapse collapse">
                                                                        <div class="panel-body">
                                                                           <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-ismusNounForms" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;-ismus Nominalisierungen <br>(Naturalismus, Pluralismus, etc.) <br><span class="df" id="ismusNounForms-df"></span>
                                                                            <div class="ui-widget-content" style="width:80%;">
                                                                                <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="ismusNounForms-gradientSlider"></div>
                                                                            </div>
                                                                            </div>
                                                                            <hr> 
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-turNounForms" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;-tur Nominalisierungen <br>(Natur, Statur, etc.) <br><span class="df" id="turNounForms-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="turNounForms-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                            <hr> 
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-ungNounForms" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;-ung Nominalisierungen<br>(Schenkung, Schulung, etc.) <br><span class="df" id="ungNounForms-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="ungNounForms-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="panel panel-info success">
                                                                    <div class="panel-heading">
                                                                        <h4 class="panel-title">
                                                                            <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('nounAttributes')"><span class="glyphicon glyphicon-erase" title="zurücksetzen"></span></button>
                                                                            <a data-toggle="collapse" data-parent="#accordion"
                                                                               href="#collapse_nounAttributes">
                                                                                Attribute
                                                                            </a>
                                                                        </h4>
                                                                    </div>
                                                                    <div id="collapse_nounAttributes" class="panel-collapse collapse">
                                                                        <div class="panel-body">
                                                                           <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-participle1Attribute" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Partizipialattribut I <br>(das rennende Kanninchen, etc.) <br><span class="df" id="participle1Attribute-df"></span>
                                                                            <div class="ui-widget-content" style="width:80%;">
                                                                                <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="participle1Attribute-gradientSlider"></div>
                                                                            </div>
                                                                            </div>
                                                                            <hr> 
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-participle2Attribute" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Partizipialattribut II <br>(der gelaufene Marathon, etc.) <br><span class="df" id="participle2Attribute-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="participle2Attribute-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                            <hr> 
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-adjectiveAttribute" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Adjektivattribut <br>(der schwarze Kater, etc.) <br><span class="df" id="adjectiveAttribute-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="adjectiveAttribute-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                            <hr> 
                                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-prepositionalAttribute" title="abwählen, um Texte mit dieser Konstruktion auszuschließen" checked>&nbsp;Präpositionalattribut <br>(die Zerstörung von der Stadt, etc.) <br><span class="df" id="prepositionalAttribute-df"></span>
                                                                                <div class="ui-widget-content" style="width:80%;">
                                                                                    <div class="gradientSlider" title="nach rechts bewegen, um Texte mit dieser Konstruktion höher zu bewerten" id="prepositionalAttribute-gradientSlider"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default" style="text-align: center; border:none;">
                                            <span class="glyphicon glyphicon-erase">&nbsp;</span><a href="javascript:FLAIR.WEBRANKER.singleton.resetAllSettingsAndFilters(true, true, true, true);" style="color:grey;">ALLE ZURÜCKSETZEN</a>
                                        </div>

                                        <br><br><br><br><br><br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <!-- MAIN AREA -->
                    <div class="col-md-10 col-xs-11">
                        <div id="page-content-wrapper">
                            <div class="mainArea" style="margin-top: 60px;"><br>
                                <!-- show results here -->
                                <!--                            <div class="col-md-2"></div>-->
                                <div class="results">
                                    <table class="table table-hover" style="width:100%; margin-left:10px;margin-right:10px;">
                                        <tbody id="results_table">
                                        </tbody>
                                    </table>
                                    <br><br><br><br><br><br><br>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <!-- RIGHT SIDEBAR-->
                    <div class="col-md-3 col-xs-11">
                        <div id="sidebar-wrapper-right">
                            <div  class="sidebar-nav-right" id="sidebar-right">
                                <br><br><br><br>
                                <div id="snapshot" style="padding-left: 5%; padding-right: 5%;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>





        <!-- ABOUT FLAIR MODAL -->
        <div class="modal fade modal-lg" id="myModal_About" tabindex="-1" role="dialog" aria-hidden="true" style="margin:0 auto;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <center>
                            <h3 class="modal-title">Über FLAIR </h3>
                            <p><span style="color:darkorange"><b>von</b></span> <a href="http://sfs.uni-tuebingen.de/~mchnkina/" target="_blank">Maria Chinkina</a> <a href="mailto:maria.chinkina@uni-tuebingen.de?Subject=FLAIR%20tool" target="_top" title="Maria Chinkina kontaktieren"><span class="glyphicon glyphicon-envelope"></span></a> 
                                &
                                <a href="http://sfs.uni-tuebingen.de/~mkannan/" target="_blank">Madeeswaran Kannan</a> <a href="mailto:mkannan@sfs.uni-tuebingen.de?Subject=FLAIR%20tool" target="_top" title="Madeeswaran Kannan kontaktieren"><span class="glyphicon glyphicon-envelope"></span></a> betreut von 
                                <a href="http://sfs.uni-tuebingen.de/~dm/" target="_blank">Prof. Dr. Detmar Meurers</a> 
                                <br> <span style="color:darkorange">@</span> Universität Tübingen, Deutschland <span style="color:darkorange">|</span> 2015-2016
                                <br> Version 1.0
                            </p>
                        </center>
                    </div>
                    <div class="modal-body">
                        <div  style="text-align: center">
                            <p>FLAIR ist ein Online-Tool für Lerner und Lehrer von Sprachen. FLAIR:
                            </p>
                            <ul   style="text-align: left">
                                <li>durchsucht das Web nach einem gewünschten Thema</li>
                                <li>analysiert die Suchergebnisse auf Grammatikkonstruktionen und Schwierigkeitsgrade</li>
                                <li>bewertet die Ergebnisse nach Ihren (pädagogischen oder lern-spezifischen) Bedürfnissen, die Sie in den Einstellungen festlegt haben</li>
                            </ul>




                            <!--                        <div class="panel panel-info success" style="display:inline-block;width:30%;">
                                                        <div class="panel-heading" style="text-align: center">
                                                            <h3 class="panel-title">SEARCH</h3>
                                                        </div>
                                                        <div class="panel-body">
                                                            Type in a search query. <br>
                                                            FLAIR fetches the results from Microsoft Bing.
                                                        </div>
                                                    </div>
                                                    <div class="panel panel-warning" style="display:inline-block;width:30%;">
                                                        <div class="panel-heading" style="text-align: center">
                                                            <h3 class="panel-title">CONFIGURE</h3>
                                                        </div>
                                                        <div class="panel-body">
                                                            Configure the settings: <b>text</b> (complexity, length) and <b>language</b> (the passive, wh- questions, ...) 
                                                        </div>
                                                    </div>
                                                    <div class="panel panel-info" style="display:inline-block;width:30%;">
                                                        <div class="panel-heading" style="text-align: center">
                                                            <h3 class="panel-title">READ</h3>
                                                        </div>
                                                        <div class="panel-body">
                                                            Now FLAIR has re-ranked the documents to satisfy the configured settings.
                                                            Enjoy!                      
                                                        </div>
                                                    </div>-->

                        </div>

                        <p><b>ARTIKEL:</b></p>
                        <ul>
                            <li><a href="http://sfs.uni-tuebingen.de/~mchnkina/downloads/Chinkina_Maria_thesis_2015.pdf" target="_blank">MA-Arbeit von Maria Chinkina</a></li>
                            <li><a href="http://sfs.uni-tuebingen.de/~mchnkina/downloads/Chinkina_Meurers_BEA_2016.pdf" target="_blank">BEA-Artikel</a> (Maria Chinkina, Detmar Meurers)</li>
                            <li><a href="http://sfs.uni-tuebingen.de/~mchnkina/downloads/Chinkina_Kannan_Meurers_ACL_2016.pdf" target="_blank">Systembeschreibung</a> (Maria Chinkina, Madeeswaran Kannan, Detmar Meurers)</li>
                        </ul>
                        <br>
                        <p><b>ZUSÄTZLICHES MATERIAL:</b></p>
                        <ul>
                            <li><a href="http://sfs.uni-tuebingen.de/~mchnkina/downloads/FLAIR_Evaluation.pdf" target="_blank">Evaluation des FLAIR-Algorithmus</a> (81 grammatische Konstruktionen für Englisch: Precision, Recall, F1)</li>
                            <!--<li><a href="http://sfs.uni-tuebingen.de/~mchnkina/downloads/AWL.pdf" target="_blank">AWL: Liste des Akademischen Vokabulars für Englisch</a> (<a href="http://onlinelibrary.wiley.com/doi/10.2307/3587951/abstract" target="_blank">Coxhead, 2000</a>)</li>-->
                            <!--<li><a href="http://sfs.uni-tuebingen.de/~mchnkina/img/heatmap_vert_color.png" target="_blank">Verteilung von Grammatikkonstruktionen für Englisch im Web</a> (oberste 55 Treffer für eine Suchanfrage)</li> -->
                        </ul>
                        <br>
                        <p><b>DRITT-WERKZEUGE</b></p>
                        <ul>
                            <li>Back-end: <a href="http://datamarket.azure.com/dataset/bing/search" target="_blank">Microsoft Bing API</a> (<a href="https://github.com/peculater/azure-bing-search-java" target="_blank">Java implementation</a>), <a href="https://github.com/kohlschutter/boilerpipe" target="_blank">Boilerpipe</a>, <a href="http://stanfordnlp.github.io/CoreNLP/" target="_blank">Stanford CoreNLP</a></li>
                            <li>Front-end: <a href="http://getbootstrap.com" target="_blank">Bootstrap</a>, <a href="http://glyphicons.com/" target="_blank">Glyphicons</a>, <a href="https://d3js.org" target="_blank">d3</a></li>
                        </ul>
                        <br>
                        <p><b>LIZENZ</b> </p>
                        <a rel="license" href="https://creativecommons.org/licenses/by-nc-sa/4.0/deed.de"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br/>FLAIR ist lizensiert unter einer <a rel="license" href="https://creativecommons.org/licenses/by-nc-sa/4.0/deed.de">Creative Commons Namensnennung - Nicht-kommerziell - Weitergabe unter gleichen Bedingungen 4.0 Internationalen Lizenz</a>.
                    </div>
                    <div class="modal-footer">
                        <center>
                            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="">SCHLIESSEN</button>
                        </center>
                    </div>
                </div>
            </div>
        </div>

        <!-- VISUALIZATION FILTER MODAL -->
        <div class="modal fade modal-xl" id="myModal_Visualize" tabindex="-1" role="dialog" aria-hidden="true" style="margin:0 auto;">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                        <label class="close" data-toggle="popover" data-placement="auto left" data-content="<br><br><br><ul><li><b>Bereiche auswählen</b> durch Hoch- und Runterziehen des Zeigers</li><br><li> <b>Reihenfolge der Achsen umtauschen</b> durch Rechts- und Linksbewegen der Achsen</li><br><li> <b>Achsen hinzufügen oder entfernen</b> durch An- und Abwählen der Kontrollkästchen rechts </li></ul>"><span class="glyphicon glyphicon-question-sign" aria-hidden="true">&nbsp;</span></label>
                        <center> 
                            <h4 style="" id="query_vis"> </h4> 
                        </center>
                    </div>
                    <div class="modal-body">
                        <div class="tab-pane fade active in">
                            <div class="row">
                                <div class="col-md-8">
                                    <svg id="svg_area">
                                    </svg>
                                </div>
                                <div class="col-md-1">&nbsp;</div>
                                <div class="col-md-3" style="border-left:1px lightgrey solid; padding-left: 20px;">
                                    <div id="list_of_constructs_vis" style="height:370px;overflow-y: scroll;">
                                        <div style="text-align: right;">
                                            <a href="javascript:FLAIR.WEBRANKER.singleton.resetAllSettingsAndFilters(true, false, true, true);" style="color:grey;">ALLES ZURÜCKSETZEN <span class="glyphicon glyphicon-erase" title="reset"></span></a>

                                        </div>
                                        <table class="table table-hover table-condensed">
                                            <tbody>
                                                <tr class="active">
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="document-def-vis" checked>
                                                        Ergebnis
                                                    </td>
                                                </tr>
                                                <tr class="active">
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="words-def-vis" checked>
                                                        # an Wörtern
                                                    </td>
                                                </tr>
                                                <tr class="active">
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="sentences-def-vis">
                                                        # an Sätzen
                                                    </td>
                                                </tr>
                                                <tr class="active">
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="score-def-vis">
                                                        Schwierigkeitsgrad
                                                    </td>
                                                </tr>
                                                <tr><td></td></tr>
                                                <tr class="warning">
                                                    <td>
                                                        Sätze
                                                    </td>

                                                </tr>

                                                <tr class="info">
                                                    <td>
                                                        Sätze&nbsp;&nbsp;>&nbsp;&nbsp;Fragen
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="directQuestions-vis">
                                                        Direkte Fragen
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="indirectQuestions-vis">
                                                        Indirekte Fragen
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="whQuestions-vis">
                                                        W-Fragen
                                                    </td>

                                                </tr>
                                                <!--            <tr>
                                                                <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="toDoQuestions-vis">
                                                                    do- questions
                                                                </td>
            
                                                            </tr>  -->
                                                <!--                <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="toBeQuestions-vis">
                                                                    be- questions
                                                                </td>
            
                                                            </tr> -->
                                                <!--           <tr>
                                                               <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="toHaveQuestions-vis">
                                                                   have- questions
                                                               </td>
           
                                                           </tr>  -->
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="yesNoQuestions-vis">
                                                        Ja/Nein Fragen
                                                    </td>

                                                </tr>
                                    <!--            <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="tagQuestions-vis">
                                                        Nachziehfragen
                                                    </td>

                                                </tr> -->

                                                <tr class="info">
                                                    <td>
                                                        Sätze&nbsp;&nbsp;>&nbsp;&nbsp;Satztypen
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="simpleSentence-vis">
                                                        einfach
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="compoundSentence-vis">
                                                        koordiniert
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="subordinateClause-vis">
                                                        subordiniert
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="incompleteSentence-vis">
                                                        Satzfragment
                                                    </td>

                                                </tr>

                                                <tr class="info">
                                                    <td>
                                                        Sätze&nbsp;&nbsp;>&nbsp;&nbsp;Nebensatztypen
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="relativeClause-vis">
                                                        relativ
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="adverbialClause-vis">
                                                        adverbial
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="dassClause-vis">
                                                        dass
                                                    </td>

                                                </tr> 
                                                <!--            <tr>
                                                                <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="condUnreal-vis">
                                                                    unreal conditional (II, III)
                                                                </td>
            
                                                            </tr>  -->
                                                <!--            <tr>
                                                                <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="thereIsAre-vis">
                                                                    there is/are
                                                                </td>
            
                                                            </tr>  -->
                                                <!--            <tr>
                                                                <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="thereWasWere-vis">
                                                                    there was/were
                                                                </td>
            
                                                            </tr>  -->
                                                <tr><td></td></tr>
                                                <tr class="warning">
                                                    <td>
                                                        Wortarten
                                                    </td>

                                                </tr>
                                                <tr class="info">
                                                    <td>
                                                        Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Verben
                                                    </td>

                                                </tr>
                                                <tr class="success">
                                                    <td>
                                                        Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Verben&nbsp;&nbsp;>&nbsp;&nbsp;Verbtypen
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="mainVerbs-vis">
                                                        Vollverben (gehen, sprechen, etc.)
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="auxiliaryVerbs-vis">
                                                        Hilfsverben (sein, haben) 
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="modalVerbs-vis">
                                                        Modalverben (können, müssen, etc.)  
                                                    </td>

                                                </tr>
                                                <!--            <tr>
                                                                <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="emphaticDo-vis">
                                                                    emphatic "do"
                                                                </td>
            
                                                            </tr>  -->
                                                <!--            <tr>
                                                                <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="irregularVerbs-vis">
                                                                    irregular verbs (2nd, 3rd form)
                                                                </td>
            
                                                            </tr>  -->
                                                <!--            <tr>
                                                                <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="regularVerbs-vis">
                                                                    regular verbs (2nd, 3rd form)
                                                                </td>
            
                                                            </tr>  -->

                                                <tr class="success">
                                                    <td>
                                                        Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Verben&nbsp;&nbsp;>&nbsp;&nbsp;Zeiten
                                                    </td>

                                                </tr>
                                                <!--                    <tr>
                                                                        <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="presentSimple-vis">
                                                                            Present Simple
                                                                        </td>
                    
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="pastSimple-vis">
                                                                            Past Simple
                                                                        </td>
                    
                                                                    </tr> -->
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="presentPerfectHaben-vis">
                                                        haben-Perfekt
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="presentPerfectSein-vis">
                                                        sein-Perfekt
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="pastPerfectHaben-vis">
                                                        haben-Plusquamperfekt
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="pastPerfectSein-vis">
                                                        sein-Plusquamperfekt
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="futureSimple-vis">
                                                        Futur 1
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="futurePerfect-vis">
                                                        Futur 2
                                                    </td>
                                                </tr>


                                                <!--            <tr class="success">
                                                                <td>
                                                                    Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Verben&nbsp;&nbsp;>&nbsp;&nbsp;aspect
                                                                </td>
            
                                                            </tr>
                                                            <tr>
                                                                <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="simpleAspect-vis">
                                                                    simple
                                                                </td>
            
                                                            </tr>
                                                            <tr>
                                                                <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="progressiveAspect-vis">
                                                                    progressive
                                                                </td>
            
                                                            </tr>
                                                            <tr>
                                                                <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="perfectAspect-vis">
                                                                    perfect
                                                                </td>
            
                                                            </tr>
                                                            <tr>
                                                                <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="perfProgAspect-vis">
                                                                    perfect progressive
                                                                </td>
            
                                                            </tr>  -->

                                                <!--                <tr class="success">
                                                                    <td>
                                                                        Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Verben&nbsp;&nbsp;>&nbsp;&nbsp;Zeiten
                                                                    </td>
                
                                                                </tr>
                                                                <tr>
                                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="presentTime-vis">
                                                                        Präsens, Perfekt
                                                                    </td>
                
                                                                </tr>
                                                                <tr>
                                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="pastTime-vis">
                                                                        Präteritum, Plusquamperfekt
                                                                    </td>
                
                                                                </tr>
                                                                <tr>
                                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="futureTime-vis">
                                                                        Futur 1, Futur 2
                                                                    </td>
                
                                                                </tr>   -->

                                                <tr class="success">
                                                    <td>
                                                        Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Verben&nbsp;&nbsp;>&nbsp;&nbsp;Passiv
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="passiveVoiceWerden-vis">
                                                        werden-Passiv
                                                    </td>

                                                </tr>  
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="passiveVoiceSein-vis">
                                                        sein-Passiv
                                                    </td>

                                                </tr>  

                                                <!--            <tr class="success">
                                                                <td>
                                                                    Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Verben&nbsp;&nbsp;>&nbsp;&nbsp;phrasal
                                                                </td>
            
                                                            </tr>
                                                            <tr>
                                                                <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="phrasalVerbs-vis">
                                                                    phrasal
                                                                </td>
            
                                                            </tr> -->

                                                <!--          <tr class="success">
                                                              <td>
                                                                  Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Verben&nbsp;&nbsp;>&nbsp;&nbsp;Modal
                                                              </td>
          
                                                          </tr>
                                                          <tr>
                                                              <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="simpleModals-vis">
                                                                  simple
                                                              </td>
          
                                                          </tr>
                                                          <tr>
                                                              <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="advancedModals-vis">
                                                                  advanced
                                                              </td>
          
                                                          </tr>  -->

                                                <tr class="success">
                                                    <td>
                                                        Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Verben&nbsp;&nbsp;>&nbsp;&nbsp;Satzklammer
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="verbBrackets-vis">
                                                        Besetzte Satzklammer
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="verbCluster-vis">
                                                        Verbcluster
                                                    </td>

                                                </tr> 

                                                <tr class="success">
                                                    <td>
                                                        Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Verben&nbsp;&nbsp;>&nbsp;&nbsp;Verbformen
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="imperatives-vis">
                                                        Imperative
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="infinitiveForms-vis">
                                                        Infinitive
                                                    </td>
                                                </tr>  
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="toInfinitiveForms-vis">
                                                        zu-Infinitive
                                                    </td>
                                                </tr>  
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="participleForms-vis">
                                                        Partizipien
                                                    </td>
                                                </tr>  



                                                <tr class="info">
                                                    <td>
                                                        Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Negation
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="negAll-vis">
                                                        Negation 
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="partialNegation-vis">
                                                        partielle Negation 
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="noNotNever-vis">
                                                        volle Negation
                                                    </td>

                                                </tr>
                                                <!--            <tr>
                                                                <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="not-vis">
                                                                    not (full form)
                                                                </td>
            
                                                            </tr>
                                                            <tr>
                                                                <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="nt-vis">
                                                                    n't (contracted form)
                                                                </td>
            
                                                            </tr>  -->

                                                <tr class="info">
                                                    <td>
                                                        Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Artikel
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="articles-vis">
                                                        alle Artikel
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="aArticle-vis">
                                                        unbestimmte Artikel
                                                    </td>

                                                </tr>
                                                <!--            <tr>
                                                                <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="anArticle-vis">
                                                                    an
                                                                </td>
            
                                                            </tr> -->
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="theArticle-vis">
                                                        bestimmte Artikel
                                                    </td>

                                                </tr>

                                                <tr class="info">
                                                    <td>
                                                        Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Indefinite Quantifizierer
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="someDet-vis">
                                                        einige
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="anyDet-vis">
                                                        irgend...
                                                    </td>

                                                </tr>
                                                <!--                <tr>
                                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="muchDet-vis">
                                                                        much
                                                                    </td>
                
                                                                </tr> -->
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="manyDet-vis">
                                                        viele
                                                    </td>

                                                </tr>

                                                <!--    <tr class="info">
                                                            <td>
                                                                Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Adjektive
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="positiveAdj-vis">
                                                                positiv
                                                            </td>
        
                                                        </tr>
                                                        <tr>
                                                            <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="comparativeAdjShort-vis">
                                                                komparativ
                                                            </td>
        
                                                        </tr>
                                                        <tr>
                                                            <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="superlativeAdjShort-vis">
                                                                superlativ
                                                            </td>
        
                                                        </tr> -->
                                                <!--        <tr>
                                                            <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="comparativeAdjLong-vis">
                                                                comparative long
                                                            </td>
        
                                                        </tr> -->
                                                <!--        <tr>
                                                            <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="superlativeAdjLong-vis">
                                                                superlative long
                                                            </td>
        
                                                        </tr>  -->

                                                <tr class="info">
                                                    <td>
                                                        Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Adjektive, Adverben und Zahlworte
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="positiveAdj-vis">
                                                        Adjektive
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="positiveAdv-vis">
                                                        Adverben
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="particleAdjAdv-vis">
                                                        Adjektiv- und Adverbpartikel
                                                    </td>

                                                </tr> 
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="cardinals-vis">
                                                        Zahlworte
                                                    </td>

                                                </tr>  
                                                <!--            <tr>
                                                                <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="superlativeAdvLong-vis">
                                                                    superlative long
                                                                </td>
            
                                                            </tr>   -->

                                                <tr class="info">
                                                    <td>
                                                        Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Pronomen
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="pronounsPersonal-vis">
                                                        Personalpronomen (ich, du, ...)
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="pronounsRelative-vis">
                                                        Relativpronomen (der, dessen)
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="pronounsPossessive-vis">
                                                        Possessivpronomen (mein, dein, ...)
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="pronounsDemonstrative-vis">
                                                        Demonstrativpronomen(dieser, jener, ...)
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="pronounsReflexive-vis">
                                                        Reflexivpronomen (mich, sich) 
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="pronounsIndefinite-vis">
                                                        Indefinitpronomen (kein, irgendein) 
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="pronounsInterrogative-vis">
                                                        Interrogativpronomen (wessen, wobei) 
                                                    </td>
                                                </tr>

                                                <!--                <tr class="info">
                                                                    <td>
                                                                        Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Konjunktionen
                                                                    </td>
                
                                                                </tr>
                                                                <tr>
                                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="simpleConjunctions-vis">
                                                                        einfach (und, oder, aber, weil, so) 
                                                                    </td>
                
                                                                </tr>
                                                                <tr>
                                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="advancedConjunctions-vis">
                                                                        fortgeschritten (daher, schließlich, während, etc.)
                                                                    </td>
                
                                                                </tr>   -->

                                                <tr class="info">
                                                    <td>
                                                        Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Präpositionen
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="simplePrepositions-vis">
                                                        Präposition (auf, unter, neben, etc.)
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="complexPrepositions-vis">
                                                        Postposition (zufolge, wegen, etc.)
                                                    </td>

                                                </tr>

                                                <tr class="info">
                                                    <td>
                                                        Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Nomen
                                                    </td>
                                                </tr>
                                                <tr class="success">
                                                    <td>
                                                        Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Nomen&nbsp;&nbsp;>&nbsp;&nbsp;Nominalisierungen
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="ismusNounForms-vis">
                                                        -ismus Nominalisierungen (Naturalismus, Pluralismus, etc.) 
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="turNounForms-vis">
                                                        -tur Nominalisierungen (Natur, Statur, etc.) 
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="ungNounForms-vis">
                                                        -ung Nominalisierungen (Schenkung, Schulung, etc.)
                                                    </td>
                                                </tr>
                                                <tr class="success">
                                                    <td>
                                                        Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Nomen&nbsp;&nbsp;>&nbsp;&nbsp;Attribute
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="participle1Attribute-vis">
                                                        Partizipialattribut I (das rennende Kanninchen, etc.)
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="participle2Attribute-vis">
                                                        Partizipialattribut II (der gelaufene Marathon, etc.)
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="adjectiveAttribute-vis">
                                                        Adjektivattribut (der schwarze Kater, etc.)
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="anwählen/abwählen, um eine Achse hinzuzufügen/zu entfernen" id="prepositionalAttribute-vis">
                                                        Präpositionalattribut (die Zerstörung von der Stadt, etc.)
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <center>
                            <button type="button" class="btn btn-primary" onclick="FLAIR.WEBRANKER.singleton.applyVisualiserFilter()">Übernehmen</button>
                        </center>
                    </div>
                </div>
            </div>
        </div>

        <!-- IDLE MODAL -->
        <div class="modal modal-lg" id="modal_WaitIdle" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false" style="margin:0 auto;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <center>
                        <div class="modal-body">
                            <br><img style='height:30px;' src='img/ajax-loader.gif' alt='...'/><br/>
                            <div class="tab-pane fade active in" id="modal_waitIdle_body">
                                <p>Bitte warten Sie, während wir Ihre Anfrage verarbeiten....</p>
                            </div>
                        </div>
                    </center>
                    <div class="modal-footer">
                        <div style="text-align: center;">
                            <button type="button" class="btn btn-primary" id="modal_waitIdle_buttonYes">Ja</button>
                            <button type="button" class="btn btn-primary" id="modal_waitIdle_buttonNo">Nein</button>
                            <button type="button" class="btn btn-primary" id="modal_waitIdle_buttonCancel">Abbrechen</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- CONSTRUCTIONS MODAL -->
        <div class="modal fade modal-lg" id="myModal_Constructs" tabindex="-1" role="dialog" aria-hidden="true" style="margin:0 auto;">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" style="text-align: center;">Liste der Konstruktionen</h4>
                    </div>
                    <div class="modal-body">
                        <div class="tab-pane fade active in">
                            <div id="list_of_constructs" class="pre-scrollable">
                                <table class="table table-hover">
                                    <tbody>
                                        <tr class="warning">
                                            <td>
                                                Sätze
                                            </td>
                                            <td>

                                            </td>
                                        </tr>

                                        <tr class="info">
                                            <td>
                                                Sätze&nbsp;&nbsp;>&nbsp;&nbsp;Fragen
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                direkte Fragen
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                indirekte Fragen
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                W-Fragen
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Ja/Nein Fragen
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                <!--        <tr class="simple_row">
                                            <td class="construct">
                                                Nachziehfragen
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr> -->

                                        <tr class="info">
                                            <td>
                                                Sätze&nbsp;&nbsp;>&nbsp;&nbsp;Satztypen
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                einfach
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                koordiniert
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                subordiniert
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Satzfragment
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>

                                        <tr class="info">
                                            <td>
                                                Sätze&nbsp;&nbsp;>&nbsp;&nbsp;Nebensatztypen
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                relativ
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                adverbial
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                dass
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr> 
                                        <!--            <tr class="simple_row">
                                                        <td class="construct">
                                                            unreal conditional (II, III)
                                                        </td>
                                                        <td class="example">
            
                                                        </td>
                                                    </tr>  -->
                                        <!--            <tr class="simple_row">
                                                        <td class="construct">
                                                            there is/are
                                                        </td>
                                                        <td class="example">
            
                                                        </td>
                                                    </tr>   -->
                                        <!--            <tr class="simple_row">
                                                        <td class="construct">
                                                            there was/were
                                                        </td>
                                                        <td class="example">
            
                                                        </td>
                                                    </tr>  -->
                                    </tbody>
                                </table>
                                <br><br>
                                <table class="table table-hover">
                                    <tbody>
                                        <tr class="warning">
                                            <td>
                                                Wortarten
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="info">
                                            <td>
                                                Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Verben
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="success">
                                            <td>
                                                Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Verben&nbsp;&nbsp;>&nbsp;&nbsp;Verbtypen
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <!--        <tr class="simple_row">
                                                    <td class="construct">
                                                        contracted (be, have)
                                                    </td>
                                                    <td class="example">
        
                                                    </td>
                                                </tr>  -->
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Vollverben (gehen, sprechen, etc.)
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Hilfsverben (sein, haben)
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Modalverben (können, müssen, etc.)
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <!--        <tr class="simple_row">
                                                    <td class="construct">
                                                        -ing forms (gerund, present participle)
                                                    </td>
                                                    <td class="example">
        
                                                    </td>
                                                </tr>  -->
                                        <!--        <tr class="simple_row">
                                                    <td class="construct">
                                                        emphatic "do"
                                                    </td>
                                                    <td class="example">
        
                                                    </td>
                                                </tr>
                                                <tr class="simple_row">
                                                    <td class="construct">
                                                        irregular verbs (2nd, 3rd form)
                                                    </td>
                                                    <td class="example">
        
                                                    </td>
                                                </tr>
                                                <tr class="simple_row">
                                                    <td class="construct">
                                                        regular verbs (2nd, 3rd form)
                                                    </td>
                                                    <td class="example">
        
                                                    </td>
                                                </tr>  -->

                                        <tr class="success">
                                            <td>
                                                Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Verben&nbsp;&nbsp;>&nbsp;&nbsp;Zeiten
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <!--            <tr class="simple_row">
                                                        <td class="construct">
                                                            Present Simple
                                                        </td>
                                                        <td class="example">
            
                                                        </td>
                                                    </tr>
                                                    <tr class="simple_row">
                                                        <td class="construct">
                                                            Past Simple
                                                        </td>
                                                        <td class="example">
            
                                                        </td>
                                                    </tr>-->
                                        <tr class="simple_row">
                                            <td class="construct">
                                                haben-Perfekt
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                sein-Perfekt
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                haben-Plusquamperfekt
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                sein-Plusquamperfekt
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Futur 1
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Futur 2
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>

                                        <!--        <tr class="success">
                                                    <td>
                                                        PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Verbs&nbsp;&nbsp;>&nbsp;&nbsp;aspect
                                                    </td>
                                                    <td>
        
                                                    </td>
                                                </tr>
                                                <tr class="simple_row">
                                                    <td class="construct">
                                                        simple
                                                    </td>
                                                    <td class="example">
        
                                                    </td>
                                                </tr>
                                                <tr class="simple_row">
                                                    <td class="construct">
                                                        progressive
                                                    </td>
                                                    <td class="example">
        
                                                    </td>
                                                </tr>
                                                <tr class="simple_row">
                                                    <td class="construct">
                                                        perfect
                                                    </td>
                                                    <td class="example">
        
                                                    </td>
                                                </tr>
                                                <tr class="simple_row">
                                                    <td class="construct">
                                                        perfect progressive
                                                    </td>
                                                    <td class="example"></td>
                                                </tr> -->

                                        <!--            <tr class="success">
                                                        <td>
                                                            Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Verben&nbsp;&nbsp;>&nbsp;&nbsp;Zeiten
                                                        </td>
                                                        <td>
            
                                                        </td>
                                                    </tr>
                                                    <tr class="simple_row">
                                                        <td class="construct">
                                                            Präsens, Perfekt
                                                        </td>
                                                        <td class="example">
            
                                                        </td>
                                                    </tr>
                                                    <tr class="simple_row">
                                                        <td class="construct">
                                                            Präteritum, Plusquamperfekt
                                                        </td>
                                                        <td class="example">
            
                                                        </td>
                                                    </tr>
                                                    <tr class="simple_row">
                                                        <td class="construct">
                                                            Futur 1, Futur 2
                                                        </td>
                                                        <td class="example">
            
                                                        </td>
                                                    </tr>  -->

                                        <tr class="success">
                                            <td>
                                                Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Verben&nbsp;&nbsp;>&nbsp;&nbsp;Passiv
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                werden-Passiv
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr> 
                                        <tr class="simple_row">
                                            <td class="construct">
                                                sein-Passiv
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr> 

                                        <!--        <tr class="success">
                                                    <td>
                                                        PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Verbs&nbsp;&nbsp;>&nbsp;&nbsp;phrasal
                                                    </td>
                                                    <td>
        
                                                    </td>
                                                </tr>
                                                <tr class="simple_row">
                                                    <td class="construct">
                                                        phrasal
                                                    </td>
                                                    <td class="example">
        
                                                    </td>
                                                </tr> -->

                                        <!--        <tr class="success">
                                                    <td>
                                                        Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Verbs&nbsp;&nbsp;>&nbsp;&nbsp;modal
                                                    </td>
                                                    <td>
        
                                                    </td>
                                                </tr>
                                                <tr class="simple_row">
                                                    <td class="construct">
                                                        simple
                                                    </td>
                                                    <td class="example">
                                                        can, must, need, may
                                                    </td>
                                                </tr>
                                                <tr class="simple_row">
                                                    <td class="construct">
                                                        advanced
                                                    </td>
                                                    <td class="example">
        
                                                    </td>
                                                </tr> -->

                                        <tr class="success">
                                            <td>
                                                Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Verben&nbsp;&nbsp;>&nbsp;&nbsp;Satzklammer
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Besetzte Satzklammer
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Verbcluster
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr> 

                                        <tr class="success">
                                            <td>
                                                Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Verben&nbsp;&nbsp;>&nbsp;&nbsp;Verbformen
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Imperative
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Infinitive
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                zu-Infinitive
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Partizipien
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>


                                        <tr class="info">
                                            <td>
                                                Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Negation
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Negation 
                                            </td>
                                            <td class="example">
                                                (kein, kaum, nie, etc.) 
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                partielle Negation 
                                            </td>
                                            <td class="example">
                                                (kaum, selten, etc.)
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                volle Negation
                                            </td>
                                            <td class="example">
                                                (kein, nichts, nirgends, etc.)
                                            </td>
                                        </tr>
                                        <!--        <tr class="simple_row">
                                                    <td class="construct">
                                                        not (full form)
                                                    </td>
                                                    <td class="example">
        
                                                    </td>
                                                </tr>
                                                <tr class="simple_row">
                                                    <td class="construct">
                                                        n't (contracted form)
                                                    </td>
                                                    <td class="example">
        
                                                    </td>
                                                </tr> -->

                                        <tr class="info">
                                            <td>
                                                Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Artikel
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                alle Artikel 
                                            </td>
                                            <td class="example">
                                                eine, der, ...
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                unbestimmte Artikel
                                            </td>
                                            <td class="example">
                                                ein, eine
                                            </td>
                                        </tr>
                                        <!--        <tr class="simple_row">
                                                    <td class="construct">
                                                        an
                                                    </td>
                                                    <td class="example">
        
                                                    </td>
                                                </tr> -->
                                        <tr class="simple_row">
                                            <td class="construct">
                                                bestimmte Artikel
                                            </td>
                                            <td class="example">
                                                der, die, das
                                            </td>
                                        </tr>

                                        <tr class="info">
                                            <td>
                                                Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Indefinite Quantifizierer
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                einige
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                irgend...
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <!--        <tr class="simple_row">
                                                    <td class="construct">
                                                        much
                                                    </td>
                                                    <td class="example">
        
                                                    </td>
                                                </tr> -->
                                        <tr class="simple_row">
                                            <td class="construct">
                                                viele
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>

                                        <!--            <tr class="info">
                                                            <td>
                                                                Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Adjektive
                                                            </td>
                                                            <td>
                
                                                            </td>
                                                        </tr>
                                                        <tr class="simple_row">
                                                            <td class="construct">
                                                                positiv 
                                                            </td>
                                                            <td class="example">
                                                                    
                                                            </td>
                                                        </tr>
                                                        <tr class="simple_row">
                                                            <td class="construct">
                                                                komparativ
                                                            </td>
                                                            <td class="example">
                
                                                            </td>
                                                        </tr>
                                                        <tr class="simple_row">
                                                            <td class="construct">
                                                                superlativ
                                                            </td>
                                                            <td class="example">
                
                                                            </td>
                                                        </tr>  -->
                                        <!--        <tr class="simple_row">
                                                    <td class="construct">
                                                        comparative long
                                                    </td>
                                                    <td class="example">
        
                                                    </td>
                                                </tr>
                                                <tr class="simple_row">
                                                    <td class="construct">
                                                        superlative long
                                                    </td>
                                                    <td class="example">
        
                                                    </td>
                                                </tr> -->

                                        <tr class="info">
                                            <td>
                                                Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Ajdektive, Adverben und Zahlworte
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Adjektive
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Adverben
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr> 
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Adjektiv- und Adverbpartikel
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Zahlworte
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <!--            <tr class="simple_row">
                                                        <td class="construct">
                                                            superlative long
                                                        </td>
                                                        <td class="example">
            
                                                        </td>
                                                    </tr>-->

                                        <tr class="info">
                                            <td>
                                                Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Pronomen
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Personalpronomen
                                            </td>
                                            <td class="example">
                                                ich, du
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Relativpronomen
                                            </td>
                                            <td class="example">
                                                der, dessen
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Possessivpronomen
                                            </td>
                                            <td class="example">
                                                mein, dein
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Demonstrativpronomen
                                            </td>
                                            <td class="example">
                                                dieser, jener
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Reflexivpronmen 
                                            </td>
                                            <td class="example">
                                                mich, sich
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Indefinitpronmen 
                                            </td>
                                            <td class="example">
                                                kein, irgendein
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Interrogativpronmen 
                                            </td>
                                            <td class="example">
                                                wessen, wobei
                                            </td>
                                        </tr>

                                        <!--                <tr class="info">
                                                            <td>
                                                                Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Konjunktionen
                                                            </td>
                                                            <td>
                
                                                            </td>
                                                        </tr>
                                                        <tr class="simple_row">
                                                            <td class="construct">
                                                                einfach  
                                                            </td>
                                                            <td class="example">
                                                                (und, oder, aber, weil, so) 
                                                            </td>
                                                        </tr>
                                                        <tr class="simple_row">
                                                            <td class="construct">
                                                                fortgeschritten 
                                                            </td>
                                                            <td class="example">
                                                                (daher, schließlich, während, etc.)
                                                            </td>
                                                        </tr>   -->

                                        <tr class="info">
                                            <td>
                                                Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Präpositionen
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Präposition 
                                            </td>
                                            <td class="example">
                                                (auf, unter, neben, etc.)
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Postposition 
                                            </td>
                                            <td class="example">
                                                (zufolge, wegen, etc.)
                                            </td>
                                        </tr>

                                        <tr class="info">
                                            <td>
                                                Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Nomen
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="success">
                                            <td>
                                                Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Nomen&nbsp;&nbsp;>&nbsp;&nbsp;Nominalisierungen
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                -ismus Nominalisierungen 
                                            </td>
                                            <td class="example">
                                                (Naturalismus, Pluralismus, etc.) 
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                -tur Nominalisierungen 
                                            </td>
                                            <td class="example">
                                                (Natur, Statur, etc.) 
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                -ung Nominalisierungen
                                            </td>
                                            <td class="example">
                                                (Schenkung, Schulung, etc.)
                                            </td>
                                        </tr>
                                        <tr class="success">
                                            <td>
                                                Wortarten&nbsp;&nbsp;>&nbsp;&nbsp;Nomen&nbsp;&nbsp;>&nbsp;&nbsp;Attribute
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Partizipialattribut I 
                                            </td>
                                            <td class="example">
                                                (das rennende Kanninchen, etc.)
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Partizipialattribut II 
                                            </td>
                                            <td class="example">
                                                (der gelaufene Marathon, etc.)
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Adjektivattribut 
                                            </td>
                                            <td class="example">
                                                (der schwarze Kater, etc.)
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Präpositionalattribut 
                                            </td>
                                            <td class="example">
                                                (die Zerstörung von der Stadt, etc.)
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- EXPORT SETTINGS MODAL -->
        <div class="modal fade modal-lg" id="modal_ExportSettings" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false" style="margin:0 auto;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" style="text-align: center;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Einstellungen exportieren</h4>
                    </div>
                    <div class="modal-body">
                        <div class="tab-pane fade active in" id="modal_ExportSettings_body">
                            <div class="input-group">
                                <div class="input-group-addon">URL</div>
                                <input class="form-control" id="exported_settings_url" readonly>
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button" onclick="FLAIR.WEBRANKER.UTIL.copyToClipboard('#exported_settings_url')">in die Zwischenablage kopieren</button>
                                </span>
                            </div>
                        </div>
                        <div class="modal-footer"  style="text-align: center;">
                            Sie können diesen Link benutzen, um Ihre derzeigen Einstellungen auf zukünftige Suchen anzuwenden,<br/>oder den Link mit Schülern teilen, sodass diese die Web-Suche mit Ihren Einstellungen verwenden können.
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- UPLOAD CUSTOM VOCAB MODAL -->
        <div class="modal fade modal-lg" id="modal_CustomVocab" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false" style="margin:0 auto;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Benutzerdefiniertes Vokabular bearbeiten</h4>
                    </div>
                    <div hidden>
                        <input id="modalCustomVocab-fileSelect" type="file"/>
                    </div>
                    <div class="modal-body">
                        <div class="tab-pane fade active in" id="modal_CustomVocab_body">
                            <div class="form-group">
                                <label>Benutzerdefiniertes Vokabular:</label>
                                <textarea class="form-control" rows="10" id="custom_vocab_textarea"></textarea><br/>
                                Wörter können durch Kommas, Leerzeichen oder Zeilenumbrüche getrennt sein.
                            </div>
                        </div>
                        <div class="modal-footer" style="text-align: center;">
                            <button type="button" class="btn btn-primary" id="modal_customVocab_buttonYes">Übernehmen</button>
                            <button type="button" class="btn btn-primary" id="modal_customVocab_buttonCancel">Abbrechen</button>
                        </div>
                    </div>
                </div>
            </div>
        </div> 

        <!-- UPLOAD CORPUS MODAL -->
        <div class="modal modal-lg" id="modal_CustomCorpus" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false" style="margin:0 auto;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header" style="text-align: center;">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Eigenes Korpus hochladen</h4>
                    </div>

                    <form id="modal_CustomCorpus_MainForm" action="CustomCorpusServlet" method="post" enctype="multipart/form-data" target="modal_CustomCorpus_dummyTarget">
                        <div class="modal-body">
                            <div class="tab-pane fade active in">
                                <div class="form-group" style="text-align: center;">
                                    <div hidden>
                                        <input id="modal_CustomCorpus_fileSelect" type="file" name="file" multiple accept=".txt"/>
                                    </div>
                                    <button type="button" class="btn btn-info btn-lg" id="modal_CustomCorpus_buttonSelectFiles">Dateien auswählen</button>
                                    <br/><br/>
                                    Sie können Textdateien für die Analyse hochladen.
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer"  style="text-align: center;">
                            <input type="submit" class="btn btn-primary" value="Hochladen" onclick="FLAIR.WEBRANKER.singleton.uploadCustomCorpus();">
                        </div>
                    </form>

                    <div hidden>
                        <iframe name="modal_CustomCorpus_dummyTarget" src="about:blank"></iframe>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript" src="js/libs/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="js/libs/jqueryui/jquery-ui.js"></script>
        <script type="text/javascript" src="js/libs/tablesorter/jquery.tablesorter.js"></script>
        <script type="text/javascript" src="js/libs/twitter-bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/libs/twitter-bootstrap/js/bootstrap-confirmation.js"></script>

        <script type="text/javascript" src="js/libs/number-polyfill.js"></script>
        <script type="text/javascript" src="js/libs/d3/d3.js"></script>
        <script type="text/javascript" src="js/libs/d3/d3.v3.min.js"></script>
        <script type="text/javascript" src="js/libs/toastr/toastr.min.js"></script>

        <script type="text/javascript" src="js/flair-core.js"></script>
        <script type="text/javascript" src="js/flair-plumbing.js"></script>
        <script type="text/javascript" src="js/flair-webranker.js"></script>
    </body>
</html>
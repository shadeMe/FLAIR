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
                                            <option value="10">10 pages</option>
                                            <option selected="selected" value="20">20 pages</option>
                                            <option value="30">30 pages</option>
                                            <option value="40">40 pages</option>
                                            <option value="50">50 pages</option>
                                        </select>
                                    </div>
                                    
                                </div>
                                </form>

                            </div>
                            <div class="col-md-2 col-xs-2" style="padding-top:0.7%;">
				    <a href="#customCorpus-toggle" id="customCorpus-toggle" style="text-align:left;" title="Upload Custom Corpus">
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

                <div class="row" style="margin-top: 2%; margin-bottom:1%">
                <!-- Settings SIDE BAR -->
                <div  class="col-md-3">
                <div id="sidebar-wrapper">
                    <div  class="sidebar-nav" id="sidebar">
                        <div>
                            <div class="df" id="docs_info"></div>
                            <br><div class="panel panel-default" style="text-align: center">
                                <a href="javascript:FLAIR.WEBRANKER.singleton.showVisualiser();" style="color:orange" >VISUALIZE</a>
                            </div>
			    <hr>
			    <div class="panel panel-info" style="text-align: center">
				<a href="javascript:FLAIR.WEBRANKER.singleton.exportSettings();" style="color:grey;">SHARE <br> search setup</a>
			    </div>

                            <!-- Shorter/longer documents slider -->
                            <hr>
                            <h4 style="color:grey">Text characteristics:</h4>
                            <div class="row">
                                <div class="col-md-2 col-xs-2">
                                    Length: <br><br>
                                    <div class="ui-widget-content-len">
                                        <div class="lengthSlider" id="length-slider"></div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-xs-2"></div>
                                <div class="col-md-6 col-xs-8" id="settings_levels" style="border-left:1px lightgrey solid;">
                                    Levels:  <br><br>
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
				    <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleKeywordHighlighting()" id="tgl-customVocabList" title="check to highlight keywords" checked>&nbsp;<span id="customVocabList-label">Academic</span> Vocabulary&nbsp;
		<!--		    <div hidden> -->
					<a href="#customVocabList-upload" id="customVocabList-upload" title="Edit Vocabulary"><span class="glyphicon glyphicon-edit"></span></a>&nbsp;
					<a href="#customVocabList-reset" id="customVocabList-reset" title="Use Defualt Academic Vocabulary"><span class="glyphicon glyphicon-repeat"></span></a>
		<!--		    </div> -->
					<br><br>
				    <div class="ui-widget-content" style="width:80%;">
					<div class="gradientSlider" title="move right to rank texts with this construct higher" id="customVocabList-gradientSlider"></div>
				    </div>
				</div>
                            <hr>
                            <div id="settings_panel">
                                <!-- a list of all constructions -->
                                <div style="text-align: center;">
                                    <a href="#constructs-toggle" id="constructs-toggle"><b>LIST OF CONSTRUCTIONS</b></a><br><br>
                                </div>

                                <div class="panel panel-warning">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('sentences')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                            <a data-toggle="collapse" data-parent="#accordion"
                                               href="#collapse_sentences">
                                                sentences
                                            </a>

                                        </h4>
                                    </div>
                                    <div id="collapse_sentences" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <br>
                                            <div class="panel panel-info">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('questions')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                                        <a data-toggle="collapse" data-parent="#accordion"
                                                           href="#collapse_questions">
                                                            questions
                                                        </a>

                                                    </h4>
                                                </div>

                                                <div id="collapse_questions" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-directQuestions" title="uncheck to exclude texts with this construct" checked>&nbsp;direct questions<br><span class="df" id="directQuestions-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="directQuestions-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-whQuestions" title="uncheck to exclude texts with this construct" checked>&nbsp;wh- questions
                                                            <br><span class="df" id="whQuestions-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="whQuestions-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-toDoQuestions" title="uncheck to exclude texts with this construct" checked>&nbsp;do- questions<br><span class="df" id="toDoQuestions-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="toDoQuestions-gradientSlider"></div>
                                                            </div>
                                                            <hr>
                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-toBeQuestions" title="uncheck to exclude texts with this construct" checked>&nbsp;be- questions<br><span class="df" id="toBeQuestions-df"></span>
                                                                <div class="ui-widget-content" style="width:80%;">
                                                                    <div class="gradientSlider" title="move right to rank texts with this construct higher" id="toBeQuestions-gradientSlider"></div>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-toHaveQuestions" title="uncheck to exclude texts with this construct" checked>&nbsp;have- questions<br><span class="df" id="toHaveQuestions-df"></span>
                                                                <div class="ui-widget-content" style="width:80%;">
                                                                    <div class="gradientSlider" title="move right to rank texts with this construct higher" id="toHaveQuestions-gradientSlider"></div>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-yesNoQuestions" title="uncheck to exclude texts with this construct" checked>&nbsp;yes/no questions<br><span class="df" id="yesNoQuestions-df"></span>
                                                                <div class="ui-widget-content" style="width:80%;">
                                                                    <div class="gradientSlider" title="move right to rank texts with this construct higher" id="yesNoQuestions-gradientSlider"></div>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-tagQuestions" title="uncheck to exclude texts with this construct" checked>&nbsp;tag questions<br><span class="df" id="tagQuestions-df"></span>
                                                                <div class="ui-widget-content" style="width:80%;">
                                                                    <div class="gradientSlider" title="move right to rank texts with this construct higher" id="tagQuestions-gradientSlider"></div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="panel panel-info">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('structure')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                                        <a data-toggle="collapse" data-parent="#accordion"
                                                           href="#collapse_structure">
                                                            sentence types
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse_structure" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-simpleSentence" title="uncheck to exclude texts with this construct" checked>&nbsp;simple <br><span class="df" id="simpleSentence-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="simpleSentence-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-compoundSentence" title="uncheck to exclude texts with this construct" checked>&nbsp;coordinate <br><span class="df" id="compoundSentence-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="compoundSentence-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-subordinateClause" title="uncheck to exclude texts with this construct" checked>&nbsp;subordinate <br><span class="df" id="subordinateClause-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="subordinateClause-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-incompleteSentence" title="uncheck to exclude texts with this construct" checked>&nbsp;incomplete sentences <br><span class="df" id="incompleteSentence-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="incompleteSentence-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="panel panel-info">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('clauses')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                                        <a data-toggle="collapse" data-parent="#accordion"
                                                           href="#collapse_clauses">
                                                            clause types
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse_clauses" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-relativeClause" title="uncheck to exclude texts with this construct" checked>&nbsp;relative<br><span class="df" id="relativeClause-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="relativeClause-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-adverbialClause" title="uncheck to exclude texts with this construct" checked>&nbsp;adverbial<br><span class="df" id="adverbialClause-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="adverbialClause-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-condReal" title="uncheck to exclude texts with this construct" checked>&nbsp;real conditional<br><span class="df" id="condReal-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="condReal-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-condUnreal" title="uncheck to exclude texts with this construct" checked>&nbsp;unreal conditional<br><span class="df" id="condUnreal-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="condUnreal-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-thereIsAre" title="uncheck to exclude texts with this construct" checked>&nbsp;there is/are <br><span class="df" id="thereIsAre-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="thereIsAre-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-thereWasWere" title="uncheck to exclude texts with this construct" checked>&nbsp;there was/were <br><span class="df" id="thereWasWere-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="thereWasWere-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-warning">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('pos')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                            <a data-toggle="collapse" data-parent="#accordion"
                                               href="#collapse_pos">
                                                parts of speech
                                            </a>

                                        </h4>
                                    </div>
                                    <div id="collapse_pos" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <br>
                                            <div class="panel panel-info">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('verbs')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                                        <a data-toggle="collapse" data-parent="#accordion"
                                                           href="#collapse_verbs">
                                                            verbs
                                                        </a>

                                                    </h4>
                                                </div>
                                                <div id="collapse_verbs" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <br>
                                                        <div class="panel panel-info success">
                                                            <div class="panel-heading">
                                                                <h4 class="panel-title">
                                                                    <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('verbForms')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                                                    <a data-toggle="collapse" data-parent="#accordion"
                                                                       href="#collapse_Forms">
                                                                        verb forms
                                                                    </a>
                                                                </h4>
                                                            </div>
                                                            <div id="collapse_Forms" class="panel-collapse collapse">
                                                                <div class="panel-body">
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-shortVerbForms" title="uncheck to exclude texts with this construct" checked>&nbsp;contracted (to be and to have: 'm, 's, 'd) <br><span class="df" id="shortVerbForms-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="shortVerbForms-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-longVerbForms" title="uncheck to exclude texts with this construct" checked>&nbsp;full (to be and to have: is, are, had) <br><span class="df" id="longVerbForms-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="longVerbForms-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-auxiliariesBeDoHave" title="uncheck to exclude texts with this construct" checked>&nbsp;auxiliaries (to be and to have: short and full forms) <br><span class="df" id="auxiliariesBeDoHave-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="auxiliariesBeDoHave-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-copularVerbs" title="uncheck to exclude texts with this construct" checked>&nbsp;copula (be, seem, look, stay, etc.: "She looks upset.") <br><span class="df" id="copularVerbs-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="copularVerbs-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-ingVerbForms" title="uncheck to exclude texts with this construct" checked>&nbsp;-ing (gerund and present participle) <br><span class="df" id="ingVerbForms-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="ingVerbForms-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-toInfinitiveForms" title="uncheck to exclude texts with this construct" checked>&nbsp;to- infinitive <br><span class="df" id="toInfinitiveForms-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="toInfinitiveForms-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-emphaticDo" title="uncheck to exclude texts with this construct" checked>&nbsp;emphatic do ("I did tell the truth") <br><span class="df" id="emphaticDo-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="emphaticDo-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-irregularVerbs" title="uncheck to exclude texts with this construct" checked>&nbsp;irregular (2nd and 3rd form) <br><span class="df" id="irregularVerbs-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="irregularVerbs-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-regularVerbs" title="uncheck to exclude texts with this construct" checked>&nbsp;regular (2nd and 3rd form) <br><span class="df" id="regularVerbs-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="regularVerbs-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="panel panel-info success">
                                                            <div class="panel-heading">
                                                                <h4 class="panel-title">
                                                                    <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('tenses')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                                                    <a data-toggle="collapse" data-parent="#accordion"
                                                                       href="#collapse_tenses">
                                                                        tenses
                                                                    </a>
                                                                </h4>
                                                            </div>
                                                            <div id="collapse_tenses" class="panel-collapse collapse">
                                                                <div class="panel-body">
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-presentSimple" title="uncheck to exclude texts with this construct" checked>&nbsp;Present Simple <br><span class="df" id="presentSimple-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="presentSimple-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-presentProgressive" title="uncheck to exclude texts with this construct" checked>&nbsp;Present Progressive <br><span class="df" id="presentProgressive-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="presentProgressive-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-pastSimple" title="uncheck to exclude texts with this construct" checked>&nbsp;Past Simple <br><span class="df" id="pastSimple-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="pastSimple-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-pastProgressive" title="uncheck to exclude texts with this construct" checked>&nbsp;Past Progressive <br><span class="df" id="pastProgressive-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="pastProgressive-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-futureSimple" title="uncheck to exclude texts with this construct" checked>&nbsp;Future Simple <br><span class="df" id="futureSimple-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="futureSimple-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-futureProgressive" title="uncheck to exclude texts with this construct" checked>&nbsp;Future Progressive <br><span class="df" id="futureProgressive-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="futureProgressive-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-presentPerfect" title="uncheck to exclude texts with this construct" checked>&nbsp;Present Perfect <br><span class="df" id="presentPerfect-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="presentPerfect-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-pastPerfect" title="uncheck to exclude texts with this construct" checked>&nbsp;Past Perfect <br><span class="df" id="pastPerfect-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="pastPerfect-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-futurePerfect" title="uncheck to exclude texts with this construct" checked>&nbsp;Future Perfect <br><span class="df" id="futurePerfect-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="futurePerfect-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-presentPerfProg" title="uncheck to exclude texts with this construct" checked>&nbsp;Present Perfect Progressive <br><span class="df" id="presentPerfProg-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="presentPerfProg-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-pastPerfProg" title="uncheck to exclude texts with this construct" checked>&nbsp;Past Perfect Progressive <br><span class="df" id="pastPerfProg-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="pastPerfProg-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-futurePerfProg" title="uncheck to exclude texts with this construct" checked>&nbsp;Future Perfect Progressive <br><span class="df" id="futurePerfProg-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="futurePerfProg-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="panel panel-info success">
                                                            <div class="panel-heading">
                                                                <h4 class="panel-title">
                                                                    <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('aspects')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                                                    <a data-toggle="collapse" data-parent="#accordion"
                                                                       href="#collapse_aspects">
                                                                        aspect
                                                                    </a>
                                                                </h4>
                                                            </div>
                                                            <div id="collapse_aspects" class="panel-collapse collapse">
                                                                <div class="panel-body">
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-simpleAspect" title="uncheck to exclude texts with this construct" checked>&nbsp;simple <br><span class="df" id="simpleAspect-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="simpleAspect-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-progressiveAspect" title="uncheck to exclude texts with this construct" checked>&nbsp;progressive <br><span class="df" id="progressiveAspect-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="progressiveAspect-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-perfectAspect" title="uncheck to exclude texts with this construct" checked>&nbsp;perfect <br><span class="df" id="perfectAspect-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="perfectAspect-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-perfProgAspect" title="uncheck to exclude texts with this construct" checked>&nbsp;perfect progressive <br><span class="df" id="perfProgAspect-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="perfProgAspect-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="panel panel-info success">
                                                            <div class="panel-heading">
                                                                <h4 class="panel-title">
                                                                    <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('times')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                                                    <a data-toggle="collapse" data-parent="#accordion"
                                                                       href="#collapse_times">
                                                                        time
                                                                    </a>
                                                                </h4>
                                                            </div>
                                                            <div id="collapse_times" class="panel-collapse collapse">
                                                                <div class="panel-body">
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-presentTime" title="uncheck to exclude texts with this construct" checked>&nbsp;present <br><span class="df" id="presentTime-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="presentTime-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-pastTime" title="uncheck to exclude texts with this construct" checked>&nbsp;past <br><span class="df" id="pastTime-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="pastTime-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-futureTime" title="uncheck to exclude texts with this construct" checked>&nbsp;future <br><span class="df" id="futureTime-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="futureTime-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="panel panel-info success">
                                                            <div class="panel-heading">
                                                                <h4 class="panel-title">
                                                                    <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('voice')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                                                    <a data-toggle="collapse" data-parent="#accordion"
                                                                       href="#collapse_voice">
                                                                        voice
                                                                    </a>
                                                                </h4>
                                                            </div>
                                                            <div id="collapse_voice" class="panel-collapse collapse">
                                                                <div class="panel-body">
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-passiveVoice" title="uncheck to exclude texts with this construct" checked>&nbsp;passive <br><span class="df" id="passiveVoice-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="passiveVoice-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <div class="panel panel-info success">
                                                            <div class="panel-heading">
                                                                <h4 class="panel-title">
                                                                    <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('phrasalVerbs')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                                                    <a data-toggle="collapse" data-parent="#accordion"
                                                                       href="#collapse_phrasalVerbs">
                                                                        phrasal
                                                                    </a>
                                                                </h4>
                                                            </div>
                                                            <div id="collapse_phrasalVerbs" class="panel-collapse collapse">
                                                                <div class="panel-body">
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-phrasalVerbs" title="uncheck to exclude texts with this construct" checked>&nbsp;phrasal verbs <br><span class="df" id="phrasalVerbs-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="phrasalVerbs-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <div class="panel panel-info success">
                                                            <div class="panel-heading">
                                                                <h4 class="panel-title">
                                                                    <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('modals')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                                                    <a data-toggle="collapse" data-parent="#accordion"
                                                                       href="#collapse_modals">
                                                                        modal
                                                                    </a>
                                                                </h4>
                                                            </div>
                                                            <div id="collapse_modals" class="panel-collapse collapse">
                                                                <div class="panel-body">
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-simpleModals" title="uncheck to exclude texts with this construct" checked>&nbsp;simple (can, must, need, may) <br><span class="df" id="simpleModals-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="simpleModals-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>


                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-advancedModals" title="uncheck to exclude texts with this construct" checked>&nbsp;advanced <br><span class="df" id="advancedModals-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="advancedModals-gradientSlider"></div>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>


                                                        <div class="panel panel-info success">
                                                            <div class="panel-heading">
                                                                <h4 class="panel-title">
                                                                    <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('transitive')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                                                    <a data-toggle="collapse" data-parent="#accordion"
                                                                       href="#collapse_transitive">
                                                                        transitive
                                                                    </a>
                                                                </h4>
                                                            </div>
                                                            <div id="collapse_transitive" class="panel-collapse collapse">
                                                                <div class="panel-body">
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-directObject" title="uncheck to exclude texts with this construct" checked>&nbsp;transitive (drive a car) <br><span class="df" id="directObject-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="directObject-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-indirectObject" title="uncheck to exclude texts with this construct" checked>&nbsp;ditransitive (give it to me) <br><span class="df" id="indirectObject-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="indirectObject-gradientSlider"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="panel panel-info success">
                                                            <div class="panel-heading">
                                                                <h4 class="panel-title">
                                                                    <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('imperative')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                                                    <a data-toggle="collapse" data-parent="#accordion"
                                                                       href="#collapse_imperative">
                                                                        imperatives
                                                                    </a>
                                                                </h4>
                                                            </div>
                                                            <div id="collapse_imperative" class="panel-collapse collapse">
                                                                <div class="panel-body">
                                                                    <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-imperatives" title="uncheck to exclude texts with this construct" checked>&nbsp;imperatives<br><span class="df" id="imperatives-df"></span>
                                                                        <div class="ui-widget-content" style="width:80%;">
                                                                            <div class="gradientSlider" title="move right to rank texts with this construct higher" id="imperatives-gradientSlider"></div>
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
                                                        <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('negation')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                                        <a data-toggle="collapse" data-parent="#accordion"
                                                           href="#collapse_negation">
                                                            negation
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse_negation" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-negAll" title="uncheck to exclude texts with this construct" checked>&nbsp;all negation (nothing, nowhere, no, etc.) <br><span class="df" id="negAll-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="negAll-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-partialNegation" title="uncheck to exclude texts with this construct" checked>&nbsp;partial negation (hardly, barely, scarcely, rarely, seldom) <br><span class="df" id="partialNegation-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="partialNegation-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-noNotNever" title="uncheck to exclude texts with this construct" checked>&nbsp;no, not, never <br><span class="df" id="noNotNever-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="noNotNever-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-not" title="uncheck to exclude texts with this construct" checked>&nbsp;not (full form) <br><span class="df" id="not-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="not-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-nt" title="uncheck to exclude texts with this construct" checked>&nbsp;n't (contracted form) <br><span class="df" id="nt-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="nt-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                    </div>
                                                </div>
                                            </div>



                                            <div class="panel panel-info">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('articles')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                                        <a data-toggle="collapse" data-parent="#accordion"
                                                           href="#collapse_articles">
                                                            articles
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse_articles" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-articles" title="uncheck to exclude texts with this construct" checked>&nbsp;all articles <br><span class="df" id="articles-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="articles-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-aArticle" title="uncheck to exclude texts with this construct" checked>&nbsp;a <br><span class="df" id="aArticle-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="aArticle-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-anArticle" title="uncheck to exclude texts with this construct" checked>&nbsp;an <br><span class="df" id="anArticle-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="anArticle-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-theArticle" title="uncheck to exclude texts with this construct" checked>&nbsp;the <br><span class="df" id="theArticle-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="theArticle-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel panel-info">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('quantifiers')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                                        <a data-toggle="collapse" data-parent="#accordion"
                                                           href="#collapse_quantifiers">
                                                            quantifiers
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse_quantifiers" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div class="panel-body">
                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-someDet" title="uncheck to exclude texts with this construct" checked>&nbsp;some <br><span class="df" id="someDet-df"></span>
                                                                <div class="ui-widget-content" style="width:80%;">
                                                                    <div class="gradientSlider" title="move right to rank texts with this construct higher" id="someDet-gradientSlider"></div>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-anyDet" title="uncheck to exclude texts with this construct" checked>&nbsp;any <br><span class="df" id="anyDet-df"></span>
                                                                <div class="ui-widget-content" style="width:80%;">
                                                                    <div class="gradientSlider" title="move right to rank texts with this construct higher" id="anyDet-gradientSlider"></div>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-muchDet" title="uncheck to exclude texts with this construct" checked>&nbsp;much <br><span class="df" id="muchDet-df"></span>
                                                                <div class="ui-widget-content" style="width:80%;">
                                                                    <div class="gradientSlider" title="move right to rank texts with this construct higher" id="muchDet-gradientSlider"></div>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-manyDet" title="uncheck to exclude texts with this construct" checked>&nbsp;many <br><span class="df" id="manyDet-df"></span>
                                                                <div class="ui-widget-content" style="width:80%;">
                                                                    <div class="gradientSlider" title="move right to rank texts with this construct higher" id="manyDet-gradientSlider"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="panel panel-info">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('adjectives')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                                        <a data-toggle="collapse" data-parent="#accordion"
                                                           href="#collapse_adjectives">
                                                            adjectives
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse_adjectives" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-positiveAdj" title="uncheck to exclude texts with this construct" checked>&nbsp;positive (nice) <br><span class="df" id="positiveAdj-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="positiveAdj-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-comparativeAdjShort" title="uncheck to exclude texts with this construct" checked>&nbsp;comparative short (nicer) <br><span class="df" id="comparativeAdjShort-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="comparativeAdjShort-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-superlativeAdjShort" title="uncheck to exclude texts with this construct" checked>&nbsp;superlative short (nicest) <br><span class="df" id="superlativeAdjShort-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="superlativeAdjShort-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-comparativeAdjLong" title="uncheck to exclude texts with this construct" checked>&nbsp;comparative long (more difficult) <br><span class="df" id="comparativeAdjLong-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="comparativeAdjLong-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-superlativeAdjLong" title="uncheck to exclude texts with this construct" checked>&nbsp;superlative long (most difficult) <br><span class="df" id="superlativeAdjLong-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="superlativeAdjLong-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>






                                            <div class="panel panel-info">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('adverbs')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                                        <a data-toggle="collapse" data-parent="#accordion"
                                                           href="#collapse_adverbs">
                                                            adverbs
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse_adverbs" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-positiveAdv" title="uncheck to exclude texts with this construct" checked>&nbsp;positive (fast) <br><span class="df" id="positiveAdv-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="positiveAdv-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-comparativeAdvShort" title="uncheck to exclude texts with this construct" checked>&nbsp;comparative short (faster) <br><span class="df" id="comparativeAdvShort-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="comparativeAdvShort-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-superlativeAdvShort" title="uncheck to exclude texts with this construct" checked>&nbsp;superlative short (fastest) <br><span class="df" id="superlativeAdvShort-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="superlativeAdvShort-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-comparativeAdvLong" title="uncheck to exclude texts with this construct" checked>&nbsp;comparative long (more easily) <br><span class="df" id="comparativeAdvLong-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="comparativeAdvLong-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-superlativeAdvLong" title="uncheck to exclude texts with this construct" checked>&nbsp;superlative long (most easily) <br><span class="df" id="superlativeAdvLong-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="superlativeAdvLong-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>








                                            <div class="panel panel-info">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('pronouns')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                                        <a data-toggle="collapse" data-parent="#accordion"
                                                           href="#collapse_pronouns">
                                                            pronouns
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse_pronouns" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-pronounsSubjective" title="uncheck to exclude texts with this construct" checked>&nbsp;subject (I) <br><span class="df" id="pronounsSubjective-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="pronounsSubjective-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-pronounsObjective" title="uncheck to exclude texts with this construct" checked>&nbsp;object (me)<br><span class="df" id="pronounsObjective-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="pronounsObjective-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-pronounsPossessive" title="uncheck to exclude texts with this construct" checked>&nbsp;possessive (my)<br><span class="df" id="pronounsPossessive-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="pronounsPossessive-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-pronounsPossessiveAbsolute" title="uncheck to exclude texts with this construct" checked>&nbsp;absolute possessive (mine)<br><span class="df" id="pronounsPossessiveAbsolute-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="pronounsPossessiveAbsolute-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-pronounsReflexive" title="uncheck to exclude texts with this construct" checked>&nbsp;reflexive (myself) <br><span class="df" id="pronounsReflexive-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="pronounsReflexive-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="panel panel-info">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('conjunctions')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                                        <a data-toggle="collapse" data-parent="#accordion"
                                                           href="#collapse_conjunctions">
                                                            conjunctions
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse_conjunctions" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-simpleConjunctions" title="uncheck to exclude texts with this construct" checked>&nbsp;simple <br> (and, or, but, because, so) <br><span class="df" id="simpleConjunctions-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="simpleConjunctions-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-advancedConjunctions" title="uncheck to exclude texts with this construct" checked>&nbsp;advanced <br> (therefore, until, besides, etc.) <br><span class="df" id="advancedConjunctions-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="advancedConjunctions-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="panel panel-info">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('prepositions')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                                        <a data-toggle="collapse" data-parent="#accordion"
                                                           href="#collapse_prepositions">
                                                            prepositions
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse_prepositions" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-simplePrepositions" title="uncheck to exclude texts with this construct" checked>&nbsp;simple <br>(at, on, in, to, with, after) <br><span class="df" id="simplePrepositions-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="simplePrepositions-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-complexPrepositions" title="uncheck to exclude texts with this construct" checked>&nbsp;advanced <br><span class="df" id="complexPrepositions-df"></span>
                                                            <div class="ui-widget-content" style="width:80%;">
                                                                <div class="gradientSlider" title="move right to rank texts with this construct higher" id="complexPrepositions-gradientSlider"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="panel panel-info">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <button type="button" class="close" style="font-size: 12px" onclick="FLAIR.WEBRANKER.UTIL.resetSlider('nouns')"><span class="glyphicon glyphicon-erase" title="reset"></span></button>
                                                        <a data-toggle="collapse" data-parent="#accordion"
                                                           href="#collapse_nouns">
                                                            nouns
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse_nouns" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div class="panel-body">
                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-pluralRegular" title="uncheck to exclude texts with this construct" checked>&nbsp;plural regular <br>(cars, flowers, etc.) <br><span class="df" id="pluralRegular-df"></span>
                                                                <div class="ui-widget-content" style="width:80%;">
                                                                    <div class="gradientSlider" title="move right to rank texts with this construct higher" id="pluralRegular-gradientSlider"></div>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-pluralIrregular" title="uncheck to exclude texts with this construct" checked>&nbsp;plural irregular <br>(children, women, etc.) <br><span class="df" id="pluralIrregular-df"></span>
                                                                <div class="ui-widget-content" style="width:80%;">
                                                                    <div class="gradientSlider" title="move right to rank texts with this construct higher" id="pluralIrregular-gradientSlider"></div>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div><input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleConstruction(this)" id="tgl-ingNounForms" title="uncheck to exclude texts with this construct" checked>&nbsp;-ing forms <br>(skiing, being, etc. ALSO building BUT NOT king, something) <br><span class="df" id="ingNounForms-df"></span>
                                                                <div class="ui-widget-content" style="width:80%;">
                                                                    <div class="gradientSlider" title="move right to rank texts with this construct higher" id="ingNounForms-gradientSlider"></div>
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
                                    <span class="glyphicon glyphicon-erase">&nbsp;</span><a href="javascript:FLAIR.WEBRANKER.singleton.resetAllSettingsAndFilters(true, true, true, true);" style="color:grey;">RESET ALL</a>
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
                
                <div class="row" style="margin-top: 1%; margin-bottom:1%">
            
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
                            <h3 class="modal-title">About FLAIR </h3>
                                                    <p><span style="color:darkorange"><b>by</b></span> <a href="http://sfs.uni-tuebingen.de/~mchnkina/" target="_blank">Maria Chinkina</a> <a href="mailto:maria.chinkina@uni-tuebingen.de?Subject=FLAIR%20tool" target="_top" title="write to Maria Chinkina"><span class="glyphicon glyphicon-envelope"></span></a> 
                            &
                            <a href="http://sfs.uni-tuebingen.de/~mkannan/" target="_blank">Madeeswaran Kannan</a> <a href="mailto:mkannan@sfs.uni-tuebingen.de?Subject=FLAIR%20tool" target="_top" title="write to Madeeswaran Kannan"><span class="glyphicon glyphicon-envelope"></span></a> supervised by 
                            <a href="http://sfs.uni-tuebingen.de/~dm/" target="_blank">Prof. Dr. Detmar Meurers</a> 
                            <br> <span style="color:darkorange">@</span> University of Tübingen, Germany <span style="color:darkorange">|</span> 2015-2016
			    <br> version 1.0
                        </p>
                        </center>
                    </div>
                    <div class="modal-body">
                        <div  style="text-align: center">
                            <p>FLAIR is an online tool for language teachers and learners that:
                            </p>
                            <ul   style="text-align: left">
                                <li>searches the web for a topic of interest </li>
                                <li>analyzes the results for grammatical constructions and readability levels </li>
                                <li>re-ranks the results according to your (pedagogical or learning) needs specified in the settings</li>
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

                        <p><b>PAPERS:</b></p>
                        <ul>
                            <li><a href="http://sfs.uni-tuebingen.de/~mchnkina/downloads/Chinkina_Maria_thesis_2015.pdf" target="_blank">MA thesis by Maria Chinkina</a></li>
                            <li><a href="http://sfs.uni-tuebingen.de/~mchnkina/downloads/Chinkina_Meurers_BEA_2016.pdf" target="_blank">BEA paper</a> (Maria Chinkina, Detmar Meurers)</li>
                            <li><a href="http://sfs.uni-tuebingen.de/~mchnkina/downloads/Chinkina_Kannan_Meurers_ACL_2016.pdf" target="_blank">System description paper</a> (Maria Chinkina, Madeeswaran Kannan, Detmar Meurers)</li>
                        </ul>
                        <br>
                        <p><b>ADDITIONAL MATERIAL:</b></p>
                        <ul>
                            <li><a href="http://sfs.uni-tuebingen.de/~mchnkina/downloads/FLAIR_Evaluation.pdf" target="_blank">Evaluation of the FLAIR algorithm</a> (81 grammatical constructions: Precision, Recall, F1)</li>
                            <li><a href="http://sfs.uni-tuebingen.de/~mchnkina/downloads/AWL.pdf" target="_blank">AWL: Academic Word List</a> (<a href="http://onlinelibrary.wiley.com/doi/10.2307/3587951/abstract" target="_blank">Coxhead, 2000</a>)</li>
                            <li><a href="http://sfs.uni-tuebingen.de/~mchnkina/img/heatmap_vert_color.png" target="_blank">Distribution of grammatical constructions in the Web</a> (top 55 hits for a query)</li>
                        </ul>
                        <br>
                        <p><b>Third-party tools:</b></p>
                        <ul>
                            <li>Back-end: <a href="http://datamarket.azure.com/dataset/bing/search" target="_blank">Microsoft Bing API</a> (<a href="https://github.com/peculater/azure-bing-search-java" target="_blank">Java implementation</a>), <a href="https://github.com/kohlschutter/boilerpipe" target="_blank">Boilerpipe</a>, <a href="http://stanfordnlp.github.io/CoreNLP/" target="_blank">Stanford CoreNLP</a></li>
                            <li>Front-end: <a href="http://getbootstrap.com" target="_blank">Bootstrap</a>, <a href="http://glyphicons.com/" target="_blank">Glyphicons</a>, <a href="https://d3js.org" target="_blank">d3</a></li>
                        </ul>
                        <br>
                        <p><b>LICENSE:</b> </p>
                        <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br/>FLAIR tool is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.
                    </div>
                    <div class="modal-footer">
                        <center>
                            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="">CLOSE</button>
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

                        <label class="close" data-toggle="popover" data-placement="auto left" data-content="<br><br><br><ul><li><b>select ranges</b> by dragging the pointers up and down </li><br><li> <b>change the order of axes</b> by dragging them left and right </li><br><li> <b>add or remove axes</b> via checkboxes on the right </li></ul>"><span class="glyphicon glyphicon-question-sign" aria-hidden="true">&nbsp;</span></label>
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
                                            <a href="javascript:FLAIR.WEBRANKER.singleton.resetAllSettingsAndFilters(true, false, true, true);" style="color:grey;">RESET ALL <span class="glyphicon glyphicon-erase" title="reset"></span></a>

                                        </div>
                                        <table class="table table-hover table-condensed">
                                            <tbody>
                                                <tr class="active">
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="document-def-vis" checked>
                                                        result
                                                    </td>
                                                </tr>
                                                <tr class="active">
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="words-def-vis" checked>
                                                        # of words
                                                    </td>
                                                </tr>
                                                <tr class="active">
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="sentences-def-vis">
                                                        # of sentences
                                                    </td>
                                                </tr>
                                                <tr class="active">
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="score-def-vis">
                                                        complexity
                                                    </td>
                                                </tr>
                                                <tr><td></td></tr>
                                                <tr class="warning">
                                                    <td>
                                                        SENTENCES
                                                    </td>

                                                </tr>

                                                <tr class="info">
                                                    <td>
                                                        SENTENCES&nbsp;&nbsp;>&nbsp;&nbsp;Questions
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="directQuestions-vis">
                                                        all questions
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="whQuestions-vis">
                                                        wh- questions
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="toDoQuestions-vis">
                                                        do- questions
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="toBeQuestions-vis">
                                                        be- questions
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="toHaveQuestions-vis">
                                                        have- questions
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="yesNoQuestions-vis">
                                                        yes/no questions
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="tagQuestions-vis">
                                                        tag questions
                                                    </td>

                                                </tr>

                                                <tr class="info">
                                                    <td>
                                                        SENTENCES&nbsp;&nbsp;>&nbsp;&nbsp;Sentence types
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="simpleSentence-vis">
                                                        simple
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="compoundSentence-vis">
                                                        coordinate
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="subordinateClause-vis">
                                                        subordinate
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="incompleteSentence-vis">
                                                        incomplete
                                                    </td>

                                                </tr>

                                                <tr class="info">
                                                    <td>
                                                        SENTENCES&nbsp;&nbsp;>&nbsp;&nbsp;Clause types
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="relativeClause-vis">
                                                        relative
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="adverbialClause-vis">
                                                        adverbial
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="condReal-vis">
                                                        real conditional (0, I)
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="condUnreal-vis">
                                                        unreal conditional (II, III)
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="thereIsAre-vis">
                                                        there is/are
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="thereWasWere-vis">
                                                        there was/were
                                                    </td>

                                                </tr>
                                                <tr><td></td></tr>
                                                <tr class="warning">
                                                    <td>
                                                        PARTS OF SPEECH
                                                    </td>

                                                </tr>
                                                <tr class="info">
                                                    <td>
                                                        PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Verbs
                                                    </td>

                                                </tr>
                                                <tr class="success">
                                                    <td>
                                                        PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Verbs&nbsp;&nbsp;>&nbsp;&nbsp;verb forms
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="shortVerbForms-vis">
                                                        contracted (be, have)
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="longVerbForms-vis">
                                                        full (be, have)
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="auxiliariesBeDoHave-vis">
                                                        auxiliaries (be, have)
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="copularVerbs-vis">
                                                        copula (be, seem, look, etc.)
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="ingVerbForms-vis">
                                                        -ing forms (gerund, present participle)
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="toInfinitiveForms-vis">
                                                        to- infinitive
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="emphaticDo-vis">
                                                        emphatic "do"
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="irregularVerbs-vis">
                                                        irregular verbs (2nd, 3rd form)
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="regularVerbs-vis">
                                                        regular verbs (2nd, 3rd form)
                                                    </td>

                                                </tr>

                                                <tr class="success">
                                                    <td>
                                                        PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Verbs&nbsp;&nbsp;>&nbsp;&nbsp;tenses
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="presentSimple-vis">
                                                        Present Simple
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="presentProgressive-vis">
                                                        Present Progressive
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="pastSimple-vis">
                                                        Past Simple
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="pastProgressive-vis">
                                                        Past Progressive
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="futureSimple-vis">
                                                        Future Simple
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="futureProgressive-vis">
                                                        Future Progressive
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="presentPerfect-vis">
                                                        Present Perfect
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="pastPerfect-vis">
                                                        Past Perfect
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="futurePerfect-vis">
                                                        Future Perfect
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="presentPerfProg-vis">
                                                        Present Perfect Progressive
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="pastPerfProg-vis">
                                                        Past Perfect Progressive
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="futurePerfProg-vis">
                                                        Future Perfect Progressive
                                                    </td>

                                                </tr>

                                                <tr class="success">
                                                    <td>
                                                        PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Verbs&nbsp;&nbsp;>&nbsp;&nbsp;aspect
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="simpleAspect-vis">
                                                        simple
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="progressiveAspect-vis">
                                                        progressive
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="perfectAspect-vis">
                                                        perfect
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="perfProgAspect-vis">
                                                        perfect progressive
                                                    </td>

                                                </tr>

                                                <tr class="success">
                                                    <td>
                                                        PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Verbs&nbsp;&nbsp;>&nbsp;&nbsp;time
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="presentTime-vis">
                                                        present
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="pastTime-vis">
                                                        past
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="futureTime-vis">
                                                        future
                                                    </td>

                                                </tr>

                                                <tr class="success">
                                                    <td>
                                                        PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Verbs&nbsp;&nbsp;>&nbsp;&nbsp;voice
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="passiveVoice-vis">
                                                        passive
                                                    </td>

                                                </tr>

                                                <tr class="success">
                                                    <td>
                                                        PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Verbs&nbsp;&nbsp;>&nbsp;&nbsp;phrasal
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="phrasalVerbs-vis">
                                                        phrasal
                                                    </td>

                                                </tr>

                                                <tr class="success">
                                                    <td>
                                                        PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Verbs&nbsp;&nbsp;>&nbsp;&nbsp;modal
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="simpleModals-vis">
                                                        simple
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="advancedModals-vis">
                                                        advanced
                                                    </td>

                                                </tr>

                                                <tr class="success">
                                                    <td>
                                                        PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Verbs&nbsp;&nbsp;>&nbsp;&nbsp;transitive
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="directObject-vis">
                                                        transitive
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="indirectObject-vis">
                                                        ditransitive
                                                    </td>

                                                </tr>

                                                <tr class="success">
                                                    <td>
                                                        PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Verbs&nbsp;&nbsp;>&nbsp;&nbsp;imperatives
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="imperatives-vis">
                                                        imperatives
                                                    </td>

                                                </tr>


                                                <tr class="info">
                                                    <td>
                                                        PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Negation
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="negAll-vis">
                                                        full 
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="partialNegation-vis">
                                                        partial 
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="noNotNever-vis">
                                                        no, not, never
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="not-vis">
                                                        not (full form)
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="nt-vis">
                                                        n't (contracted form)
                                                    </td>

                                                </tr>

                                                <tr class="info">
                                                    <td>
                                                        PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Articles
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="articles-vis">
                                                        all 
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="aArticle-vis">
                                                        a
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="anArticle-vis">
                                                        an
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="theArticle-vis">
                                                        the
                                                    </td>

                                                </tr>

                                                <tr class="info">
                                                    <td>
                                                        PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Quantifiers
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="someDet-vis">
                                                        some
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="anyDet-vis">
                                                        any
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="muchDet-vis">
                                                        much
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="manyDet-vis">
                                                        many
                                                    </td>

                                                </tr>

                                                <tr class="info">
                                                    <td>
                                                        PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Adjectives
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="positiveAdj-vis">
                                                        positive
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="comparativeAdjShort-vis">
                                                        comparative short
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="superlativeAdjShort-vis">
                                                        superlative short
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="comparativeAdjLong-vis">
                                                        comparative long
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="superlativeAdjLong-vis">
                                                        superlative long
                                                    </td>

                                                </tr>

                                                <tr class="info">
                                                    <td>
                                                        PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Adverbs
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="positiveAdv-vis">
                                                        positive
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="comparativeAdvShort-vis">
                                                        comparative short
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="superlativeAdvShort-vis">
                                                        superlative short
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="comparativeAdvLong-vis">
                                                        comparative long
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="superlativeAdvLong-vis">
                                                        superlative long
                                                    </td>

                                                </tr>

                                                <tr class="info">
                                                    <td>
                                                        PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Pronouns
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="pronounsSubjective-vis">
                                                        subjective 
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="pronounsObjective-vis">
                                                        objective 
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="pronounsPossessive-vis">
                                                        possessive 
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="pronounsPossessiveAbsolute-vis">
                                                        absolute possessive
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="pronounsReflexive-vis">
                                                        reflexive 
                                                    </td>

                                                </tr>

                                                <tr class="info">
                                                    <td>
                                                        PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Conjunctions
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="simpleConjunctions-vis">
                                                        simple 
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="advancedConjunctions-vis">
                                                        advanced
                                                    </td>

                                                </tr>

                                                <tr class="info">
                                                    <td>
                                                        PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Prepositions
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="simplePrepositions-vis">
                                                        simple
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="complexPrepositions-vis">
                                                        advanced
                                                    </td>

                                                </tr>

                                                <tr class="info">
                                                    <td>
                                                        PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Nouns
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="pluralRegular-vis">
                                                        plural regular 
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="pluralIrregular-vis">
                                                        plural irregular
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="construct"> <input type="checkbox" onclick="FLAIR.WEBRANKER.singleton.toggleVisualiserAxis(this)" title="check/uncheck to add/remove an axis" id="ingNounForms-vis">
                                                        -ing forms
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
                            <button type="button" class="btn btn-primary" onclick="FLAIR.WEBRANKER.singleton.applyVisualiserFilter()">Apply</button>
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
                                <p>Please wait while we process your meat...</p>
                            </div>
                        </div>
                    </center>
                    <div class="modal-footer">
                        <div style="text-align: center;">
                            <button type="button" class="btn btn-primary" id="modal_waitIdle_buttonYes">Yes</button>
                            <button type="button" class="btn btn-primary" id="modal_waitIdle_buttonNo">No</button>
                            <button type="button" class="btn btn-primary" id="modal_waitIdle_buttonCancel">Cancel</button>
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
                        <h4 class="modal-title" style="text-align: center;">List Of Constructions</h4>
                    </div>
                    <div class="modal-body">
                        <div class="tab-pane fade active in">
                            <div id="list_of_constructs" class="pre-scrollable">
                                <table class="table table-hover">
                                    <tbody>
                                        <tr class="warning">
                                            <td>
                                                SENTENCES
                                            </td>
                                            <td>

                                            </td>
                                        </tr>

                                        <tr class="info">
                                            <td>
                                                SENTENCES&nbsp;&nbsp;>&nbsp;&nbsp;Questions
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                all questions
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                wh- questions
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                do- questions
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                be- questions
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                have- questions
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                yes/no questions
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                tag questions
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>

                                        <tr class="info">
                                            <td>
                                                SENTENCES&nbsp;&nbsp;>&nbsp;&nbsp;Sentence types
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
                                                coordinate
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                subordinate
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                incomplete
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>

                                        <tr class="info">
                                            <td>
                                                SENTENCES&nbsp;&nbsp;>&nbsp;&nbsp;Clause types
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                relative
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
                                                real conditional (0, I)
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                unreal conditional (II, III)
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                there is/are
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                there was/were
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br><br>
                                <table class="table table-hover">
                                    <tbody>
                                        <tr class="warning">
                                            <td>
                                                PARTS OF SPEECH
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="info">
                                            <td>
                                                PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Verbs
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="success">
                                            <td>
                                                PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Verbs&nbsp;&nbsp;>&nbsp;&nbsp;verb forms
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                contracted (be, have)
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                full (be, have)
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                auxiliaries (be, have)
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                copula (be, seem, look, etc.)
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                -ing forms (gerund, present participle)
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                to- infinitive
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
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
                                        </tr>

                                        <tr class="success">
                                            <td>
                                                PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Verbs&nbsp;&nbsp;>&nbsp;&nbsp;tenses
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Present Simple
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Present Progressive
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
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Past Progressive
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Future Simple
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Future Progressive
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Present Perfect
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Past Perfect
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Future Perfect
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Present Perfect Progressive
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Past Perfect Progressive
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                Future Perfect Progressive
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>

                                        <tr class="success">
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
                                        </tr>

                                        <tr class="success">
                                            <td>
                                                PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Verbs&nbsp;&nbsp;>&nbsp;&nbsp;time
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                present
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                past
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                future
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>

                                        <tr class="success">
                                            <td>
                                                PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Verbs&nbsp;&nbsp;>&nbsp;&nbsp;voice
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                passive
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>

                                        <tr class="success">
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
                                        </tr>

                                        <tr class="success">
                                            <td>
                                                PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Verbs&nbsp;&nbsp;>&nbsp;&nbsp;modal
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
                                        </tr>

                                        <tr class="success">
                                            <td>
                                                PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Verbs&nbsp;&nbsp;>&nbsp;&nbsp;transitive
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                transitive
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                ditransitive
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>

                                        <tr class="success">
                                            <td>
                                                PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Verbs&nbsp;&nbsp;>&nbsp;&nbsp;imperatives
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                imperatives
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>


                                        <tr class="info">
                                            <td>
                                                PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Negation
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                full 
                                            </td>
                                            <td class="example">
                                                nothing, nowhere, no, etc.
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                partial 
                                            </td>
                                            <td class="example">
                                                hardly, barely, rarely, seldom, etc.
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                no, not, never
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
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
                                        </tr>

                                        <tr class="info">
                                            <td>
                                                PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Articles
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                all 
                                            </td>
                                            <td class="example">
                                                a, an, the
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                a
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                an
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                the
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>

                                        <tr class="info">
                                            <td>
                                                PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Quantifiers
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                some
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                any
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                much
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                many
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>

                                        <tr class="info">
                                            <td>
                                                PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Adjectives
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                positive
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                comparative short
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                superlative short
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
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
                                        </tr>

                                        <tr class="info">
                                            <td>
                                                PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Adverbs
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                positive
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                comparative short
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                superlative short
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
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
                                        </tr>

                                        <tr class="info">
                                            <td>
                                                PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Pronouns
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                subjective 
                                            </td>
                                            <td class="example">
                                                I
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                objective 
                                            </td>
                                            <td class="example">
                                                me
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                possessive 
                                            </td>
                                            <td class="example">
                                                my
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                absolute possessive
                                            </td>
                                            <td class="example">
                                                mine
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                reflexive 
                                            </td>
                                            <td class="example">
                                                myself
                                            </td>
                                        </tr>

                                        <tr class="info">
                                            <td>
                                                PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Conjunctions
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                simple 
                                            </td>
                                            <td class="example">
                                                and, or, but, because, so
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                advanced
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>

                                        <tr class="info">
                                            <td>
                                                PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Prepositions
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                simple
                                            </td>
                                            <td class="example">
                                                at, on, in, to, with, after
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                advanced
                                            </td>
                                            <td class="example">

                                            </td>
                                        </tr>

                                        <tr class="info">
                                            <td>
                                                PARTS OF SPEECH&nbsp;&nbsp;>&nbsp;&nbsp;Nouns
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                plural regular 
                                            </td>
                                            <td class="example">
                                                cars, flowers, etc.
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                plural irregular
                                            </td>
                                            <td class="example">
                                                children, women, etc.
                                            </td>
                                        </tr>
                                        <tr class="simple_row">
                                            <td class="construct">
                                                -ing forms
                                            </td>
                                            <td class="example">
                                                skiing, building, etc. BUT NOT! king, something
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
                        <h4 class="modal-title">Export Settings</h4>
                    </div>
                    <div class="modal-body">
                        <div class="tab-pane fade active in" id="modal_ExportSettings_body">
                            <div class="input-group">
                                <div class="input-group-addon">URL</div>
                                <input class="form-control" id="exported_settings_url" readonly>
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button" onclick="FLAIR.WEBRANKER.UTIL.copyToClipboard('#exported_settings_url')">Copy</button>
                                </span>
                            </div>
                        </div>
                        <div class="modal-footer"  style="text-align: center;">
                            You can use this link to apply your current settings to further searches<br/>or share the link with students so they can use the web search with your settings.
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
                        <h4 class="modal-title">Edit Custom Vocabulary</h4>
                    </div>
		    <div hidden>
			<input id="modalCustomVocab-fileSelect" type="file"/>
		    </div>
                    <div class="modal-body">
                        <div class="tab-pane fade active in" id="modal_CustomVocab_body">
                            <div class="form-group">
                                <label>Custom Vocabulary:</label>
                                <textarea class="form-control" rows="10" id="custom_vocab_textarea"></textarea><br/>
				Words may be separated by commas, spaces or line breaks.
                            </div>
                        </div>
                        <div class="modal-footer" style="text-align: center;">
                            <button type="button" class="btn btn-primary" id="modal_customVocab_buttonYes">Apply</button>
                            <button type="button" class="btn btn-primary" id="modal_customVocab_buttonCancel">Cancel</button>
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
                        <h4 class="modal-title">Upload Custom Corpus</h4>
                    </div>
		    
		    <form id="modal_CustomCorpus_MainForm" action="CustomCorpusServlet" method="post" enctype="multipart/form-data" target="modal_CustomCorpus_dummyTarget">
			<div class="modal-body">
			    <div class="tab-pane fade active in">
				<div class="form-group" style="text-align: center;">
				    <div hidden>
					<input id="modal_CustomCorpus_fileSelect" type="file" name="file" multiple accept=".txt"/>
				    </div>
				    <button type="button" class="btn btn-info btn-lg" id="modal_CustomCorpus_buttonSelectFiles">Select Files</button>
				    <br/><br/>
				    You can upload text files for analysis.
				</div>
			    </div>
			</div>
			<div class="modal-footer"  style="text-align: center;">
			    <input type="submit" class="btn btn-primary" value="Upload" onclick="FLAIR.WEBRANKER.singleton.uploadCustomCorpus();">
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
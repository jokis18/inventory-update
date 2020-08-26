<?php
if ( !defined('INCLUDED') ) { die("Access Denied"); }

?><?php if (($member_active == 'Active' || substr(strrchr($_SERVER['PHP_SELF'], '/'), 1) != "index.php") AND 1==2 /*AND $setts['default_theme'] != 'blue'*/) { ; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<title><?php echo $page_title;?></title>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo LANG_CODEPAGE;?>">
<meta name="viewport" content="width=device-width, initial-scale=1">

<?php echo $page_meta_tags;?>
<link href="themes/<?php echo $setts['default_theme'];?>/style.css" rel="stylesheet" type="text/css">
<link href="themes/<?php echo $setts['default_theme'];?>/main_fl.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.lb {
  background-image:  url(themes/<?php echo $setts['default_theme'];?>/img/lb_bg.gif);
}
.db {
  background-image:  url(themes/<?php echo $setts['default_theme'];?>/img/db_bg.gif);
}
<?php if (substr(strrchr($_SERVER['PHP_SELF'],'/'),1)=="register.php"){ echo ".main_table {  width:930px; float:left; margin-left:10px}";} ?>

<?php if (substr(strrchr($_SERVER['PHP_SELF'],'/'),1)=="categories.php"){ echo ".main_table { width:97%; margin-left:20px; margin-right:20px}";} ?>
<?php if (substr(strrchr($_SERVER['PHP_SELF'],'/'),1)=="auction_search.php"){ echo ".main_table { width:97%; margin-left:20px; margin-right:20px}";} ?>
-->
</style>
<script language="javascript" src="themes/<?php echo $setts['default_theme'];?>/main.js" type="text/javascript"></script>
<script type="text/javascript" src="themes/<?php echo $setts['default_theme'];?>/countdownpro.js" defer="defer"></script>
<?php
for ($i=1; $i<50; $i++){
?><meta scheme="countdown<?php echo $i;?>" name="event_msg" content="CLOSED"><?php
}
?>
<script language=JavaScript src='scripts/innovaeditor.js'></script>
<script type="text/javascript">
var currenttime = '<?php echo $current_time_display;?>';
var serverdate=new Date(currenttime);

function padlength(what){
  var output=(what.toString().length==1)? "0"+what : what;
  return output;
}

function displaytime(){
  serverdate.setSeconds(serverdate.getSeconds()+1)
  var timestring=padlength(serverdate.getHours())+":"+padlength(serverdate.getMinutes())+":"+padlength(serverdate.getSeconds());
  document.getElementById("servertime").innerHTML=timestring;
}

window.onload=function(){
  setInterval("displaytime()", 1000);
}

</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="main_table">
<tr>
   <td>

   <table width="100%" border="0" cellpadding="0" cellspacing="0">
         <tr valign="bottom">
            <td valign="bottom" style="width:5%"><div style="float:left"><a href="<?php echo $index_link;?>"><img src="images/myphpauction.gif?<?php echo rand(2,9999);?>" alt="" vspace="4" border="0"></a></div>
      </td>
            <td width="30%" valign="bottom" style="padding-bottom:5px">Welcome, <?php if ($member_active == 'Active'){ ; ?> <?php echo $member_username; ?> (<a href="<?php echo $login_link;?>"><?php echo $login_btn_msg;?></a>) <?php } else { ; ?><a href="login.php">Sign in</a> or <a href="register.php">register</a><?php } ?>
       </td>
            <td valign="top">




              <div class="toplink" style=" float:right;<?php if (substr(strrchr($_SERVER['PHP_SELF'],'/'),1)=="register.php"){ echo "display:none";} ?> <?php if (substr(strrchr($_SERVER['PHP_SELF'],'/'),1)=="login.php"){ echo "display:none";} ?>"> <!--!!!!!!!!!!!!without right menu-->
        <div class="nav_r">
          <div class="nav_l">
            <div class="nav">
              <div>


              <table cellspacing="0" cellpadding="0" border="0">
              <tbody><tr align="center">

       <td nowrap class="mainmenu">&nbsp;<a  style="color:#000000" href="<?php echo $place_ad_link;?>"><?php echo $place_ad_btn_msg;?></a>&nbsp;</td>



              <td nowrap="" class="mainmenu" style="display:none"><a style="color:#000000" href="<?php echo $index_link;?>"><?php echo MSG_BTN_HOME;?></a></td>
              <td nowrap="" class="mainmenu"><a style="color:#000000" href="<?php echo process_link('content_pages', array('page' => 'faq'));?>"><?php echo MSG_BTN_FAQ;?></a>   <?php if ($layout['is_about']) { ?></td>
              <td nowrap="" class="mainmenu"><a style="color:#000000" href="<?php echo process_link('content_pages', array('page' => 'about_us'));?>"><?php echo MSG_BTN_ABOUT_US;?></a><?php } ?><?php if ($layout['is_contact']) { ?></td>

             <td nowrap class="mainmenu" style=" border-right:none">&nbsp;<a style="color:#000000" href="<?php echo process_link('content_pages', array('page' => 'help'));?>"><?php echo MSG_BTN_HELP;?></a>&nbsp;</td>
             </tr>
          </tbody></table>

              <div style="float:right; margin-top:10px; font-weight:400">
              <a style="color:#0000CC;"href="<?php echo process_link('content_pages', array('page' => 'contact_us'));?>"><?php echo MSG_BTN_CONTACT_US;?></a><?php } ?>
              </div>

              <?php /*?>
                    <a href="<?php echo $index_link;?>"><?php echo MSG_BTN_HOME;?></a> | <a href="<?php echo process_link('content_pages', array('page' => 'faq'));?>"><?php echo MSG_BTN_FAQ;?></a>   <?php if ($layout['is_about']) { ?> | <a href="<?php echo process_link('content_pages', array('page' => 'about_us'));?>"><?php echo MSG_BTN_ABOUT_US;?></a><?php } ?><?php if ($layout['is_contact']) { ?> | <a href="<?php echo process_link('content_pages', array('page' => 'contact_us'));?>"><?php echo MSG_BTN_CONTACT_US;?></a><?php } ?>
              <?php */?>
              </div>
            </div>
          </div>
        </div>
                </div>


        <div style="float:right; background:url(themes/<?php echo $setts['default_theme'];?>/images/imgHdrMainNavSearchRgt2.gif) bottom right no-repeat; margin-right:10px; <?php if (substr(strrchr($_SERVER['PHP_SELF'],'/'),1)=="auction_details.php"){ echo " ";} else { echo "display:none";}?> ">
        <div style="float:right; background:url(themes/<?php echo $setts['default_theme'];?>/images/imgHdrMainNavSearchLft2.gif) bottom left no-repeat; padding:3px 10px">

        <form action="auction_search.php" method="post">
        <input type="hidden" name="option" value="basic_search">
        <input type="text" size="15" name="basic_search" maxlength="300" style="width:120px">
        <input name="form_basic_search" type="submit" value="<?php echo GMSG_SEARCH;?>">
              </form>

        </div></div>

       </td>
         </tr>
     </table>

    <div class="srchBox_r">
    <div class="srchBox_l">
    <div class="srchBox" style="<?php if (substr(strrchr($_SERVER['PHP_SELF'],'/'),1)=="register.php"){ echo "display:none";} ?> <?php if (substr(strrchr($_SERVER['PHP_SELF'],'/'),1)=="login.php"){ echo "display:none";} ?> <?php if (substr(strrchr($_SERVER['PHP_SELF'],'/'),1)=="auction_details.php"){ echo "display:none";} ?> "><!--without search-->
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
         <tr>
        <form action="auction_search.php" method="post">
        <input type="hidden" name="option" value="basic_search">

            <td class="search" nowrap width="230"><input type="text" size="25" name="basic_search" maxlength="300" style="width:380px">&nbsp;&nbsp;&nbsp;</td>
      <td class="search" nowrap width="100"><input name="form_basic_search" type="submit" value="<?php echo GMSG_SEARCH;?>">&nbsp;&nbsp;&nbsp;</td>
              </form>
            <td class="search" nowrap width="50">&nbsp;&nbsp;&nbsp;<?php echo GMSG_BROWSE;?>&nbsp;&nbsp;</td>
        <form name="cat_browse_form" method="get" action="categories.php">
            <td class="search"><?php echo $categories_browse_box;?></td>
        </form>
      <td nowrap align="right" class="search" width="200">&nbsp;&nbsp;&nbsp;<?php echo $current_date;?> <span id="servertime"></span>&nbsp;&nbsp;&nbsp;</td>
            <!--<?php if ($setts['user_lang']) { ?>
            <td nowrap align="center">&nbsp;&nbsp;<?php echo $languages_list;?>&nbsp;&nbsp;</td>
            <?php } ?>-->
         </tr>
      </table>
    </div></div></div>
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
      <tr>
      <td class="brnd1"></td>
      <td class="brnd2"></td>
      <td class="brnd3"></td>
      <td class="brnd4"></td>
      <td class="brnd5"></td>
      <td class="brnd6"></td>
      <td class="brnd7"></td>
    </tr>
    <tr>
      <td class="brnd8"></td>
      <td class="brnd8"></td>
      <td class="brnd8"></td>
      <td class="brnd8"></td>
      <td class="brnd8"></td>
      <td class="brnd8"></td>
      <td class="brnd8"></td>
    </tr>
     </table>
      <div class="nav_r">
    <div class="nav_l">
    <div class="nav" style="<?php if (substr(strrchr($_SERVER['PHP_SELF'],'/'),1)=="register.php"){ echo "display:none";} ?> <?php if (substr(strrchr($_SERVER['PHP_SELF'],'/'),1)=="login.php"){ echo "display:none";} ?>  "> <!--!!!!!!!!!!!!!without menu-->
    <table border="0" cellspacing="0" cellpadding="0">
      <tr align="center">
       <?php if (eregi("index.php",$_SERVER['PHP_SELF'])) { ?>
       <td nowrap class="mainmenu">&nbsp;<a href="<?php echo $index_link;?>"><?php echo MSG_BTN_HOME;?></a>&nbsp;</td>
       <?php } else {?>
       <td nowrap class="mainmenu">&nbsp;<a href="<?php echo $index_link;?>"><?php echo MSG_BTN_HOME;?></a>&nbsp;</td>
       <?php }
         if (!$setts['enable_private_site'] || $is_seller)  {
            if (eregi("sell_item.php",$_SERVER['PHP_SELF'])) { ?>
       <td nowrap class="mainmenu"style="display:none">&nbsp;<a href="<?php echo $place_ad_link;?>"><?php echo $place_ad_btn_msg;?></a>&nbsp;</td>
       <?php } else { ?>
       <td nowrap class="mainmenu"style="display:none">&nbsp;<a href="<?php echo $place_ad_link;?>"><?php echo $place_ad_btn_msg;?></a>&nbsp;</td>
       <?php }
          }
        if (eregi("members_area.php",$_SERVER['PHP_SELF'])||eregi("register.php",$_SERVER['PHP_SELF'])) { ?>
       <td nowrap class="mainmenu">&nbsp;<a href="<?php echo $register_link;?>"><?php echo $register_btn_msg;?></a>&nbsp;</td>
       <?php } else { ?>
       <td nowrap class="mainmenu" style="display:none">&nbsp;<a href="<?php echo $register_link;?>"><?php echo $register_btn_msg;?></a>&nbsp;</td>
       <?php } if (eregi("login.php",$_SERVER['PHP_SELF'])) { ?>
       <td nowrap class="mainmenu"style="display:none">&nbsp;<a href="<?php echo $login_link;?>"><?php echo $login_btn_msg;?></a>&nbsp;</td>
       <?php } else { ?>
       <td nowrap class="mainmenu"style="display:none">&nbsp;<a href="<?php echo $login_link;?>"><?php echo $login_btn_msg;?></a>&nbsp;</td>
       <?php }  if ($setts['enable_stores']) {
            if (eregi("stores.php",$_SERVER['PHP_SELF'])) { ?>
       <td nowrap class="mainmenu">&nbsp;<a href="<?php echo process_link('stores');?>"><?php echo MSG_BTN_STORES;?></a>&nbsp;</td>
       <?php } else { ?>
       <td nowrap class="mainmenu">&nbsp;<a href="<?php echo process_link('stores');?>"><?php echo MSG_BTN_STORES;?></a>&nbsp;</td>
       <?php } }
          if ($setts['enable_wanted_ads']) {
            if (eregi("wanted_ads.php",$_SERVER['PHP_SELF'])) { ?>
       <td nowrap class="mainmenu">&nbsp;<a href="<?php echo process_link('wanted_ads');?>"><?php echo MSG_BTN_WANTED_ADS;?></a>&nbsp;</td>
       <?php } else { ?>
       <td nowrap class="mainmenu">&nbsp;<a href="<?php echo process_link('wanted_ads');?>"><?php echo MSG_BTN_WANTED_ADS;?></a>&nbsp;</td>
       <?php }
          }
          if ($_REQUEST['page']=='help') { ?>
       <td nowrap class="mainmenu" style="display:none">&nbsp;<a href="<?php echo process_link('content_pages', array('page' => 'help'));?>"><?php echo MSG_BTN_HELP;?></a>&nbsp;</td>
       <?php } else { ?>
       <td nowrap class="mainmenu" style="display:none">&nbsp;<a href="<?php echo process_link('content_pages', array('page' => 'help'));?>"><?php echo MSG_BTN_HELP;?></a>&nbsp;</td>
       <?php }
        if (eregi("site_fees.php",$_SERVER['PHP_SELF'])) { ?>
       <td nowrap class="mainmenu">&nbsp;<a href="<?php echo process_link('site_fees');?>"><?php echo MSG_BTN_SITE_FEES;?></a>&nbsp;</td>
       <?php } else { ?>
       <td nowrap class="mainmenu">&nbsp;<a href="<?php echo process_link('site_fees');?>"><?php echo MSG_BTN_SITE_FEES;?></a>&nbsp;</td>
       <?php } ?>
      </tr>
    </table>
      </div>
    </div>
    </div>


      <div><img src="themes/<?php echo $setts['default_theme'];?>/img/pixel.gif" width="1" height="10"></div>

      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr valign="top">
         <td width="180" style="<?php if (substr(strrchr($_SERVER['PHP_SELF'],'/'),1)=="register.php"){ echo "display:none";} ?> <?php if (substr(strrchr($_SERVER['PHP_SELF'],'/'),1)=="login.php"){ echo "display:none";} ?> <?php if (substr(strrchr($_SERVER['PHP_SELF'],'/'),1)=="auction_details.php"){ echo "display:none";} ?>"><script language="javascript">
          var ie4 = false;
          if(document.all) { ie4 = true; }

          function getObject(id) { if (ie4) { return document.all[id]; } else { return document.getElementById(id); } }
          function toggle(link, divId) {
            var lText = link.innerHTML;
            var d = getObject(divId);
            if (lText == '+') { link.innerHTML = '&#8211;'; d.style.display = 'block'; }
            else { link.innerHTML = '+'; d.style.display = 'none'; }
          }
        </script>
        <?php if ($is_announcements && $member_active == 'Active') { ?>
        <?php echo $announcements_box_header;?>
        <div id="exp1102170555">
          <?php echo $announcements_box_content;?>
        </div>

            <div><img src="themes/<?php echo $setts['default_theme'];?>/img/pixel.gif" width="1" height="5"></div>
        <?php } ?>

      <?php echo $menu_box_header;?>
      <div id="exp1102170142">
            <?php echo $menu_box_content;?>
            </div>

            <div><img src="themes/<?php echo $setts['default_theme'];?>/img/pixel.gif" width="1" height="5"></div>
            <noscript>
            <?php echo MSG_JS_NOT_SUPPORTED;?>
            </noscript>
            <?php echo $category_box_header;?>
            <div id="exp1102170166">
            <?php echo $category_box_content;?>
            </div>
            <div><img src="themes/<?php echo $setts['default_theme'];?>/img/pixel.gif" width="180" height="1"></div>
            <br>
      <?php if ($setts['enable_header_counter']) { ?>
      <?php echo $header_site_status;?>
      <table width='100%' border='0' cellpadding='2' cellspacing='1' class='border no_b stat'>
        <tr class='c1'>
        <td width='20%' align='center'><b><?php echo $nb_site_users;?></b></td>
          <td width='80%'>&nbsp;<?php echo MSG_REGISTERED_USERS;?></td>
        </tr>
        <tr class='c2'>
          <td width='20%' align='center'><b><?php echo $nb_live_auctions;?></b></td>
          <td width='80%'>&nbsp;<?php echo MSG_LIVE_AUCTIONS;?></td>
        </tr>
        <?php if ($setts['enable_wanted_ads']) { ?>
        <tr class='c1'>
          <td width='20%' align='center'><b><?php echo $nb_live_wanted_ads;?></b></td>
          <td width='80%'>&nbsp;<?php echo MSG_LIVE_WANT_ADS;?></td>
        </tr>
        <?php } ?>
        <tr class='c2'>
          <td width='20%' align='center'><b><?php echo $nb_online_users;?></b></td>
          <td width='80%'>&nbsp;<?php echo MSG_ONLINE_USERS;?></td>
        </tr>
      </table>
      <div class="stat"><div class="nav_r"><div class="nav_l"><div class="nav"></div></div></div></div><?php } ?>
      <div><img src='themes/<?php echo $setts['default_theme'];?>/img/pixel.gif' width='1' height='5'></div>
      <br />
      <div align="center"><a href="rss_feed.php"><img src="themes/<?php echo $setts['default_theme'];?>/img/system/rss.gif" border="0" alt="" align="absmiddle"></a></div>

        </td>
            <td width="10" style="<?php if (substr(strrchr($_SERVER['PHP_SELF'],'/'),1)=="register.php"){ echo "display:none";} ?> <?php if (substr(strrchr($_SERVER['PHP_SELF'],'/'),1)=="login.php"){ echo "display:none";} ?> <?php if (substr(strrchr($_SERVER['PHP_SELF'],'/'),1)=="auction_details.php"){ echo "display:none";} ?>"><img src="themes/<?php echo $setts['default_theme'];?>/img/pixel.gif" width="10" height="1"></td>
         <td width="100%">

    <?php if (substr(strrchr($_SERVER['PHP_SELF'],'/'),1)=="index.php"){
     ?>





<?php //if ($member_active != 'Active') { ?>
<div><a href="<?php echo process_link('register');?>"><img src="themes/<?php echo $setts['default_theme'];?>/img/newuser.jpg" border="0"></a></div>
<div><img src="themes/<?php echo $setts['default_theme'];?>/img/pixel.gif" width="1" height="5"></div>
<?php //} ?>

<?php if ($is_news && $layout['d_news_box']) { ?>
<?php echo $news_box_header;?>
<?php echo $news_box_content;?>
<?php } ?>

<?php if ($setts['enable_header_counter']) { ?>
<!-- was status site -->
<?php } ?>
<?php if ($layout['bw_hp_stores']) { ?>
   <div><img src='themes/<?php echo $setts['default_theme'];?>/img/pixel.gif' width='1' height='5'></div>
   <?php echo $hp_featured_stores_header;?>
   <?php echo $hp_featured_stores_content;?>
   <?php } ?>

   <?php if ($layout['bw_hp_newusers']) { ?>
   <div><img src='themes/<?php echo $setts['default_theme'];?>/img/pixel.gif' width='1' height='5'></div>
   <?php echo $hp_newest_members_header;?>
   <?php echo $hp_newest_members_content;?>
   <?php } ?>

   <?php if ($layout['bw_hp_mostviewed']) { ?>
   <div><img src='themes/<?php echo $setts['default_theme'];?>/img/pixel.gif' width='1' height='5'></div>
   <?php echo $hp_most_viewed_header;?>
   <?php echo $hp_most_viewed_content;?>
   <?php } ?>

   <?php if ($layout['bw_hp_topsellers']) { ?>
   <div><img src='themes/<?php echo $setts['default_theme'];?>/img/pixel.gif' width='1' height='5'></div>
   <?php echo $hp_top_sellers_header;?>
   <?php echo $hp_top_sellers_content;?>
   <?php } ?>

   <?php if ($layout['bw_hp_lastsold']) { ?>
   <div><img src='themes/<?php echo $setts['default_theme'];?>/img/pixel.gif' width='1' height='5'></div>
   <?php echo $hp_last_sold_header;?>
   <?php echo $hp_last_sold_content;?>
   <?php } ?>
<div><img src="themes/<?php echo $setts['default_theme'];?>/img/pixel.gif" width="171" height="1"></div>


<?php
      }  ?>
<?php }
else
{
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><?php echo $page_title;?></title>
    <meta http-equiv="Content-Type" content="text/html; charset=<?php echo LANG_CODEPAGE;?>">

    <?php echo $page_meta_tags;?>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />

    <link href="themes/<?php echo $setts['default_theme'];?>/style.css" rel="stylesheet" type="text/css">
    <link href="themes/<?php echo $setts['default_theme'];?>/main_fl.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        <!--
        .lb {
            background-image: url(themes/<?php echo $setts['default_theme'];?>/img/lb_bg.gif);
        }

        .db {
            background-image: url(themes/<?php echo $setts['default_theme'];?>/img/db_bg.gif);
        }
            <?php if (substr(strrchr($_SERVER['PHP_SELF'], '/'), 1) == "register.php") {
            echo ".main_table {  width:930px; float:left; margin-left:10px}";
        } ?>

            <?php if (substr(strrchr($_SERVER['PHP_SELF'], '/'), 1) == "categories.php") {
            echo ".main_table { width:97%; margin-left:20px; margin-right:20px}";
        } ?>
            <?php if (substr(strrchr($_SERVER['PHP_SELF'], '/'), 1) == "auction_search.php") {
            echo ".main_table { width:97%; margin-left:20px; margin-right:20px}";
        } ?>
        -->
    </style>
    <script language="javascript" src="themes/<?php echo $setts['default_theme'];?>/main.js" type="text/javascript"></script>
    <script type="text/javascript" src="themes/<?php echo $setts['default_theme'];?>/countdownpro.js" defer="defer"></script>
    <?php
    for ($i = 1; $i < 50; $i++) {
    ?>
    <meta scheme="countdown<?php echo $i;?>" name="event_msg" content="CLOSED"><?php

}
    ?>
    <script type="text/javascript" src="scripts/innovaeditor.js"></script>

    <link href="themes/<?php echo $setts['default_theme'];?>/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="themes/<?php echo $setts['default_theme'];?>/css/vertical_menu_basic.css" rel="stylesheet" type="text/css"/>
    <link type="text/css" href="themes/<?php echo $setts['default_theme'];?>/css/custom-theme/jquery-ui-1.8.22.custom.css" rel="stylesheet"/>

    <script type="text/javascript" src="themes/<?php echo $setts['default_theme'];?>/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="themes/<?php echo $setts['default_theme'];?>/js/jquery-ui-1.8.22.custom.min.js"></script>


    <script type="text/javascript" src="themes/<?php echo $setts['default_theme'];?>/js/jquery.hoverIntent.minified.js"></script>
    <script type="text/javascript" src="themes/<?php echo $setts['default_theme'];?>/js/jquery.dcverticalmegamenu.1.1.js"></script>

    <script src="themes/<?php echo $setts['default_theme'];?>/js/jqFancyTransitions.1.8.min.js" type="text/javascript"></script>

    <script src="themes/<?php echo $setts['default_theme'];?>/js/cycle.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function() {

            $('#mega-1').dcVerticalMegaMenu({
                rowItems: '3',
                speed: 'fast',
                effect: 'slide',
                direction: 'right'
            });

            $('#mega-2').dcVerticalMegaMenu({
                rowItems: '3',
                speed: 'fast',
                effect: 'slide',
                direction: 'right'
            });

            $("button").button();
            $("a.button").button();
            $("input.button").button();

            $('ul.tabs').each(function() {
                var $active, $content, $links = $(this).find('a');

                $active = $links.last().addClass('active');
                $content = $($active.attr('href'));

                $links.not(':last').each(function () {
                    $($(this).attr('href')).hide();
                });

                $(this).on('click', 'a', function(e) {
                    $active.removeClass('active');
                    $content.hide();

                    $active = $(this);
                    $content = $($(this).attr('href'));

                    $active.addClass('active');
                    $content.show("slide", { direction: "right" }, 500);

                    e.preventDefault();
                });
            });

            $('#slideshowHolder').jqFancyTransitions({ width: 786, height: 298 });

            $('.signin').click(function() {
                $('.siginform').slideToggle('slow', function() {
                });
            });

            $('.advance-link').click(function() {
                $('#advance-search').slideToggle('slow', function() {
                });
            });

            $('#slide-listed-1').cycle({ timeout:5000, fx:'scrollRight', cleartype:1});
            $('#slide-listed-2').cycle({ timeout:5000, fx:'scrollDown', cleartype:1});
            $('#slide-listed-3').cycle({ timeout:5000, fx:'scrollLeft', cleartype:1});

        });

        function tellYourFriends() {

            $('#ajax-loader').css('display', 'block');

            $.ajax({
                type: 'POST',
                url: 'tell_friends.php',
                data: $('#share-form').serialize(),
                success: function(resp) {
                    //$('#ajax-loader').css('display', 'none');
                    $('#notice-area').empty().html('Message has been sent successfully!');
                    setTimeout(function(){$('.close_button').trigger('click');}, 2000);
                }
            });
        }
    </script>
</head>
<body>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" class="main-container">
<tr>
    <td>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="300" rowspan="3">
                    <div> <!--style="width:300px;height:160px;border: 1px solid #C3C3C3;">-->
                        <a href="<?=process_link('index');?>">
                            <img src="images/sitelogo.png" alt="logo" width="100%" height="100%" border="0" />
                        </a>
                    </div>
                </td>
                <td width="75" rowspan="3">&nbsp;</td>
                <td width="625" height="30">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td>&nbsp;</td>
                            <?php if ($member_active == 'Active'){ ; ?>
                            <td width="250" align="right">
                                <a href="javascript:void(0);" title="<?php echo 'Welcome, ' . ucwords(strtolower($member_username)); ?>" class="clink"><?php echo 'Welcome, ' . ucwords(strtolower($member_username)); ?></a>
                            </td>
                            <td width="10" align="center">|</td>
                            <td width="60" align="left">
                                <a href="<?php echo $login_link;?>" title="<?php echo ucwords(strtolower($login_btn_msg));?>" class="clink"><?php echo ucwords(strtolower($login_btn_msg));?></a>
                            </td>
                            <?php } else { ; ?>
                            <td width="250" align="right">
                                <a href="javascript:void(0);" title="Sign In" class="clink signin" id="signin">Sign In</a>
                            </td>
                            <td width="10" align="center">|</td>
                            <td width="60" align="left">
                                <a href="register.php" title="Register" class="clink">Register</a>
                            </td>
                            <?php } ?>
                            <td width="150">&nbsp;</td>
                            <td width="30" align="right">
                                <a href="#"><img src="themes/<?php echo $setts['default_theme'];?>/images/facebook.png" alt="Facebook" width="24" height="24"/></a>
                            </td>
                            <td width="30" align="right">
                                <a href="#"><img src="themes/<?php echo $setts['default_theme'];?>/images/twitter.png" alt="Twitter" width="24" height="24"/></a>
                            </td>
                            <td width="30" align="right">
                                <a href="#"><img src="themes/<?php echo $setts['default_theme'];?>/images/youtube.png" alt="Youtube" width="24" height="24"/></a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <div class="siginform">
                        <form name="loginbox" method="post" action="login.php">
                            <input type="hidden" value="submit" name="operation">
                            <input type="hidden" value="" name="redirect">
                            <table border="0" width="100%" cellspacing="16" height="92" cellpadding="" style="border:1px solid #ccc;">
                                <tr>
                                    <td align="right" class="inputfield">Username
                                        <input type="text" size="20" name="username" class="inputfield"></td>
                                    <td align="right" class="inputfield">Password
                                        <input type="password" size="20" name="password" class="inputfield"></td>
                                    <td align="center"><input type="submit" value="login" name="login" class="button"></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <div style="width: 480px; height: 60px; border: 1px solid #C3C3C3;">
<a href="http://srtvd.com/click/?s=167824&c=616021">                        <img src="themes/<?php echo $setts['default_theme'];?>/images/TopBanner.jpg" alt="Advertise with us" width="480" height="60" />
  </a>                  </div>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="256">&nbsp;</td>
                            <td width="60">
                                <a href="<?php echo $index_link;?>" class="button"><?php echo ucwords(strtolower(MSG_BTN_HOME));?></a>
                            </td>
                            <td width="80">
                                <a href="<?php echo process_link('content_pages', array('page' => 'about_us'));?>" class="button"><?php echo ucwords(strtolower(MSG_BTN_ABOUT_US));?></a>
                            </td>
                            <td width="48">
                                <a href="<?php echo $place_ad_link;?>" class="button"><?php echo ucwords(strtolower($place_ad_btn_msg));?></a>
                            </td>
                            <td width="91">
                                <a href="<?php echo process_link('content_pages', array('page' => 'contact_us'));?>" class="button"><?php echo ucwords(strtolower(MSG_BTN_CONTACT_US));?></a>
                            </td>
                            <td width="47">
                                <a href="<?php echo process_link('content_pages', array('page' => 'faq'));?>" class="button"><?php echo MSG_BTN_FAQ;?></a>
                            </td>
                            <td width="52">
                                <a href="<?php echo process_link('content_pages', array('page' => 'help'));?>" class="button"><?php echo ucwords(strtolower(MSG_BTN_HELP));?></a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </td>
</tr>
<tr>
    <td>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr bgcolor="#0073EA">
                <td width="10" height="45">&nbsp;</td>
                <td width="535">
                    <form method="post" action="auction_search.php">
                        <input type="hidden" value="basic_search" name="option" />
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="450" height="45">
                                    <input type="text" name="search_str" value="" class="search_field" placeholder="Search Auction Listings" />
                                </td>
                                <td width="85">
                                    <input type="submit" value="Search" name="search" class="sbutton button" />
                                </td>
                            </tr>
                        </table>
                    </form>
                </td>
                <td width="52"><a href="javascript:void(0);" class="wlink advance-link" id="advance-link">Advanced</a></td>
                <td width="55">&nbsp;</td>
                <td width="" align="right" valign="bottom">
                    <ul class="tabs">
                        <li><a href="#tab1">Stores</a></li>
                        <!--<li><a href="#tab2">Site Fees</a></li>-->
                        <li><a href="#tab2">Tell Your Friends!</a></li>
                        <li><a href="#tab3" title="Close" class="close_button">Close</a></li>
                    </ul>
                </td>
                <td width="5">&nbsp;</td>
            </tr>
            <tr bgcolor="#666666">
                <td colspan="6">
                    <div id="advance-search">
                        <form name="form_advanced_search" method="POST" action="auction_search.php">
                            <input type="hidden" value="auction_search" name="option">
                            <table border="0" width="100%" cellspacing="2" cellpadding="3" class="border">
                                <tr>
                                    <td><b>Auction Search</b></td>
                                </tr>
                                <tr>
                                    <td align="right">Search by Auction ID</td>
                                    <td>
                                        <input type="text" value="" size="15" id="src_auction_id" name="src_auction_id">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Search Keywords</td>
                                    <td>
                                        <input type="text" value="" size="50" id="keywords_search" name="keywords_search">
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <input type="checkbox" value="1" name="search_description">Search item title and
                                        description
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>The keywords will be matched with the item's title</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <input type="checkbox" value="1" name="buyout_price">Items with Buy Out enabled
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <input type="checkbox" value="1" name="reserve_price">Items with reserve price
                                        set only
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <input type="checkbox" value="1" name="quantity">Items with quantity greater
                                        than 1
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" width="150">Listed In</td>
                                    <td>
                                        <select name="list_in">
                                            <option selected="selected" value="auction">Site</option>
                                            <option value="store">Shop</option>
                                            <option value="both">Both</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" width="150">View Results</td>
                                    <td>
                                        <select name="results_view">
                                            <option value="all">All</option>
                                            <option selected="selected" value="open">Open Auctions Only</option>
                                            <option value="closed">Closed Auctions Only</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" width="150">Order By</td>
                                    <td>
                                        <select name="ordering">
                                            <option selected="selected" value="end_time_asc">Items Ending First</option>
                                            <option value="end_time_desc">Newest Items First</option>
                                            <option value="start_price_asc">Lowest Prices First</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <input type="submit" value="Search" name="form_search_proceed" class="button">
                                        <input type="button" value="Cancel" name="form_cancel_proceed" class="button advance-link">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </td>
            </tr>
        </table>
    </td>
</tr>
<tr class="separator">
    <td>&nbsp;</td>
</tr>
<tr>
    <td>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="202" valign="top" class="dcjq-vertical-mega-menu">
                    <?php echo $menu_box_content;?>
                    <?php echo $category_box_content_d;?>
                  <?php if ($setts['enable_header_counter'] && substr(strrchr($_SERVER['PHP_SELF'], '/'), 1) == "index.php") { ?>
                    <div class="nav-heading" align="center">Site Status</div>
                    <ul id="mega-2" class="menu">

                     <li>   #######<center><b><?php echo $nb_site_users;?></b>&nbsp;<?php echo MSG_REGISTERED_USERS;?></a></li>
                        <li><b><?php echo $nb_live_auctions;?></b>&nbsp;<?php echo MSG_LIVE_AUCTIONS;?></a></li>
                        <?php if ($setts['enable_wanted_ads']) { ?>
                        <li><a href="javascript:void(0);"><b><?php echo $nb_live_wanted_ads;?></b>&nbsp;<?php echo MSG_LIVE_WANT_ADS;?></a></li>
                        <?php } ?>
                        <li><a href="javascript:void(0);"><b><?php echo $nb_online_users;?></b>&nbsp;<?php echo MSG_ONLINE_USERS;?></a></li>
                    </ul>

                    <div class="nav-separator">&nbsp;</div>
                    <?php } ?>
                    <div align="center">
                        <a href="rss_feed.php">
                            <img src="themes/<?php echo $setts['default_theme'];?>/img/system/rss.gif" border="0" alt="" align="absmiddle" />
                        </a>
                    </div>
                </td>
                <td width="10">&nbsp;</td>
                <td width="788" valign="top">
                    <div id="tab1" class="ad-container">
                        <form name="form_advanced_search" method="POST" action="stores.php">
                            <input type="hidden" value="store_search" name="option">
                            <table border="0" width="100%" cellspacing="2" cellpadding="3" class="border">
                                <tr>
                                    <td colspan="2" align="left"><b>Store Search</b></td>
                                </tr>
                                <tr>
                                    <td colspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right">Store Name</td>
                                    <td colspan="2">
                                        <input type="text" value="" size="50" id="shop_name" name="shop_name"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">&nbsp;</td>
                                    <td colspan="2" style="font-size: 10px;">
                                        *Leave Blank to search All Stores
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <input type="submit" value="Search" class="button" name="form_search_proceed"/>

                                    </td>
                                </tr>
                            </table>
                        </form>
                        <?php if ($nb_featured_stores) { ?>
                        <table width="100%" border="0" cellpadding="3" cellspacing="2"><!--class="border">-->
                            <tr>
                                <td align="center"><h3>Featured Stores</h3></td>
                                <td>&nbsp;</td>
                                <td align="center"><h3>New Stores</h3></td>
                            </tr>
                            <tr>
                                <?php echo $featured_stores_table;?>
                            </tr>
                        </table>
                        <br>
                        <?php } ?>
                    </div>
                    <!--<div id="tab2" class="ad-container">
                        <table border="0" width="100%" height="32" cellspacing="2" cellpadding="3" class="border">
                            <tr>
                                <td valign="top">
                                    <b>SITE FEES</b>
                                </td>
                            </tr>
                        </table>
                        <br/>
                        <form method="post" action="site_fees.php">
                            <table border="0" align="center" cellspacing="2" cellpadding="3" class="border">
                                <tr class="c2">
                                    <td>Choose a Category :</td>
                                    <td><select name="fees_category_id">
                                        <option selected="" value="0">General</option>
                                        <option value="0">------------------------</option>
                                    </select></td>
                                    <td>
                                        <input type="submit" value="Select" class="button" style="margin-top: 5px;" name="form_choose_category">
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <br/>
                        <table border="0" width="100%" cellspacing="2" cellpadding="3" class="border">
                            <tr class="c2">
                                <td align="right" width="50%"><strong>Images Upload Fee </strong></td>
                                <td>USD 0.50</td>
                            </tr>
                            <tr class="c2">
                                <td align="right" width="50%"><strong>Highlighted Item Fee </strong></td>
                                <td>USD 2.00</td>
                            </tr>
                            <tr class="c2">
                                <td align="right" width="50%"><strong>Bold Item Fee </strong></td>
                                <td>USD 1.50</td>
                            </tr>
                            <tr class="c2">
                                <td align="right" width="50%"><strong>Category Featured Fee </strong></td>
                                <td>USD 1.50</td>
                            </tr>
                            <tr class="c2">
                                <td align="right" width="50%"><strong>Home Page Featured Fee </strong></td>
                                <td>USD 3.00</td>
                            </tr>
                            <tr class="c2">
                                <td align="right" width="50%"><strong>Reserve Price Fee </strong></td>
                                <td>USD 0.50</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="c3"><strong>Store Account Types </strong></td>
                            </tr>
                            <tr class="c5">
                                <td colspan="2">&nbsp;</td>
                            </tr>
                            <tr align="center">
                                <td colspan="2">
                                    <table border="0" width="100%" cellspacing="2" cellpadding="2" class="border">
                                        <tr class="c2">
                                            <td class="contentfont"><strong>Advanced Store</strong></td>
                                            <td class="contentfont">
                                                25 items, Price: USD 29.95, recurring every 30 days
                                            </td>
                                        </tr>
                                        <tr class="c1">
                                            <td class="contentfont"><strong>Expert Store</strong></td>
                                            <td class="contentfont">
                                                100 items, Price: USD 49.95, recurring every 30 days, [ <b>Featured
                                                Store</b> ]
                                            </td>
                                        </tr>
                                        <tr class="c2">
                                            <td class="contentfont"><strong>Platinum Store</strong></td>
                                            <td class="contentfont">
                                                500 items, Price: USD 69.95, recurring every 30 days, [ <b>Featured
                                                Store</b> ]
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="c3"><strong>End of Auction Fee - Paid by
                                    Seller</strong></td>
                            </tr>
                            <tr class="c5">
                                <td colspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <table border="0" width="100%" cellspacing="2" cellpadding="2" class="border">
                                        <tr class="c1">
                                            <td width="100%">
                                                From <b>USD 0.01</b> To <b>USD 1,000,000,000.00</b>
                                            </td>
                                            <td nowrap="">4.00%</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="c1 border" colspan="2">
                                    <b>% will be applied to users from 0 </b>
                                </td>
                            </tr>
                        </table>
                    </div>-->
                    <div id="tab2" class="ad-container">
                        <table border="0" width="100%" cellspacing="10" cellpadding="0" class="border">
                            <tr>
                                <td valign="top" align="left">
                                    <b>Tell Your Friends</b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <form name="share-form" id="share-form" method="post" action="">
                                        <table border="0" align="left" cellspacing="5" cellpadding="0" >
                                            <tr>
                                                <td>Email address 1:</td>
                                                <td><input type="text" name="friend_email[]" value="" size="50" class="" /></td>
                                            </tr>
                                            <tr>
                                                <td>Email address 2:</td>
                                                <td><input type="text" name="friend_email[]" value="" size="50" class="" /></td>
                                            </tr>
                                            <tr>
                                                <td>Email address 3:</td>
                                                <td><input type="text" name="friend_email[]" value="" size="50" class="" /></td>
                                            </tr>
                                            <tr>
                                                <td>Email address 4:</td>
                                                <td><input type="text" name="friend_email[]" value="" size="50" class="" /></td>
                                            </tr>
                                            <tr>
                                                <td>Email address 5:</td>
                                                <td><input type="text" name="friend_email[]" value="" size="50" class="" /></td>
                                            </tr>
                                            <tr>
                                                <td>Email address 6:</td>
                                                <td><input type="text" name="friend_email[]" value="" size="50" class="" /></td>
                                            </tr>
                                            <tr>
                                                <td valign="top">Message:</td>
                                                <td><textarea name="share_message" id="share_message" cols="70" rows="10"></textarea></td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>
                                                    <input type="button" value="Send Message" name="send-message" class="sbutton button" onclick="tellYourFriends();" />
                                                    <span id="notice-area"><img id="ajax-loader" style="display: none;" src="images/loader.gif" alt="Sending..." /></span>
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="tab3" class="ad-container">
<?
}
?>
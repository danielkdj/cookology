<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
=========================================================
* * Black Dashboard - v1.0.1
=========================================================

* Product Page: https://www.creative-tim.com/product/black-dashboard
* Copyright 2019 Creative Tim (https://www.creative-tim.com)


* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<!DOCTYPE html>
<html lang="kr">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link
      rel="apple-touch-icon"
      sizes="76x76"
      href="/cookology/resources/admin/img/apple-icon.png"
    />
    <link rel="icon" type="image/png" href="/cookology/resources/admin/img/favicon.png" />
    <title>Cookology_Admin_Page</title>
    <!--     Fonts and icons     -->
    <link
      href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800"
      rel="stylesheet"
    />
    <link
      href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
      rel="stylesheet"
    />
    <!-- Nucleo Icons -->
    <link href="/cookology/resources/admin/css/nucleo-icons.css" rel="stylesheet" />
    <!-- CSS Files -->
    <link href="/cookology/resources/admin/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="/cookology/resources/admin/demo/demo.css" rel="stylesheet" />
  </head>

  <body class="">
    <div class="wrapper">
      <div class="sidebar">
        <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red"
    -->
    <div class="sidebar-wrapper">
      <div class="logo">
<!-- 여기서 메인페이지로 이동하면 됩니다. -->
        <a href="javascript:void(0)" class="simple-text logo-normal">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          Cookology
        </a>
      </div>
      <ul class="nav">
        <li class="active">
          <a href="index.html">
            <i class="tim-icons icon-chart-bar-32"></i>
            <p>대시보드</p>
          </a>
        </li>
        <li>
          <a href="/cookology/resources/admin/examples/admin.html">
            <i class="tim-icons icon-badge"></i>
            <p>관리자 권한설정</p>
          </a>
        </li>
        <li>
          <a href="/cookology/resources/admin/examples/user.html">
            <i class="tim-icons icon-single-02"></i>
            <p>회원 관리</p>
          </a>
        </li>
        <li>
          <a href="/cookology/resources/admin/examples/client.html">
            <i class="tim-icons icon-paper"></i>
            <p>점주 관리</p>
          </a>
        </li>
        <li>
          <a href="/cookology/resources/admin/examples/contents.html">
            <i class="tim-icons icon-tv-2"></i>
            <p>컨텐츠 관리</p>
          </a>
        </li>
        <li>
          <a href="/cookology/resources/admin/examples/notifications.html">
            <i class="tim-icons icon-volume-98"></i>
            <p>댓글/구매평/문의 관리</p>
          </a>
        </li>

        <li>
          <a href="/cookology/resources/admin/examples/settings.html">
            <i class="tim-icons icon-settings"></i>
            <p>환경설정</p>
          </a>
        </li>
        <li>
          <a href="/cookology/resources/admin/examples/icon.html">
            <i class="tim-icons icon-pencil"></i>
            <p>아이콘</p>
          </a>
        </li> 
      </ul>
    </div>
  </div>
      <div class="main-panel">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-absolute navbar-transparent">
          <div class="container-fluid">
            <div class="navbar-wrapper">
              <div class="navbar-toggle d-inline">
                <button type="button" class="navbar-toggler">
                  <span class="navbar-toggler-bar bar1"></span>
                  <span class="navbar-toggler-bar bar2"></span>
                  <span class="navbar-toggler-bar bar3"></span>
                </button>
              </div>
              
              <a class="navbar-brand" href="index.html">대시보드</a>
            </div>
            <button
              class="navbar-toggler"
              type="button"
              data-toggle="collapse"
              data-target="#navigation"
              aria-expanded="false"
              aria-label="Toggle navigation"
            >
              <span class="navbar-toggler-bar navbar-kebab"></span>
              <span class="navbar-toggler-bar navbar-kebab"></span>
              <span class="navbar-toggler-bar navbar-kebab"></span>
            </button>
            <div class="collapse navbar-collapse" id="navigation">
              <ul class="navbar-nav ml-auto">
                <li class="dropdown nav-item">
                  <a
                    href="javascript:void(0)"
                    class="dropdown-toggle nav-link"
                    data-toggle="dropdown"
                  >
                  </a>
                  <ul class="dropdown-menu dropdown-menu-right dropdown-navbar">


                  </ul>
                </li>
                <li class="dropdown nav-item">
                  <a
                    href="#"
                    class="dropdown-toggle nav-link"
                    data-toggle="dropdown"
                  >
                    <div class="photo">
                      <img src="/cookology/resources/admin/img/Cookology_logo.png" alt="Profile Photo" />
                    </div>
                    <b class="caret d-none d-lg-block d-xl-block"></b>
                    <p class="d-lg-none">Log out</p>
                  </a>
                  <ul class="dropdown-menu dropdown-navbar">
                    <li class="nav-link">
                      <a
                        href="javascript:void(0)"
                        class="nav-item dropdown-item"
                        >Profile</a
                      >
                    </li>
                    <li class="nav-link">
                      <a
                        href="javascript:void(0)"
                        class="nav-item dropdown-item"
                        >Settings</a
                      >
                    </li>
                    <li class="dropdown-divider"></li>
                    <li class="nav-link">
                      <a
                        href="javascript:void(0)"
                        class="nav-item dropdown-item"
                        >Log out</a
                      >
                    </li>
                  </ul>
                </li>
                <li class="separator d-lg-none"></li>
              </ul>
            </div>
          </div>
        </nav>
        <div
          class="modal modal-search fade"
          id="searchModal"
          tabindex="-1"
          role="dialog"
          aria-labelledby="searchModal"
          aria-hidden="true"
        >
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <input
                  type="text"
                  class="form-control"
                  id="inlineFormInputGroup"
                  placeholder="SEARCH"
                />
                <button
                  type="button"
                  class="close"
                  data-dismiss="modal"
                  aria-label="Close"
                >
                  <i class="tim-icons icon-simple-remove"></i>
                </button>
              </div>
            </div>
          </div>
        </div>
        <!-- End Navbar -->
        <div class="content">
          <div class="row">
            <div class="col-12">
              <div class="card card-chart">
                <div class="card-header">
                  <div class="row">
                    <div class="col-sm-6 text-left">
                      <h5 class="card-category">Total Shipments</h5>
                      <h2 class="card-title">Performance</h2>
                    </div>
                    <div class="col-sm-6">
                      <div
                        class="btn-group btn-group-toggle float-right"
                        data-toggle="buttons"
                      >
                        <label
                          class="btn btn-sm btn-primary btn-simple active"
                          id="0"
                        >
                          <input type="radio" name="options" checked />
                          <span
                            class="d-none d-sm-block d-md-block d-lg-block d-xl-block"
                            >Accounts</span
                          >
                          <span class="d-block d-sm-none">
                            <i class="tim-icons icon-single-02"></i>
                          </span>
                        </label>
                        <label class="btn btn-sm btn-primary btn-simple" id="1">
                          <input
                            type="radio"
                            class="d-none d-sm-none"
                            name="options"
                          />
                          <span
                            class="d-none d-sm-block d-md-block d-lg-block d-xl-block"
                            >Purchases</span
                          >
                          <span class="d-block d-sm-none">
                            <i class="tim-icons icon-gift-2"></i>
                          </span>
                        </label>
                        <label class="btn btn-sm btn-primary btn-simple" id="2">
                          <input type="radio" class="d-none" name="options" />
                          <span
                            class="d-none d-sm-block d-md-block d-lg-block d-xl-block"
                            >Sessions</span
                          >
                          <span class="d-block d-sm-none">
                            <i class="tim-icons icon-tap-02"></i>
                          </span>
                        </label>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="chartBig1"></canvas>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="card card-chart">
                <div class="card-header">
                  <h5 class="card-category">Total Shipments</h5>
                  <h3 class="card-title">
                    <i class="tim-icons icon-bell-55 text-primary"></i> 763,215
                  </h3>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="chartLinePurple"></canvas>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="card card-chart">
                <div class="card-header">
                  <h5 class="card-category">Daily Sales</h5>
                  <h3 class="card-title">
                    <i class="tim-icons icon-delivery-fast text-info"></i>
                    3,500€
                  </h3>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="CountryChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="card card-chart">
                <div class="card-header">
                  <h5 class="card-category">Completed Tasks</h5>
                  <h3 class="card-title">
                    <i class="tim-icons icon-send text-success"></i> 12,100K
                  </h3>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="chartLineGreen"></canvas>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-6 col-md-12">
              <div class="card card-tasks">
                <div class="card-header">
                  <h6 class="title d-inline">Tasks(5)</h6>
                  <p class="card-category d-inline">today</p>
                  <div class="dropdown">
                    <button
                      type="button"
                      class="btn btn-link dropdown-toggle btn-icon"
                      data-toggle="dropdown"
                    >
                      <i class="tim-icons icon-settings-gear-63"></i>
                    </button>
                    <div
                      class="dropdown-menu dropdown-menu-right"
                      aria-labelledby="dropdownMenuLink"
                    >
                      <a class="dropdown-item" href="#pablo">Action</a>
                      <a class="dropdown-item" href="#pablo">Another action</a>
                      <a class="dropdown-item" href="#pablo">Something else</a>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="table-full-width table-responsive">
                    <table class="table">
                      <tbody>
                        <tr>
                          <td>
                            <div class="form-check">
                              <label class="form-check-label">
                                <input
                                  class="form-check-input"
                                  type="checkbox"
                                  value=""
                                />
                                <span class="form-check-sign">
                                  <span class="check"></span>
                                </span>
                              </label>
                            </div>
                          </td>
                          <td>
                            <p class="title">Update the Documentation</p>
                            <p class="text-muted">
                              Dwuamish Head, Seattle, WA 8:47 AM
                            </p>
                          </td>
                          <td class="td-actions text-right">
                            <button
                              type="button"
                              rel="tooltip"
                              title=""
                              class="btn btn-link"
                              data-original-title="Edit Task"
                            >
                              <i class="tim-icons icon-pencil"></i>
                            </button>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="form-check">
                              <label class="form-check-label">
                                <input
                                  class="form-check-input"
                                  type="checkbox"
                                  value=""
                                  checked=""
                                />
                                <span class="form-check-sign">
                                  <span class="check"></span>
                                </span>
                              </label>
                            </div>
                          </td>
                          <td>
                            <p class="title">GDPR Compliance</p>
                            <p class="text-muted">
                              The GDPR is a regulation that requires businesses
                              to protect the personal data and privacy of Europe
                              citizens for transactions that occur within EU
                              member states.
                            </p>
                          </td>
                          <td class="td-actions text-right">
                            <button
                              type="button"
                              rel="tooltip"
                              title=""
                              class="btn btn-link"
                              data-original-title="Edit Task"
                            >
                              <i class="tim-icons icon-pencil"></i>
                            </button>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="form-check">
                              <label class="form-check-label">
                                <input
                                  class="form-check-input"
                                  type="checkbox"
                                  value=""
                                />
                                <span class="form-check-sign">
                                  <span class="check"></span>
                                </span>
                              </label>
                            </div>
                          </td>
                          <td>
                            <p class="title">Solve the issues</p>
                            <p class="text-muted">
                              Fifty percent of all respondents said they would
                              be more likely to shop at a company
                            </p>
                          </td>
                          <td class="td-actions text-right">
                            <button
                              type="button"
                              rel="tooltip"
                              title=""
                              class="btn btn-link"
                              data-original-title="Edit Task"
                            >
                              <i class="tim-icons icon-pencil"></i>
                            </button>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="form-check">
                              <label class="form-check-label">
                                <input
                                  class="form-check-input"
                                  type="checkbox"
                                  value=""
                                />
                                <span class="form-check-sign">
                                  <span class="check"></span>
                                </span>
                              </label>
                            </div>
                          </td>
                          <td>
                            <p class="title">Release v2.0.0</p>
                            <p class="text-muted">
                              Ra Ave SW, Seattle, WA 98116, SUA 11:19 AM
                            </p>
                          </td>
                          <td class="td-actions text-right">
                            <button
                              type="button"
                              rel="tooltip"
                              title=""
                              class="btn btn-link"
                              data-original-title="Edit Task"
                            >
                              <i class="tim-icons icon-pencil"></i>
                            </button>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="form-check">
                              <label class="form-check-label">
                                <input
                                  class="form-check-input"
                                  type="checkbox"
                                  value=""
                                />
                                <span class="form-check-sign">
                                  <span class="check"></span>
                                </span>
                              </label>
                            </div>
                          </td>
                          <td>
                            <p class="title">Export the processed files</p>
                            <p class="text-muted">
                              The report also shows that consumers will not
                              easily forgive a company once a breach exposing
                              their personal data occurs.
                            </p>
                          </td>
                          <td class="td-actions text-right">
                            <button
                              type="button"
                              rel="tooltip"
                              title=""
                              class="btn btn-link"
                              data-original-title="Edit Task"
                            >
                              <i class="tim-icons icon-pencil"></i>
                            </button>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="form-check">
                              <label class="form-check-label">
                                <input
                                  class="form-check-input"
                                  type="checkbox"
                                  value=""
                                />
                                <span class="form-check-sign">
                                  <span class="check"></span>
                                </span>
                              </label>
                            </div>
                          </td>
                          <td>
                            <p class="title">Arival at export process</p>
                            <p class="text-muted">
                              Capitol Hill, Seattle, WA 12:34 AM
                            </p>
                          </td>
                          <td class="td-actions text-right">
                            <button
                              type="button"
                              rel="tooltip"
                              title=""
                              class="btn btn-link"
                              data-original-title="Edit Task"
                            >
                              <i class="tim-icons icon-pencil"></i>
                            </button>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6 col-md-12">
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">Simple Table</h4>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table tablesorter" id="">
                      <thead class="text-primary">
                        <tr>
                          <th>Name</th>
                          <th>Country</th>
                          <th>City</th>
                          <th class="text-center">Salary</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>Dakota Rice</td>
                          <td>Niger</td>
                          <td>Oud-Turnhout</td>
                          <td class="text-center">$36,738</td>
                        </tr>
                        <tr>
                          <td>Minerva Hooper</td>
                          <td>Curaçao</td>
                          <td>Sinaai-Waas</td>
                          <td class="text-center">$23,789</td>
                        </tr>
                        <tr>
                          <td>Sage Rodriguez</td>
                          <td>Netherlands</td>
                          <td>Baileux</td>
                          <td class="text-center">$56,142</td>
                        </tr>
                        <tr>
                          <td>Philip Chaney</td>
                          <td>Korea, South</td>
                          <td>Overland Park</td>
                          <td class="text-center">$38,735</td>
                        </tr>
                        <tr>
                          <td>Doris Greene</td>
                          <td>Malawi</td>
                          <td>Feldkirchen in Kärnten</td>
                          <td class="text-center">$63,542</td>
                        </tr>
                        <tr>
                          <td>Mason Porter</td>
                          <td>Chile</td>
                          <td>Gloucester</td>
                          <td class="text-center">$78,615</td>
                        </tr>
                        <tr>
                          <td>Jon Porter</td>
                          <td>Portugal</td>
                          <td>Gloucester</td>
                          <td class="text-center">$98,615</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <footer class="footer">
          <div class="container-fluid">
            <div class="copyright">
              ©
              <script>
                document.write(new Date().getFullYear());
              </script>
made by 1A1C for better your meal
            </div>
          </div>
        </footer>
      </div>
    </div>
    <div class="fixed-plugin">
      <div class="dropdown show-dropdown">
        <a href="#" data-toggle="dropdown">
          <i class="fa fa-cog fa-2x"> </i>
        </a>
        <ul class="dropdown-menu">
          <li class="header-title">Sidebar Background</li>
          <li class="adjustments-line">
            <a
              href="javascript:void(0)"
              class="switch-trigger background-color"
            >
              <div class="badge-colors text-center">
                <span
                  class="badge filter badge-primary active"
                  data-color="primary"
                ></span>
                <span class="badge filter badge-info" data-color="blue"></span>
                <span
                  class="badge filter badge-success"
                  data-color="green"
                ></span>
              </div>
              <div class="clearfix"></div>
            </a>
          </li>
          <li class="adjustments-line text-center color-change">
            <span class="color-label">LIGHT MODE</span>
            <span class="badge light-badge mr-2"></span>
            <span class="badge dark-badge ml-2"></span>
            <span class="color-label">DARK MODE</span>
          </li>
            <br />
            <br />
          </li>
        </ul>
      </div>
    </div>
    <!--   Core JS Files   -->
    <script src="/cookology/resources/admin/js/core/jquery.min.js"></script>
    <script src="/cookology/resources/admin/js/core/popper.min.js"></script>
    <script src="/cookology/resources/admin/js/core/bootstrap.min.js"></script>
    <script src="/cookology/resources/admin/js/plugins/perfect-scrollbar.jquery.min.js"></script>
    <!-- Chart JS -->
    <script src="/cookology/resources/admin/js/plugins/chartjs.min.js"></script>
    <!--  Notifications Plugin    -->
    <script src="/cookology/resources/admin/js/plugins/bootstrap-notify.js"></script>
    <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
    <script src="/cookology/resources/admin/js/black-dashboard.min.js?v=1.0.0"></script>
    <!-- Black Dashboard DEMO methods, don't include it in your project! -->
    <script src="/cookology/resources/admin/demo/demo.js"></script>
    <script>
      $(document).ready(function () {
        $().ready(function () {
          $sidebar = $(".sidebar");
          $navbar = $(".navbar");
          $main_panel = $(".main-panel");

          $full_page = $(".full-page");

          $sidebar_responsive = $("body > .navbar-collapse");
          sidebar_mini_active = true;
          white_color = false;

          window_width = $(window).width();

          fixed_plugin_open = $(
            ".sidebar .sidebar-wrapper .nav li.active a p"
          ).html();

          $(".fixed-plugin a").click(function (event) {
            if ($(this).hasClass("switch-trigger")) {
              if (event.stopPropagation) {
                event.stopPropagation();
              } else if (window.event) {
                window.event.cancelBubble = true;
              }
            }
          });

          $(".fixed-plugin .background-color span").click(function () {
            $(this).siblings().removeClass("active");
            $(this).addClass("active");

            var new_color = $(this).data("color");

            if ($sidebar.length != 0) {
              $sidebar.attr("data", new_color);
            }

            if ($main_panel.length != 0) {
              $main_panel.attr("data", new_color);
            }

            if ($full_page.length != 0) {
              $full_page.attr("filter-color", new_color);
            }

            if ($sidebar_responsive.length != 0) {
              $sidebar_responsive.attr("data", new_color);
            }
          });

          $(".switch-sidebar-mini input").on(
            "switchChange.bootstrapSwitch",
            function () {
              var $btn = $(this);

              if (sidebar_mini_active == true) {
                $("body").removeClass("sidebar-mini");
                sidebar_mini_active = false;
                blackDashboard.showSidebarMessage(
                  "Sidebar mini deactivated..."
                );
              } else {
                $("body").addClass("sidebar-mini");
                sidebar_mini_active = true;
                blackDashboard.showSidebarMessage("Sidebar mini activated...");
              }

              // we simulate the window Resize so the charts will get updated in realtime.
              var simulateWindowResize = setInterval(function () {
                window.dispatchEvent(new Event("resize"));
              }, 180);

              // we stop the simulation of Window Resize after the animations are completed
              setTimeout(function () {
                clearInterval(simulateWindowResize);
              }, 1000);
            }
          );

          $(".switch-change-color input").on(
            "switchChange.bootstrapSwitch",
            function () {
              var $btn = $(this);

              if (white_color == true) {
                $("body").addClass("change-background");
                setTimeout(function () {
                  $("body").removeClass("change-background");
                  $("body").removeClass("white-content");
                }, 900);
                white_color = false;
              } else {
                $("body").addClass("change-background");
                setTimeout(function () {
                  $("body").removeClass("change-background");
                  $("body").addClass("white-content");
                }, 900);

                white_color = true;
              }
            }
          );

          $(".light-badge").click(function () {
            $("body").addClass("white-content");
          });

          $(".dark-badge").click(function () {
            $("body").removeClass("white-content");
          });
        });
      });
    </script>
    <script>
      $(document).ready(function () {
        // Javascript method's body can be found in /cookology/resources/admin/js/demos.js
        demo.initDashboardPageCharts();
      });
    </script>
    <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
    <script>
      window.TrackJS &&
        TrackJS.install({
          token: "ee6fab19c5a04ac1a32a645abde4613a",
          application: "black-dashboard-free",
        });
    </script>
  </body>
</html>

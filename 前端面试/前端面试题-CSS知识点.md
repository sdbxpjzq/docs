<!DOCTYPE html>
<html class="" lang="en">
<head prefix="og: http://ogp.me/ns#">
<meta charset="utf-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="object" property="og:type">
<meta content="GitLab" property="og:site_name">
<meta content="前端面试题-CSS知识点.md · master · 尹大龙 / docs" property="og:title">
<meta content="Welcome to GitLab" property="og:description">
<meta content="https://gitlab.mfwdev.com/assets/gitlab_logo-7ae504fe4f68fdebb3c2034e36621930cd36ea87924c11ff65dbcb8ed50dca58.png" property="og:image">
<meta content="64" property="og:image:width">
<meta content="64" property="og:image:height">
<meta content="https://gitlab.mfwdev.com/dalong/docs/blob/master/%E5%89%8D%E7%AB%AF%E9%9D%A2%E8%AF%95%E9%A2%98-CSS%E7%9F%A5%E8%AF%86%E7%82%B9.md" property="og:url">
<meta content="summary" property="twitter:card">
<meta content="前端面试题-CSS知识点.md · master · 尹大龙 / docs" property="twitter:title">
<meta content="Welcome to GitLab" property="twitter:description">
<meta content="https://gitlab.mfwdev.com/assets/gitlab_logo-7ae504fe4f68fdebb3c2034e36621930cd36ea87924c11ff65dbcb8ed50dca58.png" property="twitter:image">

<title>前端面试题-CSS知识点.md · master · 尹大龙 / docs · GitLab</title>
<meta content="Welcome to GitLab" name="description">
<link rel="shortcut icon" type="image/x-icon" href="/assets/favicon-075eba76312e8421991a0c1f89a89ee81678bcde72319dd3e8047e2a47cd3a42.ico" id="favicon" />
<link rel="stylesheet" media="all" href="/assets/application-6a3ef04d2d06f6f387f3926420b39edb4fcbcc563aedc3dc9a94e19092c3752b.css" />
<link rel="stylesheet" media="print" href="/assets/print-74b3d49adeaada27337e759b75a34af7cf3d80051de91d60d40570f5a382e132.css" />


<!-- / TODO: Combine these 2 stylesheets into application.scss -->
<link rel="stylesheet" media="all" href="/assets/new_nav-9dc36451d6461185b3c501b73a23f48936cda9ee5b0b8f9b1001c951ce12eabf.css" />
<link rel="stylesheet" media="all" href="/assets/new_sidebar-1f383f3cb338b8ecf8062dab06052141f414f51165f656b97a0930c0d38cd7dc.css" />
<script>
//<![CDATA[
window.gon={};gon.api_version="v4";gon.default_avatar_url="https:\/\/gitlab.mfwdev.com\/assets\/no_avatar-849f9c04a3a0d0cea2424ae97b27447dc64a7dbfae83c036c45b403392f0e8ba.png";gon.max_file_size=50;gon.asset_host=null;gon.webpack_public_path="\/assets\/webpack\/";gon.relative_url_root="";gon.shortcuts_path="\/help\/shortcuts";gon.user_color_scheme="white";gon.katex_css_url="\/assets\/katex-dc07578acd203b2dd73a8c78cdb8dcb79144ba11a23749d80904496b7ff8a650.css";gon.katex_js_url="\/assets\/katex-04bcf56379fcda0ee7c7a63f71d0fc15ffd2e014d017cd9d51fd6554dfccf40a.js";gon.gitlab_url="https:\/\/gitlab.mfwdev.com";gon.revision="eff7821";gon.gitlab_logo="\/assets\/gitlab_logo-7ae504fe4f68fdebb3c2034e36621930cd36ea87924c11ff65dbcb8ed50dca58.png";
//]]>
</script>
<script src="/assets/webpack/webpack_runtime.eb9021d1579881a98fd0.bundle.js" defer="defer"></script>
<script src="/assets/webpack/common.c04294b903455a34f707.bundle.js" defer="defer"></script>
<script src="/assets/webpack/locale.b9a56fbc6e00d576d16c.bundle.js" defer="defer"></script>
<script src="/assets/webpack/main.80148fe65a50ebcaa826.bundle.js" defer="defer"></script>



<script src="/assets/webpack/blob.6043bed197eb079db95f.bundle.js" defer="defer"></script>


<meta name="csrf-param" content="authenticity_token" />
<meta name="csrf-token" content="RSeNUI73ydkafcZL/1iatB3vc+0hYsLX9cwMCP2/2jCraJazE4P9VQiKLsnuDe9oo/Bb44iVcowCcBoF6KZwJg==" />
<meta content="origin-when-cross-origin" name="referrer">
<meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport">
<meta content="#474D57" name="theme-color">
<link rel="apple-touch-icon" type="image/x-icon" href="/assets/touch-icon-iphone-5a9cee0e8a51212e70b90c87c12f382c428870c0ff67d1eb034d884b78d2dae7.png" />
<link rel="apple-touch-icon" type="image/x-icon" href="/assets/touch-icon-ipad-a6eec6aeb9da138e507593b464fdac213047e49d3093fc30e90d9a995df83ba3.png" sizes="76x76" />
<link rel="apple-touch-icon" type="image/x-icon" href="/assets/touch-icon-iphone-retina-72e2aadf86513a56e050e7f0f2355deaa19cc17ed97bbe5147847f2748e5a3e3.png" sizes="120x120" />
<link rel="apple-touch-icon" type="image/x-icon" href="/assets/touch-icon-ipad-retina-8ebe416f5313483d9c1bc772b5bbe03ecad52a54eba443e5215a22caed2a16a2.png" sizes="152x152" />
<link color="rgb(226, 67, 41)" href="/assets/logo-d36b5212042cebc89b96df4bf6ac24e43db316143e89926c0db839ff694d2de4.svg" rel="mask-icon">
<meta content="/assets/msapplication-tile-1196ec67452f618d39cdd85e2e3a542f76574c071051ae7effbfde01710eb17d.png" name="msapplication-TileImage">
<meta content="#30353E" name="msapplication-TileColor">




</head>

<body class="ui_indigo " data-find-file="/dalong/docs/find_file/master" data-group="" data-page="projects:blob:show" data-project="docs">



<header class="navbar navbar-gitlab navbar-gitlab-new">
<a class="sr-only gl-accessibility" href="#content-body" tabindex="1">Skip to content</a>
<div class="container-fluid">
<div class="header-content">
<div class="title-container">
<h1 class="title">
<a title="Dashboard" id="logo" href="/"><img data-src="/uploads/-/system/appearance/header_logo/1/AAEAAQAAAAAAAAT6AAAAJDY0ZTY5ODg4LTBjMTMtNGExYi05MzVjLTY5MjRjM2I5Yzg0OA.png" class=" lazy" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" />
<span class="logo-text hidden-xs">
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 617 169"><path d="M315.26 2.97h-21.8l.1 162.5h88.3v-20.1h-66.5l-.1-142.4M465.89 136.95c-5.5 5.7-14.6 11.4-27 11.4-16.6 0-23.3-8.2-23.3-18.9 0-16.1 11.2-23.8 35-23.8 4.5 0 11.7.5 15.4 1.2v30.1h-.1m-22.6-98.5c-17.6 0-33.8 6.2-46.4 16.7l7.7 13.4c8.9-5.2 19.8-10.4 35.5-10.4 17.9 0 25.8 9.2 25.8 24.6v7.9c-3.5-.7-10.7-1.2-15.1-1.2-38.2 0-57.6 13.4-57.6 41.4 0 25.1 15.4 37.7 38.7 37.7 15.7 0 30.8-7.2 36-18.9l4 15.9h15.4v-83.2c-.1-26.3-11.5-43.9-44-43.9M557.63 149.1c-8.2 0-15.4-1-20.8-3.5V70.5c7.4-6.2 16.6-10.7 28.3-10.7 21.1 0 29.2 14.9 29.2 39 0 34.2-13.1 50.3-36.7 50.3m9.2-110.6c-19.5 0-30 13.3-30 13.3v-21l-.1-27.8h-21.3l.1 158.5c10.7 4.5 25.3 6.9 41.2 6.9 40.7 0 60.3-26 60.3-70.9-.1-35.5-18.2-59-50.2-59M77.9 20.6c19.3 0 31.8 6.4 39.9 12.9l9.4-16.3C114.5 6 97.3 0 78.9 0 32.5 0 0 28.3 0 85.4c0 59.8 35.1 83.1 75.2 83.1 20.1 0 37.2-4.7 48.4-9.4l-.5-63.9V75.1H63.6v20.1h38l.5 48.5c-5 2.5-13.6 4.5-25.3 4.5-32.2 0-53.8-20.3-53.8-63-.1-43.5 22.2-64.6 54.9-64.6M231.43 2.95h-21.3l.1 27.3v94.3c0 26.3 11.4 43.9 43.9 43.9 4.5 0 8.9-.4 13.1-1.2v-19.1c-3.1.5-6.4.7-9.9.7-17.9 0-25.8-9.2-25.8-24.6v-65h35.7v-17.8h-35.7l-.1-38.5M155.96 165.47h21.3v-124h-21.3v124M155.96 24.37h21.3V3.07h-21.3v21.3"/></svg>

</span>
</a></h1>
<ul class="list-unstyled navbar-sub-nav">
<li class="home"><a title="Projects" class="dashboard-shortcuts-projects" href="/explore">Projects
</a></li><li class=""><a title="Groups" class="dashboard-shortcuts-groups" href="/explore/groups">Groups
</a></li><li class=""><a title="Snippets" class="dashboard-shortcuts-snippets" href="/explore/snippets">Snippets
</a></li><li>
<a title="About GitLab CE" href="/help">Help</a>
</li>
</ul>

</div>
<div class="navbar-collapse collapse">
<ul class="nav navbar-nav">
<li class="hidden-sm hidden-xs">
<div class="has-location-badge search search-form">
<form class="navbar-form" action="/search" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden" value="&#x2713;" /><div class="search-input-container">
<div class="location-badge">This project</div>
<div class="search-input-wrap">
<div class="dropdown" data-url="/search/autocomplete">
<input type="search" name="search" id="search" placeholder="Search" class="search-input dropdown-menu-toggle no-outline js-search-dashboard-options" spellcheck="false" tabindex="1" autocomplete="off" data-toggle="dropdown" data-issues-path="https://gitlab.mfwdev.com/dashboard/issues" data-mr-path="https://gitlab.mfwdev.com/dashboard/merge_requests" aria-label="Search" />
<div class="dropdown-menu dropdown-select">
<div class="dropdown-content"><ul>
<li class="dropdown-menu-empty-item">
<a>
Loading...
</a>
</li>
</ul>
</div><div class="dropdown-loading"><i aria-hidden="true" data-hidden="true" class="fa fa-spinner fa-spin"></i></div>
</div>
<i class="search-icon"></i>
<i class="clear-icon js-clear-input"></i>
</div>
</div>
</div>
<input type="hidden" name="group_id" id="group_id" class="js-search-group-options" />
<input type="hidden" name="project_id" id="search_project_id" value="880" class="js-search-project-options" data-project-path="docs" data-name="docs" data-issues-path="/dalong/docs/issues" data-mr-path="/dalong/docs/merge_requests" />
<input type="hidden" name="search_code" id="search_code" value="true" />
<input type="hidden" name="repository_ref" id="repository_ref" value="master" />

<div class="search-autocomplete-opts hide" data-autocomplete-path="/search/autocomplete" data-autocomplete-project-id="880" data-autocomplete-project-ref="master"></div>
</form></div>

</li>
<li class="visible-sm-inline-block visible-xs-inline-block">
<a title="Search" aria-label="Search" data-toggle="tooltip" data-placement="bottom" data-container="body" href="/search"><i aria-hidden="true" data-hidden="true" class="fa fa-search"></i>
</a></li>
<li>
<div>
<a class="btn btn-sign-in" href="/users/sign_in?redirect_to_referer=yes">Sign in / Register</a>
</div>
</li>
</ul>
</div>
<button class="navbar-toggle hidden-sm hidden-md hidden-lg" type="button">
<span class="sr-only">Toggle navigation</span>
<i aria-hidden="true" data-hidden="true" class="fa fa-ellipsis-v js-navbar-toggle-right"></i>
<i aria-hidden="true" data-hidden="true" class="fa fa-times js-navbar-toggle-left"></i>
</button>
</div>
</div>
</header>


<div class="page-with-new-sidebar page-with-sidebar">
<div class="nav-sidebar">
<div class="nav-sidebar-inner-scroll">
<div class="context-header">
<a title="docs" href="/dalong/docs"><div class="avatar-container s40 project-avatar">
<div class="avatar s40 avatar-tile identicon" style="background-color: #FBE9E7; color: #555">D</div>
</div>
<div class="sidebar-context-title">
docs
</div>
</a></div>
<ul class="sidebar-top-level-items">
<li class="home"><a class="shortcuts-project" aria-label="Project overview" href="/dalong/docs"><div class="nav-icon-container">
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16"><path d="M8.462 2.177l-.038.044a.505.505 0 0 0 .038-.044zm-.787 0a.5.5 0 0 0 .038.043l-.038-.043zM3.706 7h8.725L8.069 2.585 3.706 7zM7 13.369V12a1 1 0 0 1 2 0v1.369h3V9H4v4.369h3zM14 9v4.836c0 .833-.657 1.533-1.5 1.533h-9c-.843 0-1.5-.7-1.5-1.533V9h-.448a1.1 1.1 0 0 1-.783-1.873L6.934.887a1.5 1.5 0 0 1 2.269 0l6.165 6.24A1.1 1.1 0 0 1 14.585 9H14z"/></svg>

</div>
<span class="nav-item-name">
Overview
</span>
</a><ul class="sidebar-sub-level-items">
<li class="fly-out-top-item"><a href="/dalong/docs"><strong class="fly-out-top-item-name">
Overview
</strong>
</a></li><li class="divider fly-out-top-item"></li>
<li class=""><a title="Project details" class="shortcuts-project" href="/dalong/docs"><span>Details</span>
</a></li><li class=""><a title="Activity" class="shortcuts-project-activity" href="/dalong/docs/activity"><span>Activity</span>
</a></li><li class=""><a title="Cycle Analytics" class="shortcuts-project-cycle-analytics" href="/dalong/docs/cycle_analytics"><span>Cycle Analytics</span>
</a></li></ul>
</li><li class="active"><a class="shortcuts-tree" aria-label="Repository" href="/dalong/docs/tree/master"><div class="nav-icon-container">
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16"><path d="M8 2H5a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V7h-3a2 2 0 0 1-2-2V2zm2 .414V5h2.586L10 2.414zM5 0h4.586A2 2 0 0 1 11 .586L14.414 4A2 2 0 0 1 15 5.414V12a4 4 0 0 1-4 4H5a4 4 0 0 1-4-4V4a4 4 0 0 1 4-4zm.5 11h5a.5.5 0 1 1 0 1h-5a.5.5 0 1 1 0-1zm0-2h5a.5.5 0 1 1 0 1h-5a.5.5 0 0 1 0-1zm0-2h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1z"/></svg>

</div>
<span class="nav-item-name">
Repository
</span>
</a><ul class="sidebar-sub-level-items">
<li class="fly-out-top-item active"><a href="/dalong/docs/tree/master"><strong class="fly-out-top-item-name">
Repository
</strong>
</a></li><li class="divider fly-out-top-item"></li>
<li class="active"><a href="/dalong/docs/tree/master">Files
</a></li><li class=""><a href="/dalong/docs/commits/master">Commits
</a></li><li class=""><a href="/dalong/docs/branches">Branches
</a></li><li class=""><a href="/dalong/docs/tags">Tags
</a></li><li class=""><a href="/dalong/docs/graphs/master">Contributors
</a></li><li class=""><a href="/dalong/docs/network/master">Graph
</a></li><li class=""><a href="/dalong/docs/compare?from=master&amp;to=master">Compare
</a></li><li class=""><a href="/dalong/docs/graphs/master/charts">Charts
</a></li></ul>
</li><li class=""><a class="shortcuts-issues" aria-label="Issues" href="/dalong/docs/issues"><div class="nav-icon-container">
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16"><path d="M10.458 15.012l.311.055a3 3 0 0 0 3.476-2.433l1.389-7.879A3 3 0 0 0 13.2 1.28L11.23.933a3.002 3.002 0 0 0-.824-.031c.364.59.58 1.28.593 2.02l1.854.328a1 1 0 0 1 .811 1.158l-1.389 7.879a1 1 0 0 1-1.158.81l-.118-.02a3.98 3.98 0 0 1-.541 1.935zM3 0h4a3 3 0 0 1 3 3v10a3 3 0 0 1-3 3H3a3 3 0 0 1-3-3V3a3 3 0 0 1 3-3zm0 2a1 1 0 0 0-1 1v10a1 1 0 0 0 1 1h4a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H3z"/></svg>

</div>
<span class="nav-item-name">
Issues
</span>
<span class="badge count issue_counter">
0
</span>
</a><ul class="sidebar-sub-level-items">
<li class="fly-out-top-item"><a href="/dalong/docs/issues"><strong class="fly-out-top-item-name">
Issues
</strong>
<span class="badge count issue_counter fly-out-badge">
0
</span>
</a></li><li class="divider fly-out-top-item"></li>
<li class=""><a title="Issues" href="/dalong/docs/issues"><span>
List
</span>
</a></li><li class=""><a title="Boards" href="/dalong/docs/boards"><span>
Boards
</span>
</a></li><li class=""><a title="Labels" href="/dalong/docs/labels"><span>
Labels
</span>
</a></li><li class=""><a title="Milestones" href="/dalong/docs/milestones"><span>
Milestones
</span>
</a></li></ul>
</li><li class=""><a class="shortcuts-merge_requests" aria-label="Merge Requests" href="/dalong/docs/merge_requests"><div class="nav-icon-container">
<svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 16 16"><path d="m5 5.563v4.875c1.024.4 1.75 1.397 1.75 2.563 0 1.519-1.231 2.75-2.75 2.75-1.519 0-2.75-1.231-2.75-2.75 0-1.166.726-2.162 1.75-2.563v-4.875c-1.024-.4-1.75-1.397-1.75-2.563 0-1.519 1.231-2.75 2.75-2.75 1.519 0 2.75 1.231 2.75 2.75 0 1.166-.726 2.162-1.75 2.563m-1 8.687c.69 0 1.25-.56 1.25-1.25 0-.69-.56-1.25-1.25-1.25-.69 0-1.25.56-1.25 1.25 0 .69.56 1.25 1.25 1.25m0-10c.69 0 1.25-.56 1.25-1.25 0-.69-.56-1.25-1.25-1.25-.69 0-1.25.56-1.25 1.25 0 .69.56 1.25 1.25 1.25"/><path d="m10.501 2c1.381.001 2.499 1.125 2.499 2.506v5.931c1.024.4 1.75 1.397 1.75 2.563 0 1.519-1.231 2.75-2.75 2.75-1.519 0-2.75-1.231-2.75-2.75 0-1.166.726-2.162 1.75-2.563v-5.931c0-.279-.225-.506-.499-.506v.926c0 .346-.244.474-.569.271l-2.952-1.844c-.314-.196-.325-.507 0-.71l2.952-1.844c.314-.196.569-.081.569.271v.93m1.499 12.25c.69 0 1.25-.56 1.25-1.25 0-.69-.56-1.25-1.25-1.25-.69 0-1.25.56-1.25 1.25 0 .69.56 1.25 1.25 1.25"/></svg>

</div>
<span class="nav-item-name">
Merge Requests
</span>
<span class="badge count merge_counter js-merge-counter">
0
</span>
</a><ul class="sidebar-sub-level-items is-fly-out-only">
<li class="fly-out-top-item"><a href="/dalong/docs/merge_requests"><strong class="fly-out-top-item-name">
Merge Requests
</strong>
<span class="badge count merge_counter js-merge-counter fly-out-badge">
0
</span>
</a></li></ul>
</li><li class=""><a class="shortcuts-pipelines" aria-label="CI / CD" href="/dalong/docs/pipelines"><div class="nav-icon-container">
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" enable-background="new 0 0 16 16"><path d="m8 0c-4.4 0-8 3.6-8 8s3.6 8 8 8 8-3.6 8-8-3.6-8-8-8m0 14c-3.3 0-6-2.7-6-6s2.7-6 6-6 6 2.7 6 6-2.7 6-6 6"/><circle cx="12.5" cy="9.5" r=".5"/><circle cx="12.5" cy="6.5" r=".5"/><circle cx="10.5" cy="12.5" r=".5"/><circle cx="10.5" cy="3.5" r=".5"/><circle cx="5.5" cy="12.5" r=".5"/><circle cx="5.5" cy="3.5" r=".5"/><circle cx="3.5" cy="9.5" r=".5"/><circle cx="3.5" cy="6.5" r=".5"/><path d="m9 7.2c0 0 0-.1 0-.2v-1.9c0-.1 0-.1-.1-.2l-.8-.8c0 0-.1 0-.1 0l-.9.8c-.1.1-.1.1-.1.2v1.9c0 .1 0 .2 0 .2-.6.4-1 1-1 1.8 0 1.1.9 2 2 2s2-.9 2-2c0-.8-.4-1.4-1-1.8m-1 2.8c-.6 0-1-.4-1-1s.4-1 1-1 1 .4 1 1-.4 1-1 1"/></svg>

</div>
<span class="nav-item-name">
CI / CD
</span>
</a><ul class="sidebar-sub-level-items">
<li class="fly-out-top-item"><a href="/dalong/docs/pipelines"><strong class="fly-out-top-item-name">
CI / CD
</strong>
</a></li><li class="divider fly-out-top-item"></li>
<li class=""><a title="Pipelines" class="shortcuts-pipelines" href="/dalong/docs/pipelines"><span>
Pipelines
</span>
</a></li><li class=""><a title="Jobs" class="shortcuts-builds" href="/dalong/docs/-/jobs"><span>
Jobs
</span>
</a></li><li class=""><a title="Schedules" class="shortcuts-builds" href="/dalong/docs/pipeline_schedules"><span>
Schedules
</span>
</a></li><li class=""><a title="Charts" class="shortcuts-pipelines-charts" href="/dalong/docs/pipelines/charts"><span>
Charts
</span>
</a></li></ul>
</li><li class=""><a class="shortcuts-wiki" aria-label="Wiki" href="/dalong/docs/wikis/home"><div class="nav-icon-container">
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16"><path d="M8 2H4a1 1 0 0 0-1 1v10a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1v4.191a.5.5 0 0 1-.724.447l-1.052-.526a.5.5 0 0 0-.448 0l-1.052.526A.5.5 0 0 1 8 6.191V2zM4 0h8a3 3 0 0 1 3 3v10a3 3 0 0 1-3 3H4a3 3 0 0 1-3-3V3a3 3 0 0 1 3-3z"/></svg>

</div>
<span class="nav-item-name">
Wiki
</span>
</a><ul class="sidebar-sub-level-items is-fly-out-only">
<li class="fly-out-top-item"><a href="/dalong/docs/wikis/home"><strong class="fly-out-top-item-name">
Wiki
</strong>
</a></li></ul>
</li><li class=""><a title="Members" class="shortcuts-tree" href="/dalong/docs/settings/members"><div class="nav-icon-container">
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M10.521 8.01C15.103 8.19 16 10.755 16 12.48c0 1.533-.056 2.29-3.808 2.475.609-.54.808-1.331.808-2.475 0-1.911-.804-3.503-2.479-4.47zm-1.67-1.228A3.987 3.987 0 0 0 9.976 4a3.987 3.987 0 0 0-1.125-2.782 3 3 0 1 1 0 5.563zM5.976 7a3 3 0 1 1 0-6 3 3 0 0 1 0 6zM6 15c-5.924 0-6-.78-6-2.52S.964 8 6 8s6 2.692 6 4.48c0 1.788-.076 2.52-6 2.52z"/></svg>

</div>
<span class="nav-item-name">
Members
</span>
</a></li><a class="toggle-sidebar-button js-toggle-sidebar" role="button" title="Toggle sidebar" type="button">
<i aria-hidden="true" data-hidden="true" class="fa fa-angle-double-left"></i>
<i aria-hidden="true" data-hidden="true" class="fa fa-angle-double-right"></i>
<span class="collapse-text">Collapse sidebar</span>
</a>
<button name="button" type="button" class="close-nav-button"><i aria-hidden="true" data-hidden="true" class="fa fa-times"></i>
<span class="collapse-text">Close sidebar</span>
</button>
<li class="hidden">
<a title="Activity" class="shortcuts-project-activity" href="/dalong/docs/activity"><span>
Activity
</span>
</a></li>
<li class="hidden">
<a title="Network" class="shortcuts-network" href="/dalong/docs/network/master">Graph
</a></li>
<li class="hidden">
<a title="Charts" class="shortcuts-repository-charts" href="/dalong/docs/graphs/master/charts">Charts
</a></li>
<li class="hidden">
<a class="shortcuts-new-issue" href="/dalong/docs/issues/new">Create a new issue
</a></li>
<li class="hidden">
<a title="Jobs" class="shortcuts-builds" href="/dalong/docs/-/jobs">Jobs
</a></li>
<li class="hidden">
<a title="Commits" class="shortcuts-commits" href="/dalong/docs/commits/master">Commits
</a></li>
<li class="hidden">
<a title="Issue Boards" class="shortcuts-issue-boards" href="/dalong/docs/boards">Issue Boards</a>
</li>
</ul>
</div>
</div>

<div class="content-wrapper page-with-new-nav">
<div class="mobile-overlay"></div>
<div class="alert-wrapper">


<nav class="breadcrumbs container-fluid container-limited" role="navigation">
<div class="breadcrumbs-container">
<button name="button" type="button" class="toggle-mobile-nav"><span class="sr-only">Open sidebar</span>
<i aria-hidden="true" data-hidden="true" class="fa fa-bars"></i>
</button><div class="breadcrumbs-links js-title-container">
<ul class="list-unstyled breadcrumbs-list js-breadcrumbs-list">
<li><a href="/dalong">尹大龙</a><i aria-hidden="true" data-hidden="true" class="fa fa-angle-right breadcrumbs-list-angle"></i></li> <li><a href="/dalong/docs"><span class="breadcrumb-item-text js-breadcrumb-item-text">docs</span></a><i aria-hidden="true" data-hidden="true" class="fa fa-angle-right breadcrumbs-list-angle"></i></li>

<li>
<h2 class="breadcrumbs-sub-title">Repository</h2>
</li>
</ul>
</div>

</div>
</nav>

<div class="flash-container flash-container-page">
</div>

</div>
<div class=" ">
<div class="content" id="content-body">


<div class="container-fluid container-limited">
<div class="tree-holder" id="tree-holder">
<div class="nav-block">
<div class="tree-ref-container">
<div class="tree-ref-holder">
<form class="project-refs-form" action="/dalong/docs/refs/switch" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="destination" id="destination" value="blob" />
<input type="hidden" name="path" id="path" value="前端面试题-CSS知识点.md" />
<div class="dropdown">
<button class="dropdown-menu-toggle js-project-refs-dropdown" type="button" data-toggle="dropdown" data-selected="master" data-ref="master" data-refs-url="/dalong/docs/refs" data-field-name="ref" data-submit-form-on-click="true" data-visit="true"><span class="dropdown-toggle-text ">master</span><i aria-hidden="true" data-hidden="true" class="fa fa-chevron-down"></i></button>
<div class="dropdown-menu dropdown-menu-selectable git-revision-dropdown">
<div class="dropdown-title"><span>Switch branch/tag</span><button class="dropdown-title-button dropdown-menu-close" aria-label="Close" type="button"><i aria-hidden="true" data-hidden="true" class="fa fa-times dropdown-menu-close-icon"></i></button></div>
<div class="dropdown-input"><input type="search" id="" class="dropdown-input-field" placeholder="Search branches and tags" autocomplete="off" /><i aria-hidden="true" data-hidden="true" class="fa fa-search dropdown-input-search"></i><i role="button" aria-hidden="true" data-hidden="true" class="fa fa-times dropdown-input-clear js-dropdown-input-clear"></i></div>
<div class="dropdown-content"></div>
<div class="dropdown-loading"><i aria-hidden="true" data-hidden="true" class="fa fa-spinner fa-spin"></i></div>
</div>
</div>
</form>
</div>
<ul class="breadcrumb repo-breadcrumb">
<li>
<a href="/dalong/docs/tree/master">docs
</a></li>
<li>
<a href="/dalong/docs/blob/master/%E5%89%8D%E7%AB%AF%E9%9D%A2%E8%AF%95%E9%A2%98-CSS%E7%9F%A5%E8%AF%86%E7%82%B9.md"><strong>前端面试题-CSS知识点.md</strong>
</a></li>
</ul>
</div>
<div class="tree-controls">
<a class="btn shortcuts-find-file" rel="nofollow" href="/dalong/docs/find_file/master"><i aria-hidden="true" data-hidden="true" class="fa fa-search"></i>
<span>Find file</span>
</a>
<div class="btn-group" role="group"><a class="btn js-blob-blame-link" href="/dalong/docs/blame/master/%E5%89%8D%E7%AB%AF%E9%9D%A2%E8%AF%95%E9%A2%98-CSS%E7%9F%A5%E8%AF%86%E7%82%B9.md">Blame</a><a class="btn" href="/dalong/docs/commits/master/%E5%89%8D%E7%AB%AF%E9%9D%A2%E8%AF%95%E9%A2%98-CSS%E7%9F%A5%E8%AF%86%E7%82%B9.md">History</a><a class="btn js-data-file-blob-permalink-url" href="/dalong/docs/blob/a1bb0ee208cf9862ea4b24183bfa886c0e04f2da/%E5%89%8D%E7%AB%AF%E9%9D%A2%E8%AF%95%E9%A2%98-CSS%E7%9F%A5%E8%AF%86%E7%82%B9.md">Permalink</a></div>
</div>
</div>

<div class="info-well hidden-xs">
<div class="well-segment">
<ul class="blob-commit-info">
<li class="commit flex-row js-toggle-container" id="commit-a1bb0ee2">
<div class="avatar-cell hidden-xs">
<a href="mailto:loin_yin@qq.com"><img alt="loin&#39;s avatar" src="no_avatar.png" data-container="body" class="avatar s36 hidden-xs has-tooltip" title="loin" /></a>
</div>
<div class="commit-detail">
<div class="commit-content">
<a class="commit-row-message item-title" href="/dalong/docs/commit/a1bb0ee208cf9862ea4b24183bfa886c0e04f2da">fix bug</a>
<span class="commit-row-message visible-xs-inline">
&middot;
a1bb0ee2
</span>
<div class="commiter">
<a class="commit-author-link has-tooltip" title="loin_yin@qq.com" href="mailto:loin_yin@qq.com">loin</a> committed <time class="js-timeago" title="Dec 28, 2016 3:00pm" datetime="2016-12-28T07:00:44Z" data-toggle="tooltip" data-placement="top" data-container="body">Dec 28, 2016</time>
</div>
</div>
<div class="commit-actions hidden-xs">

<a class="commit-sha btn btn-transparent" href="/dalong/docs/commit/a1bb0ee208cf9862ea4b24183bfa886c0e04f2da">a1bb0ee2</a>
<button class="btn btn-clipboard btn-transparent" data-toggle="tooltip" data-placement="bottom" data-container="body" data-title="Copy commit SHA to clipboard" data-clipboard-text="a1bb0ee208cf9862ea4b24183bfa886c0e04f2da" type="button" title="Copy commit SHA to clipboard" aria-label="Copy commit SHA to clipboard"><i aria-hidden="true" aria-hidden="true" data-hidden="true" class="fa fa-clipboard"></i></button>

</div>
</div>
</li>

</ul>
</div>

</div>
<div class="blob-content-holder" id="blob-content-holder">
<article class="file-holder">
<div class="js-file-title file-title-flex-parent">
<div class="file-header-content">
<i aria-hidden="true" data-hidden="true" class="fa fa-file-text-o fa-fw"></i>
<strong class="file-title-name">
前端面试题-CSS知识点.md
</strong>
<button class="btn btn-clipboard btn-transparent prepend-left-5" data-toggle="tooltip" data-placement="bottom" data-container="body" data-class="btn-clipboard btn-transparent prepend-left-5" data-title="Copy file path to clipboard" data-clipboard-text="{&quot;text&quot;:&quot;前端面试题-CSS知识点.md&quot;,&quot;gfm&quot;:&quot;`前端面试题-CSS知识点.md`&quot;}" type="button" title="Copy file path to clipboard" aria-label="Copy file path to clipboard"><i aria-hidden="true" aria-hidden="true" data-hidden="true" class="fa fa-clipboard"></i></button>
<small>
1.76 KB
</small>
</div>

<div class="file-actions hidden-xs">
<div class="btn-group js-blob-viewer-switcher" role="group">
<button aria-label="Display source" class="btn btn-default btn-sm js-blob-viewer-switch-btn has-tooltip" data-container="body" data-viewer="simple" title="Display source">
<i aria-hidden="true" data-hidden="true" class="fa fa-code"></i>
</button><button aria-label="Display rendered file" class="btn btn-default btn-sm js-blob-viewer-switch-btn has-tooltip" data-container="body" data-viewer="rich" title="Display rendered file">
<i aria-hidden="true" data-hidden="true" class="fa fa-file-text-o"></i>
</button></div>

<div class="btn-group" role="group"><button class="btn btn btn-sm js-copy-blob-source-btn" data-toggle="tooltip" data-placement="bottom" data-container="body" data-class="btn btn-sm js-copy-blob-source-btn" data-title="Copy source to clipboard" data-clipboard-target=".blob-content[data-blob-id=&#39;54995643d50ebfdaaf99c30b6ff5a506d0819ca1&#39;]" type="button" title="Copy source to clipboard" aria-label="Copy source to clipboard"><i aria-hidden="true" aria-hidden="true" data-hidden="true" class="fa fa-clipboard"></i></button><a class="btn btn-sm has-tooltip" target="_blank" rel="noopener noreferrer" title="Open raw" data-container="body" href="/dalong/docs/raw/master/%E5%89%8D%E7%AB%AF%E9%9D%A2%E8%AF%95%E9%A2%98-CSS%E7%9F%A5%E8%AF%86%E7%82%B9.md"><i aria-hidden="true" data-hidden="true" class="fa fa-file-code-o"></i></a></div>
<div class="btn-group" role="group"><a class="btn js-edit-blob  btn-sm" href="/dalong/docs/edit/master/%E5%89%8D%E7%AB%AF%E9%9D%A2%E8%AF%95%E9%A2%98-CSS%E7%9F%A5%E8%AF%86%E7%82%B9.md">Edit</a></div>
</div>
</div>


<div class="blob-viewer hidden" data-type="simple" data-url="/dalong/docs/blob/master/%E5%89%8D%E7%AB%AF%E9%9D%A2%E8%AF%95%E9%A2%98-CSS%E7%9F%A5%E8%AF%86%E7%82%B9.md?format=json&amp;viewer=simple">
<div class="text-center prepend-top-default append-bottom-default">
<i aria-hidden="true" aria-label="Loading content…" class="fa fa-spinner fa-spin fa-2x"></i>
</div>

</div>

<div class="blob-viewer" data-type="rich" data-url="/dalong/docs/blob/master/%E5%89%8D%E7%AB%AF%E9%9D%A2%E8%AF%95%E9%A2%98-CSS%E7%9F%A5%E8%AF%86%E7%82%B9.md?format=json&amp;viewer=rich">
<div class="text-center prepend-top-default append-bottom-default">
<i aria-hidden="true" aria-label="Loading content…" class="fa fa-spinner fa-spin fa-2x"></i>
</div>

</div>


</article>
</div>

</div>
</div>

</div>
</div>
</div>
</div>


</body>
</html>


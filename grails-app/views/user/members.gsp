<html>
<head>
  <title>Members</title>
  <meta name="layout" content="main"/>
</head>
<body>
<h1>Members</h1>
<g:each var="user" in="${users}">
  <div class="post">
    <div class="title">
      <h2><g:link controller="user" action="show" id="${user.id}">${user.firstName} ${user.lastName}</g:link> <g:if test="${user.twitterNickname}"><a href="http://twitter.com/${user.twitterNickname}"><img class="twitterIcon" src="${resource(dir: 'images', file: 'twitter.png')}" alt="Follow me on Twitter!" title="Follow me on Twitter!"/></a></g:if></h2>
    </div>
    <div class="entry">
       <g:if test="${user.avatar == Avatar.GRAVATAR}">
          <avatar:gravatar email="${user.email}" cssClass="showUserAvatar"/>
       </g:if>
       <g:else>
         <img alt="Local photo" height="20" width="20" class="showUserAvatar" src="<g:createLink controller='register' action='renderImage' id='${user.id}'/>"/>
       </g:else>
       <g:xwikiRender>${user.bio}</g:xwikiRender>
    </div>
       
    <div class="meta">
      <p class="links"><g:link controller="user" action="show" id="${user.id}" class="more">Read more</g:link></p>
    </div>
  </div>
</g:each>
</body>
</html>
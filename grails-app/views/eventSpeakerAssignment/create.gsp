

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Topic</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Topics</g:link></span>
        </div>
        <div class="body">
            <h1>Create Topic</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${eventSpeakerAssignmentInstance}">
            <div class="errors">
                <g:renderErrors bean="${eventSpeakerAssignmentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="event">Event:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:eventSpeakerAssignmentInstance,field:'event','errors')}">
                                    <g:select optionKey="id" from="${Event.list()}" name="event.id" value="${eventSpeakerAssignmentInstance?.event?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user">User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:eventSpeakerAssignmentInstance,field:'user','errors')}">
                                    <g:select optionKey="id" from="${User.list()}" name="user.id" value="${eventSpeakerAssignmentInstance?.user?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="topic">Topic:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:eventSpeakerAssignmentInstance,field:'topic','errors')}">
                                    <input type="text" id="topic" name="topic" value="${fieldValue(bean:eventSpeakerAssignmentInstance,field:'topic')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="topicAbstract">Topic Abstract:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:eventSpeakerAssignmentInstance,field:'topicAbstract','errors')}">
                                    <textarea rows="5" cols="40" name="topicAbstract">${fieldValue(bean:eventSpeakerAssignmentInstance, field:'topicAbstract')}</textarea>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lightningTalk">Lightning Talk:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:eventSpeakerAssignmentInstance,field:'lightningTalk','errors')}">
                                    <g:checkBox name="lightningTalk" value="${eventSpeakerAssignmentInstance?.lightningTalk}" ></g:checkBox>
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>

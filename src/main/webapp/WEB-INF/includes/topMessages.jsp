<fmt:setBundle basename="webProject.i18n.validation" var="langValidation"/>

<c:if test="${not empty messages[assets.GENERAL_MESSAGES_BLOCK_NAME]}">
    <div id="top-messages" class="row">
        <div class="col-md-12">
            <c:forEach items="${messages[assets.GENERAL_MESSAGES_BLOCK_NAME]}"
                    var="message">
                <div class="alert
                    ${message.type == 'SUCCESS' ? 'alert-success' :
                        (message.type == 'INFO' ? 'alert-info' :
                        (message.type == 'ERROR' ? 'alert-danger' :
                        (message.type == 'WARNING' ? 'alert-warning' : '')))}" role="alert">
                    <fmt:message key="${message.messageKey}" bundle="${langValidation}"/>
                </div>
            </c:forEach>
        </div>
    </div>
    <c:set target="${messages}"
            property="${assets.GENERAL_MESSAGES_BLOCK_NAME}" value="${null}"/>
</c:if>
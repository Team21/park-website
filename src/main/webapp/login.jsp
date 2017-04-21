<%@include file="/WEB-INF/includes/header.jsp" %>
<fmt:setBundle basename="webProject.i18n.credential.credential" var="credential"/>
<fmt:setBundle basename="webProject.i18n.backend.general" var="general"/>

<div class="row">
    <div class="col-xs-8 col-xs-offset-2 col-md-4 col-md-offset-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><fmt:message key="credential.signin.title" bundle="${credential}"/></h3>
                <form method="POST" name="loginform" id="loginform"
                      action="<c:url value="${ApplicationResources.SIGN_IN_URI}"/>"
                      accept-charset="UTF-8" role="form">
                    <div class="form-group validated required">
                        <label class="control-label" for="userName">
                            <fmt:message key="credential.username.label" bundle="${credential}"/></label>
                        <input type="text" class="form-control" id="userName"
                               placeholder="<fmt:message key="credential.username.label" bundle="${credential}"/>"
                               name="signInUsername"
                               value="${sessionScope.username}"/>
                    </div>
                    <div class="form-group validated required">
                        <label class="control-label" for="userPassword">
                            <fmt:message key="credential.password.label" bundle="${credential}"/></label>
                        <input type="password" class="form-control" id="userPassword"
                               placeholder="<fmt:message key="credential.password.label" bundle="${credential}"/>"
                               name="password"/>
                    </div>

                    <button type="submit"
                            class="btn btn-lg btn-primary btn-block disabled">
                        <fmt:message key="credential.signin.label" bundle="${credential}"/></button>
                </form>
            </div>

        </div>
        <p><a href="${ApplicationResources.SIGN_UP_URI}">
            <fmt:message key="signUp.link.label" bundle="${credential}"/></a></p>

    </div>
</div>

<%@include file="/WEB-INF/includes/footer.jsp" %>
<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "title">
        ${msg("emailForgotTitle")?no_esc}
    <#elseif section = "header">
        ${msg("emailForgotTitle")?no_esc}
    <#elseif section = "form">
        <form id="kc-reset-password-form" class="form reset-password ${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="reset-password-field ${properties.kcFormGroupClass!}">
                <span class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon ${properties.kcLabelClass!} <#if usernameEditDisabled??>mdc-text-field--disabled</#if>" >
                    <i class="material-icons mdc-text-field__icon mdc-text-field__icon--trailing" tabindex="-1" role="button">person</i>
                    <#if auth?has_content && auth.showUsername()>
                        <input required type="text" id="username" name="username" class="mdc-text-field__input ${properties.kcInputClass!}" autofocus aria-labelledby="aria-username" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>" value="${auth.attemptedUsername}"/>
                    <#else>
                        <input required type="text" id="username" name="username" class="mdc-text-field__input ${properties.kcInputClass!}" autofocus aria-labelledby="aria-username" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
                    </#if>
                    <span class="mdc-notched-outline">
                        <span class="mdc-notched-outline__leading"></span>
                        <span class="mdc-notched-outline__notch">
                            <span class="mdc-floating-label ${properties.kcLabelClass!}" id="aria-username">
                                <#if !realm.loginWithEmailAllowed>
                                    ${msg("username")}
                                <#elseif !realm.registrationEmailAsUsername>
                                    ${msg("usernameOrEmail")}
                                <#else>
                                    ${msg("email")}
                                </#if>
                            </span>
                        </span>
                        <span class="mdc-notched-outline__trailing"></span>
                    </span>
                </span>
                <#if messagesPerField.existsError('username')>
                    <div class="error-message ${properties.kcInputErrorMessageClass!}">
                        <span aria-hidden="true" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('username'))?no_esc}
                        </span>
                    </div>
                </#if>
            </div>
            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                        <div class="${properties.kcFormButtonsWrapperClass!}">
                            <a class="mdc-button mdc-button--outlined fullwidth my" href="${url.loginUrl}">
                                <span class="mdc-button__ripple"></span>
                                ${kcSanitize(msg("backToLogin"))?no_esc}
                            </a>
                        </div>
                        <div class="clearfix"></div>
                    </div> 
                </div>
            </div>
            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                        <div class="${properties.kcFormButtonsWrapperClass!}">
                            <button class="mdc-button mdc-button--raised ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!} fullwidth my" type="submit">
                                ${msg("doSubmit")?no_esc}
                            </button>
                        </div>
                        <div class="clearfix"></div>
                    </div> 
                </div>
            </div>
            <div class="clearfix"></div>
        </form>
    <#elseif section = "info" >
        <hr />
        ${msg("emailInstruction")?no_esc}
    </#if>
</@layout.registrationLayout>

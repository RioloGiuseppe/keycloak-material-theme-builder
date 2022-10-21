<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("loginProfileTitle")?no_esc}
    <#elseif section = "header">
        ${msg("loginProfileTitle")?no_esc}
    <#elseif section = "form">
        <form id="kc-update-profile-form" class="form update-profile ${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <#if user.editUsernameAllowed>
            <div class="form-textbox">
            <span class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon ${properties.kcLabelClass!}">
                <i class="material-icons mdc-text-field__icon mdc-text-field__icon--trailing" tabindex="-1" role="button">person</i>
                <input required id="username" class="mdc-text-field__input ${properties.kcInputClass!}" name="username" type="text" autofocus value="${(user.username!'')}" 
                aria-labelledby="aria-username" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>">
                <span class="mdc-notched-outline">
                    <span class="mdc-notched-outline__leading"></span>
                    <span class="mdc-notched-outline__notch">
                        <span class="mdc-floating-label ${properties.kcLabelClass!}" id="aria-username">
                            ${msg("username")?no_esc}
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
            </#if>
            <div class="form-textbox">
            <span class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon ${properties.kcLabelClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <i class="material-icons mdc-text-field__icon mdc-text-field__icon--trailing" tabindex="-1" role="button">email</i>
                <input required id="email" class="mdc-text-field__input ${properties.kcInputClass!}" name="email" type="text" autofocus value="${(user.email!'')}"
                aria-labelledby="aria-email" aria-invalid="<#if messagesPerField.existsError('email')>true</#if>">
                <span class="mdc-notched-outline">
                    <span class="mdc-notched-outline__leading"></span>
                    <span class="mdc-notched-outline__notch">
                        <span class="mdc-floating-label ${properties.kcLabelClass!}" id="aria-email">
                            ${msg("email")?no_esc}
                        </span>
                    </span>
                    <span class="mdc-notched-outline__trailing"></span>
                </span>
            </span>
            <#if messagesPerField.existsError('email')>
                <div class="error-message ${properties.kcInputErrorMessageClass!}">
                    <span aria-hidden="true" aria-live="polite">
                        ${kcSanitize(messagesPerField.get('email'))?no_esc}
                    </span>
                </div>
            </#if>
            </div>
            <div class="form-textbox">
            <span class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon ${properties.kcLabelClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                <i class="material-icons mdc-text-field__icon mdc-text-field__icon--trailing" tabindex="-1" role="button">person</i>
                <input required id="firstName" class="mdc-text-field__input ${properties.kcInputClass!}" name="firstName" type="text" autofocus value="${(user.firstName!'')}" 
                aria-labelledby="aria-firstName" aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>">
                <span class="mdc-notched-outline">
                    <span class="mdc-notched-outline__leading"></span>
                    <span class="mdc-notched-outline__notch">
                        <span class="mdc-floating-label ${properties.kcLabelClass!}" id="aria-firstName">
                            ${msg("firstName")?no_esc}
                        </span>
                    </span>
                    <span class="mdc-notched-outline__trailing"></span>
                </span>
            </span>
            <#if messagesPerField.existsError('firstName')>
                <div class="error-message ${properties.kcInputErrorMessageClass!}">
                    <span aria-hidden="true" aria-live="polite">
                        ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                    </span>
                </div>
            </#if>
            </div>
            <div class="form-textbox">
            <span class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon ${properties.kcLabelClass!}">
                <i class="material-icons mdc-text-field__icon mdc-text-field__icon--trailing" tabindex="-1" role="button">person</i>
                <input required id="lastName" class="mdc-text-field__input ${properties.kcInputClass!}" name="lastName" type="text" autofocus value="${(user.lastName!'')}" 
                aria-labelledby="aria-lastName" aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>">
                <span class="mdc-notched-outline">
                    <span class="mdc-notched-outline__leading"></span>
                    <span class="mdc-notched-outline__notch">
                        <span class="mdc-floating-label ${properties.kcLabelClass!}" id="aria-lastName">
                            ${msg("lastName")?no_esc}
                        </span>
                    </span>
                    <span class="mdc-notched-outline__trailing"></span>
                </span>
            </span>
            <#if messagesPerField.existsError('lastName')>
                <div class="error-message ${properties.kcInputErrorMessageClass!}">
                    <span aria-hidden="true" aria-live="polite">
                        ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                    </span>
                </div>
            </#if>   
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
        </form>
    </#if>
</@layout.registrationLayout>
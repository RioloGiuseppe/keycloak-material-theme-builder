<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("registerTitle")?no_esc}
    <#elseif section = "header">
        ${msg("registerTitle")?no_esc}
    <#elseif section = "form">
        <form id="kc-register-form" class="register form ${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
          <input type="text" readonly value="this is not a login form" style="display: none;">
          <input type="password" readonly value="this is not a login form" style="display: none;">

          <#if !realm.registrationEmailAsUsername>
            <span class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon ${properties.kcLabelClass!}">
                <i class="material-icons mdc-text-field__icon mdc-text-field__icon--trailing" tabindex="-1" role="button">person</i>
                <input required id="username" class="mdc-text-field__input ${properties.kcInputClass!}" name="username" type="text" autofocus value="${(register.formData.username!'')}" 
                aria-labelledby="aria-username"
                aria-invalid="<#if messagesPerField.existsError('username')>true</#if>">
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
          </#if>
            <span class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon ${properties.kcLabelClass!}">
                <i class="material-icons mdc-text-field__icon mdc-text-field__icon--trailing" tabindex="-1" role="button">email</i>
                <input required id="email" class="mdc-text-field__input ${properties.kcInputClass!}" name="email" type="text" autofocus value="${(register.formData.email!'')}" 
                aria-labelledby="aria-email"
                aria-invalid="<#if messagesPerField.existsError('email')>true</#if>">
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
            <span class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon ${properties.kcLabelClass!}">
                <i class="material-icons mdc-text-field__icon mdc-text-field__icon--trailing" tabindex="-1" role="button">person</i>
                <input required id="firstName" class="mdc-text-field__input ${properties.kcInputClass!}" name="firstName" type="text" autofocus 
                value="${(register.formData.firstName!'')}" 
                aria-labelledby="aria-firstName" 
                aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>">
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
            <span class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon ${properties.kcLabelClass!}">
                <i class="material-icons mdc-text-field__icon mdc-text-field__icon--trailing" tabindex="-1" role="button">person</i>
                <input required id="lastName" class="mdc-text-field__input ${properties.kcInputClass!}" name="lastName" type="text" autofocus value="${(register.formData.lastName!'')}" 
                aria-labelledby="aria-lastName"
                aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>">
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
            <#if passwordRequired>
                <span class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon ${properties.kcLabelClass!}">
                    <i class="material-icons mdc-text-field__icon mdc-text-field__icon--trailing" tabindex="-1" role="button">lock</i>
                    <input required id="password" class="mdc-text-field__input ${properties.kcInputClass!}" name="password" type="password" autofocus 
                    aria-labelledby="aria-password"
                    aria-invalid="<#if messagesPerField.existsError('password')>true</#if>">
                    <span class="mdc-notched-outline">
                        <span class="mdc-notched-outline__leading"></span>
                        <span class="mdc-notched-outline__notch">
                            <span class="mdc-floating-label ${properties.kcLabelClass!}" id="aria-password">
                                ${msg("password")?no_esc}
                            </span>
                        </span>
                        <span class="mdc-notched-outline__trailing"></span>
                    </span>
                </span>
                <#if messagesPerField.existsError('password')>
                    <div class="error-message ${properties.kcInputErrorMessageClass!}">
                        <span aria-hidden="true" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('password'))?no_esc}
                        </span>
                    </div>
                </#if> 
                <span class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon ${properties.kcLabelClass!}">
                    <i class="material-icons mdc-text-field__icon mdc-text-field__icon--trailing" tabindex="-1" role="button">lock</i>
                    <input required id="password-confirm" class="mdc-text-field__input ${properties.kcInputClass!}" name="password-confirm" type="password" autofocus 
                    aria-labelledby="aria-password-confirm"
                    aria-invalid="<#if messagesPerField.existsError('passwordConfirm')>true</#if>">
                    <span class="mdc-notched-outline">
                        <span class="mdc-notched-outline__leading"></span>
                        <span class="mdc-notched-outline__notch">
                            <span class="mdc-floating-label ${properties.kcLabelClass!}" id="aria-password-confirm">
                                ${msg("passwordConfirm")?no_esc}
                            </span>
                        </span>
                        <span class="mdc-notched-outline__trailing"></span>
                    </span>
                </span>
                <#if messagesPerField.existsError('passwordConfirm')>
                    <div class="error-message ${properties.kcInputErrorMessageClass!}">
                        <span aria-hidden="true" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('passwordConfirm'))?no_esc}
                        </span>
                    </div>
                </#if> 
            </#if>

            <#if recaptchaRequired??>
            <div class="form-group">
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </div>
            </#if>
            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                        <div class="${properties.kcFormButtonsWrapperClass!}">
                            <a class="mdc-button mdc-button--outlined fullwidth my" href="${url.loginUrl}">
                                <span class="mdc-button__ripple"></span>
                                ${msg("backToLogin")?no_esc}
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
                                ${msg("doRegister")?no_esc}
                            </button>
                        </div>
                        <div class="clearfix"></div>
                    </div> 
                </div>
            </div>

        </form>
    </#if>
</@layout.registrationLayout>
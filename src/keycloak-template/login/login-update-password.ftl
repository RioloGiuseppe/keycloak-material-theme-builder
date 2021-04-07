<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "title">
        ${msg("updatePasswordTitle")?no_esc}
    <#elseif section = "header">
        ${msg("updatePasswordTitle")?no_esc}
    <#elseif section = "form">
        <form id="kc-passwd-update-form" class="form update-password ${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <input type="text" readonly value="this is not a login form" style="display: none;">
            <input type="password" readonly value="this is not a login form" style="display: none;">
            <span class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon ${properties.kcLabelClass!}">
                <i class="material-icons mdc-text-field__icon mdc-text-field__icon--trailing" tabindex="-1" role="button">lock</i>
                <input required id="password-new" class="mdc-text-field__input ${properties.kcInputClass!}" name="password-new" type="text" autofocus 
                autocomplete="off" aria-labelledby="aria-password-new" aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>">
                <span class="mdc-notched-outline">
                    <span class="mdc-notched-outline__leading"></span>
                    <span class="mdc-notched-outline__notch">
                        <span class="mdc-floating-label ${properties.kcLabelClass!}" id="aria-password-new">
                            ${msg("passwordNew")?no_esc}
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
                <input required id="password-confirm" class="mdc-text-field__input ${properties.kcInputClass!}" name="password-confirm" type="text" autofocus
                 autocomplete="off"  aria-labelledby="aria-password-confirm" aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>">
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
            <#if messagesPerField.existsError('password-confirm')>
                <div class="error-message ${properties.kcInputErrorMessageClass!}">
                    <span aria-hidden="true" aria-live="polite">
                        ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                    </span>
                </div>
            </#if> 
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
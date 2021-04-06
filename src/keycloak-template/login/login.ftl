<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>

    <#if section = "title">
         ${msg("loginTitle",(realm.displayName!''))?no_esc}
    <#elseif section = "header">
	<span class="title">
        ${msg("loginTitle",(realm.displayName!''))?no_esc}
    </span>
    <#elseif section = "form">
        <#if realm.password>
            <form id="kc-form-login" class="form ${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                <div class="username-container ${properties.kcFormGroupClass!}">
                    <div class="${properties.kcInputWrapperClass!}">
                        <span class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon ${properties.kcLabelClass!} <#if usernameEditDisabled??>mdc-text-field--disabled</#if>">
                            <i class="material-icons mdc-text-field__icon mdc-text-field__icon--trailing" tabindex="-1" role="button">person</i>
                            <input required id="username" class="mdc-text-field__input ${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" aria-labelledby="aria-username" <#if usernameEditDisabled??>disabled</#if> >
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
                    </div>
                </div>
                <div class="password-container ${properties.kcFormGroupClass!}">
                    <div class="${properties.kcInputWrapperClass!}">
                        <span class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon ${properties.kcLabelClass!}">
                            <i class="material-icons mdc-text-field__icon mdc-text-field__icon--trailing" tabindex="-1" role="button">lock</i>
                            <input required id="password" class="mdc-text-field__input ${properties.kcInputClass!}" name="password" type="password" autocomplete="off"  aria-labelledby="aria-password">
                            <span class="mdc-notched-outline">
                                <span class="mdc-notched-outline__leading"></span>
                                <span class="mdc-notched-outline__notch">
                                    <span class="mdc-floating-label ${properties.kcLabelClass!}" id="aria-password">
                                         ${msg("password")}
                                    </span>
                                </span>
                                <span class="mdc-notched-outline__trailing"></span>
                            </span>
                        </span>
                    </div>
                    <div id="capsLockWarning" style="font-weight: bold; color: maroon; margin: 0 0 10px 0; display: none;">
                      <i class="fa fa-exclamation-triangle" style="color: #f0ad4e"></i>
					  ${msg("capsLockWarning")}
                    </div> 
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="mdc-form-field fullwidth">
                                <div class="mdc-checkbox">
                                <input type="checkbox" class="mdc-checkbox__native-control" id="rememberMe" <#if login.rememberMe??>checked</#if>/>
                                <div class="mdc-checkbox__background">
                                    <svg class="mdc-checkbox__checkmark" viewBox="0 0 24 24">
                                        <path class="mdc-checkbox__checkmark-path" fill="none" d="M1.73,12.91 8.1,19.28 22.79,4.59" />
                                    </svg>
                                    <div class="mdc-checkbox__mixedmark"></div>
                                </div>
                                <div class="mdc-checkbox__ripple"></div>
                                </div>
                                <label for="rememberMe">${msg("rememberMe")}</label>
                            </div>
                        </#if>
                        <#if realm.resetPasswordAllowed>
                            <div class="mdc-form-field fullwidth">
                                <a href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="${properties.kcFormGroupClass!}">
                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                            <div class="${properties.kcFormButtonsWrapperClass!}">
                                <button class="mdc-button mdc-button--raised ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!} fullwidth" name="login" id="kc-login" type="submit">
                                    ${msg("doLogIn")}
                                </button>
                            </div>
                            <div class="clearfix"></div>
                        </div> 
                    </div>
                </div>
                <hr class="separator" />
                <div class="${properties.kcFormGroupClass!}">
                    <#if realm.password && social.providers??>
                        <div id="kc-social-providers">
                            <#list social.providers as p>
                                <a class="mdc-button mdc-button--outlined zocial ${p.providerId}" href="${p.loginUrl}" id="zocial-${p.alias}" title="${p.displayName}">
                                <span class="mdc-button__ripple"></span>
                                <i class="material-icons mdc-button__icon" aria-hidden="true">${p.providerId}</i>
                            </a>
                            </#list>
                        </div>
                    </#if>
                </div>
            </form>
        </#if>
    <#elseif section = "info" >
        <div class="${properties.kcFormGroupClass!}">
            <#if (realm.password && realm.registrationAllowed && !usernameEditDisabled??) || realm.resetPasswordAllowed>
                
                <div>
                    <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
                        <div id="kc-registration" <#if realm.password && realm.registrationAllowed && !usernameEditDisabled?? && realm.resetPasswordAllowed>style="margin: 10px 0px; text-align: right;"</#if>>
                            <span>${msg("noAccount")} <a href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                        </div>
                    </#if>
                </div>
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>

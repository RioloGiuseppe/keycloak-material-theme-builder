<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width,initial-scale=1">

    <link rel="apple-touch-icon" sizes="57x57" href="${url.resourcesPath}/img/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="${url.resourcesPath}/img/apple-touch-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="${url.resourcesPath}/img/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="${url.resourcesPath}/img/apple-touch-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="${url.resourcesPath}/img/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="${url.resourcesPath}/img/apple-touch-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="${url.resourcesPath}/img/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="${url.resourcesPath}/img/apple-touch-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="167x167" href="${url.resourcesPath}/img/apple-touch-icon-167x167.png">
    <link rel="apple-touch-icon" sizes="180x180" href="${url.resourcesPath}/img/apple-touch-icon-180x180.png">
    <link rel="apple-touch-icon" sizes="1024x1024" href="${url.resourcesPath}/img/apple-touch-icon-1024x1024.png">
    <link rel="apple-touch-startup-image" media="(device-width: 320px) and (device-height: 480px) and (-webkit-device-pixel-ratio: 1)" href="${url.resourcesPath}/img/apple-touch-startup-image-320x460.png">
    <link rel="apple-touch-startup-image" media="(device-width: 320px) and (device-height: 480px) and (-webkit-device-pixel-ratio: 2)" href="${url.resourcesPath}/img/apple-touch-startup-image-640x920.png">
    <link rel="apple-touch-startup-image" media="(device-width: 320px) and (device-height: 568px) and (-webkit-device-pixel-ratio: 2)" href="${url.resourcesPath}/img/apple-touch-startup-image-640x1096.png">
    <link rel="apple-touch-startup-image" media="(device-width: 375px) and (device-height: 667px) and (-webkit-device-pixel-ratio: 2)" href="${url.resourcesPath}/img/apple-touch-startup-image-750x1294.png">
    <link rel="apple-touch-startup-image" media="(device-width: 414px) and (device-height: 736px) and (orientation: landscape) and (-webkit-device-pixel-ratio: 3)" href="${url.resourcesPath}/img/apple-touch-startup-image-1182x2208.png">
    <link rel="apple-touch-startup-image" media="(device-width: 414px) and (device-height: 736px) and (orientation: portrait) and (-webkit-device-pixel-ratio: 3)" href="${url.resourcesPath}/img/apple-touch-startup-image-1242x2148.png">
    <link rel="apple-touch-startup-image" media="(device-width: 768px) and (device-height: 1024px) and (orientation: landscape) and (-webkit-device-pixel-ratio: 1)" href="${url.resourcesPath}/img/apple-touch-startup-image-748x1024.png">
    <link rel="apple-touch-startup-image" media="(device-width: 768px) and (device-height: 1024px) and (orientation: landscape) and (-webkit-device-pixel-ratio: 2)" href="${url.resourcesPath}/img/apple-touch-startup-image-1496x2048.png">
    <link rel="apple-touch-startup-image" media="(device-width: 768px) and (device-height: 1024px) and (orientation: portrait) and (-webkit-device-pixel-ratio: 1)" href="${url.resourcesPath}/img/apple-touch-startup-image-768x1004.png">
    <link rel="apple-touch-startup-image" media="(device-width: 768px) and (device-height: 1024px) and (orientation: portrait) and (-webkit-device-pixel-ratio: 2)" href="${url.resourcesPath}/img/apple-touch-startup-image-1536x2008.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${url.resourcesPath}/img/favicon-16x16.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${url.resourcesPath}/img/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="228x228" href="${url.resourcesPath}/img/coast-228x228.png">
    <link rel="shortcut icon" href="${url.resourcesPath}/img/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="apple-mobile-web-app-title">
    <meta name="application-name">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="msapplication-TileImage" content="${url.resourcesPath}/img/mstile-144x144.png">
    <meta name="msapplication-config" content="${url.resourcesPath}/img/browserconfig.xml">
    <link rel="manifest" href="${url.resourcesPath}/img/manifest.json">
    <link rel="yandex-tableau-widget" href="${url.resourcesPath}/img/yandex-browser-manifest.json">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title><#nested "title"></title>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body class="${properties.kcBodyClass!} template">


    <div id="kc-container" class="${properties.kcContainerClass!}">
        <div id="kc-container-wrapper" class="${properties.kcContainerWrapperClass!}">
           <div id="kc-content" class="mdc-card ${properties.kcContentClass!}">
                
                <div id="kc-header" class="${properties.kcHeaderClass!}">
                    <img src="${url.resourcesPath}/img/logo.svg">
                    <#nested "header">
                </div>
 
                <div id="kc-content-wrapper" class="${properties.kcContentWrapperClass!}">

                    <#if displayMessage && message?has_content>
                        <div class="${properties.kcFeedbackAreaClass!}">
                            <div class="alert alert-${message.type}">
                                <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                                <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                                <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                                <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                                <span class="kc-feedback-text">${message.summary}</span>
                            </div>
                        </div>
                    </#if>

                    <div id="kc-form" class="${properties.kcFormAreaClass!}">
                        <div id="kc-form-wrapper" class="${properties.kcFormAreaWrapperClass!}">
                            <#nested "form">
                        </div>
                    </div>

                    <#if displayInfo>
                        <div id="kc-info" class="${properties.kcInfoAreaClass!}">
                            <div id="kc-info-wrapper" class="kc-info-wrapper ${properties.kcInfoAreaWrapperClass!}">
                                <#nested "info">
                            </div>
                        </div>
                    </#if>
                </div>

                <#if realm.internationalizationEnabled>
                    <div id="kc-locale" class="${properties.kcLocaleClass!}">
                        <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                            <div class="kc-dropdown language-picker" id="kc-locale-dropdown">
                                <div class="mdc-select mdc-select--outlined mdc-select--with-leading-icon">
                                    <div class="mdc-select__anchor">
                                        <i class="material-icons mdc-select__icon" tabindex="0" role="button">language</i>
                                        <span class="mdc-notched-outline">
                                            <span class="mdc-notched-outline__leading"></span>
                                            <span class="mdc-notched-outline__notch"> </span>
                                            <span class="mdc-notched-outline__trailing"></span>
                                        </span>
                                        <span class="mdc-select__selected-text-container">
                                            <span
                                            id="demo-selected-text"
                                            class="mdc-select__selected-text"
                                            ></span>
                                        </span>
                                        <span class="mdc-select__dropdown-icon">
                                            <svg
                                            class="mdc-select__dropdown-icon-graphic"
                                            viewBox="7 10 10 5"
                                            focusable="false"
                                            >
                                            <polygon
                                                class="mdc-select__dropdown-icon-inactive"
                                                stroke="none"
                                                fill-rule="evenodd"
                                                points="7 10 12 15 17 10"
                                            ></polygon>
                                            <polygon
                                                class="mdc-select__dropdown-icon-active"
                                                stroke="none"
                                                fill-rule="evenodd"
                                                points="7 15 12 10 17 15"
                                            ></polygon>
                                            </svg>
                                        </span>
                                    </div>

                                    <div class="mdc-select__menu mdc-menu mdc-menu-surface mdc-menu-surface--fullwidth">
                                        <ul class="mdc-list" role="listbox" aria-label="Food picker listbox" >
                                            <#list locale.supported as l>
                                                <#if l.label = locale.current>
                                                <li class="mdc-list-item mdc-list-item--selected" aria-selected="true" data-value="" role="option">
                                                    <span class="mdc-list-item__ripple"></span>
                                                    <span class="mdc-list-item__text">
                                                        ${l.label}
                                                    </span>
                                                </li>
                                                <#else>
                                                    <li class="mdc-list-item" aria-selected="false" data-value="${l.url}" role="option">
                                                        <span class="mdc-list-item__ripple"></span>
                                                        <span class="mdc-list-item__text">
                                                            ${l.label}
                                                        </span>
                                                    </li>
                                                </#if>
                                            </#list>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </#if>
            </div>
        </div>
    </div>
</body>
</html>
</#macro>
